;********************************************************
;	PROGRAM TO VIEW THE INTERRUPT VECTOR ADDRESSES
;			OF THE PC
;====================================================			
;		      MADHUR AHUJA
;		        BVP,PUNE
;Assemble with : Tasm 
;Link with : Tlink
;********************************************************
.model 	small
.stack 	64h
.data
logo	db	10,13,10,13,9,9,'**********************************************'
	DB	10,13,9,9,      '                   IVIEW	               '
	DB	10,13,9,9,      'PROGRAM TO LIST THE INTERRUPT VECTOR ADDRESSES'
	DB	10,13,9,9,      '**********************************************','$'
madhur	db	10,13,10,13,9,9,'Written by Madhur Ahuja in Assembly Language'
	db	10,13,10,13,9,9,'            BVP PUNE - INDIA                '
	DB	10,13,10,13,9,9,'           madhur_ahuja@yahoo.com          $'
contin	db	10,13,10,13,10,13,9,9,'Press Enter key to Contine $'
contin1	db	10,13,'Press any key to view page: $'
count	db	0,0,1
;	int count,line count,page count	
cntas	db	2 dup(0),' ','$'
highad	dw	0h
lowad	dw	0h
address	db	10 dup(0),'$'
ints	db	13,10,'Interrupt Number $'
icon	db	'-> ','$'
crlf	db	13,10,'$'
file	db	'vector.txt',0,0
title1	db	'The interrupt vector addressess as on:',0
date1	db	0,0,':'
time	db	4 dup(0),'$'
handle	dw	0
const1	dw	4
dollar	dw	'$'

.code
start:
	mov	ax,@data
	mov	ds,ax
	lea	dx,logo
	call	write
	lea	dx,madhur
	call	write
	lea	dx,contin
	call	write
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;keyboard loop;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
waitkey:	
	mov	ah,00h
	int	16h
	cmp	al,13
	je	main
	cmp	al,27
	.exit
	jmp	waitkey	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;start of main;;;;;;;;;;;;;;;;;;;;;;;;;;	
main:				;init occurs only once
	call	clrscr
	call	setcursor
;	call	getdatetime
	
	mov	ah,3ch
	lea	dx,file
	mov	cx,0
	int	21h
	mov	handle,ax

	xor	ax,ax
	mov	bx,offset title1

	push	ax
	push	bx
	call	getlen
	
	push	ax
	push	bx
	call	writfil
		
loop1:
	push	word ptr [count]	
	call	getvect

	mov	bx,offset address
	push	const1
	push	bx		;push	word ptr offset address
	push	highad
	call	dw2hex

	mov	[address+4],':'

	mov	bx,offset [address+5]
	push	const1			;why does here push4 doesnt work
	push	bx			;neither push offset address works,study later
	push	lowad
	call	dw2hex	
	
	lea	dx,ints
	call	write
					;mov	ax,length ints
	push	dollar
	push	dx	
	call	getlen			;find the length of ints
	
	push	ax			;length will be returned in ax,which will be pushed
	push	dx			;push the data to write
	call	writfil
		
	mov	ax,2
	mov	bx,offset cntas
	push	ax
	push	bx
	push	word ptr count
	call	dw2hex
	
	mov	dx,bx		;get offset address in dx
	call	write
	
	push	dollar
	push	bx
	call	getlen

	push	ax		;push the length
	push	bx		;push	the data to write
	call	writfil
	
	jmp	cnt

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;JUMP TABLES;;;;;;;;;;;;;;;;;;;
loop2:
	jmp	loop1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
	
cnt:
	lea	dx,icon
	call	write
	
	push	dollar
	push	dx
	call	getlen

	push	ax
	push	dx
	call	writfil
	
	lea	dx,address
	call	write
	
	push	dollar			;try push'$' or with equ
	push	dx
	call	getlen

	push	ax
	push	dx
	call	writfil
	
	inc	[count]
	inc	[count+1]

	cmp	[count+1],24
	jl	skipclear
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;press key to contin	;;;;;;;;;;;;;;;;;;
	lea	dx,contin1
	call	write
	
	mov	ah,02h
	mov	dl,[count+2]
	add	dl,30h
	int	21h
	
	mov	ah,00h
	int	16h

	mov	[count+1],0
	inc	[count+2]	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
skipclear:	
	cmp	count,0ffh
	jne	loop2
	
	mov	ah,3eh
	mov	bx,handle
	int	21h
	
	jmp	quit
	
;;;;;;;;;;;;;;;;;;;;;;;;;end of main;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

getvect proc
	push	bp
	mov	bp,sp
	mov	ah,35h
	mov	al,[bp+4]
	int	21h
	mov	highad,es
	mov	lowad,bx	
	pop	bp
	ret	2
getvect	endp


dw2hex	proc
	push	bp
	mov	bp,sp
	push	ax bx cx dx si di

	xor	bx,bx
	mov	di,[bp+8]	;get the count of the hex digits to be converted
	mov	cx,di		;save the count for later reference
	mov	si,[bp+6]	;get the pointer to the ascii string to be filled
	mov	ax,[bp+4]	;get the word to be converted to ascii		
	mov	bl,10h
@@divide:	
	xor	dx,dx
	div	bx
	push	dx
	dec	di
	cmp	di,0
	jne	@@divide
	
@@store:
	pop	dx
	inc	di
	cmp	dx,9
	ja	@@char
	add	dx,30h
	jmp	@@cont
@@char:
	add	dx,37h
@@cont:
	mov	[si],dl
	inc	si
	cmp	di,cx
	jne	@@store

	pop	di si dx cx bx ax 
	pop	bp
	ret	6		;total bytes of parameters pushed
dw2hex	endp


clrscr proc                    ; [ definition of clear screen proc. ]
        mov 	ax,0600h
        mov 	bh,07h
        mov 	cx,0000h
        mov 	dx,184fh
        int 	10h
        ret
clrscr  endp          

setcursor 	proc                 ; [ definition of setcursor proc. ] 
        mov 	ah,02
        mov 	bh,00h
        mov	dx,0000h
        mov	cx,0000h
        int 	10h
        ret
setcursor	endp              

writfil proc			;we will later push and pop those registers which are used
	push	bp
	mov	bp,sp
	mov	dx,[bp+4]	;get buffer to write
	mov	cx,[bp+6]	;get number of bytes to write
	mov	ah,40h
	mov	bx,handle
	int	21h
	pop	bp
	ret	4
writfil	endp
	
getlen	proc	
	push	bp
	mov	bp,sp
	xor	cx,cx		;init counter
	mov	si,[bp+4]	;get offset of string whose length to find	
	mov	ax,[bp+6]	;get the terminating character
@@count:
	inc	cx		
	inc	si
	cmp	[si],al		;char will be in al as mas ascii=ff
	jne	@@count
	mov	ax,cx		;ax will hold the length after return
	pop	bp
	ret	4
getlen	endp		

write:	
	mov	ah,09h
	int	21h
	ret	
	
quit:
	mov	ax,4c00h
	int	21h
end	start