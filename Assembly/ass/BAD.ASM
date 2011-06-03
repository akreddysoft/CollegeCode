;PROGRAM TO TEST A DISK FOR PHYSICAL ERRORS
;MADHUR AHUJA
;TE IT
;BVP - INDIA
locals
jumps
.model 	small
put macro m1
	push	dx
	push	ax
	lea	dx,m1
	mov	ah,09h
	int	21h
	pop	ax
	pop	dx
endm
.stack 	64h
.data
;##########################333
msg2	db	10,13,"Cylinder Number.........."
msg3	db	10,13,"Head Number.............."
msg5	db	10,13,"Physical Sector.........."
msg6	db	10,13,"Logical Sector..........."
msg7	db	10,13,"Bad Sectors..............$"
cyl	db	0	
head	db	0
physec	db	0
logsec	dw	0
badcount	dw	0
;##############################
space	db	20h,20h,20h,'$'
abs1	db	0	
inc1	db	1,1,1,2
count	dw	2880
buffer	db	5 dup(0)
db1	db	2
dw1	dw	4
TOADD	EQU	25
err1	db	10,13,"unknown error:exiting$"
cnt	db	3
remain	dw	0
.code
start:
	mov	ax,@data
	mov	ds,ax
	
	mov 	ax,0600h
        mov 	bh,07h
        mov 	cx,0000h
        mov 	dx,184fh
        int 	10h			;clrscr

	xor	dx,dx
	call	setcursor
	put	msg2

here:	
	xor	bx,bx
	xor	dx,dx
	
	mov	ax,logsec
	mov	bl,36
	div	bx
	mov	cyl,al		
	mov	abs1,dl

	xor	ax,ax
	mov	al,abs1
	mov	bl,18
	div	bl
	mov	head,al	
	
	inc	ah
	mov	physec,ah
	
	mov	di,offset cyl
	mov	si,offset inc1
	mov	bx,offset buffer
        mov     dh,1            ;set cursor position
	mov	dl,25
loopit:
	call	setcursor
	xor	ax,ax
        cmp     dh,4
	je	itsword
	mov	al,byte ptr [di]
	jmp	cont1
itsword:
	mov	ax,[di]		;for logical sector
cont1:
	push	bx
	push	ax
	call	dw2hex
	put	buffer
	put	space
	
	xor	cx,cx
	mov	cl,byte ptr [si]
	add	byte ptr di,cx
	inc	si
	inc	dh
	cmp	dh,6
	jne	loopit

	mov	ax,0401h
	mov	ch,cyl
	mov	cl,physec
	mov	dh,head
	xor	dl,dl
	int	13h		;test for bad
	jc	bad
notbad:
	inc	logsec
	dec	count
	jnz	here
	jmp	quit
bad:
	cmp	ah,80h		;cause for error
	jne	cont
	put	err1
	jmp	quit
cont:
	inc	badcount
	jmp	notbad

	jmp	quit

;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
dw2hex	proc
	push	bp
	mov	bp,sp

	push	ax
	push	bx
	push	cx
	push	dx
	push	si
	push	di

	xor	bx,bx
	xor	di,di
	mov	si,[bp+6]	;get the pointer to the ascii string to be filled
	mov	ax,[bp+4]	;get the word to be converted to ascii
	mov	bl,10
@@divide:
	xor	dx,dx
	div	bx
	push	dx
	inc	di
	cmp	ax,0
	jne	@@divide

@@store:
	pop	dx
	cmp	dx,9
	ja	@@char
	add	dx,30h
	jmp	@@cont
@@char:
	add	dx,37h
@@cont:
	mov	[si],dl
	inc	si
	dec	di
	jnz	@@store

	mov	byte ptr [si],'$'
	pop	di
	pop	si
	pop	dx
	pop	cx
	pop	bx
	pop	ax
	
	pop	bp
	ret	4		;total bytes of parameters pushed
dw2hex	endp

setcursor proc               ; [ definition of setcursor proc. ]
        push	ax
        push	bx
        mov 	ah,02
        mov     bh,00h
        int 	10h
        pop	bx
        pop	ax
        ret
setcursor endp

quit:
	mov	ax,4c00h
	int	21h
end	start
