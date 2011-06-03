;PROGRAM TO READ THE FAT CHAIN
;MADHUR AHUJA
;TE IT

;SECTOR 
;0		1-9(9)			10-18(9)		19-32(14)
;boot sector	first fat copy		second fat copy		directory 

jumps
locals
.model small
.stack
.data
dirbuff	db	512*14 dup(0)
fatbuff	db	512*9 dup(0)
fname	db	13,0,13 dup(0)
actname	db	12,0,12 dup(32)
cnt	db	3h
clust	dw	0

dotflag	db	1
msg0	db	10,13,"Reading FAT and Directory...$"
msg01	db	"0%$50%$100%$"
msg1	db	10,13,"Enter the filename:$"
msg2	db	10,13,"Fat Chain:$"
msg3	db	10,13,"End of File:$"

err1	db	10,13,10,13,"Disk not found..."
	db	10,13,"Insert the disk and press enter...$"
err2	db	10,13,"Unknown Error:Exiting...$"
err3	db	10,13,"File not found on the Disk$"
crlf1	db	10,13,"$"

put	macro m1
	lea	dx,m1
	mov	ah,9h
	int	21h
endm

.code
start:
	mov	ax,@data
	mov	ds,ax
	mov	es,ax

tryagain:
	put	msg0
	put	msg01
	
	mov	al,00h
	mov	cx,9
	mov	dx,1
	lea	bx,fatbuff
	int	25h			;get fat
	jc	errhnd
	popf
	
	mov	cx,2
	call	getback
	put	msg01+3
	
	mov	al,00
	mov	cx,13
	mov	dx,19
	lea	bx,dirbuff
	int	25h			;get directory
	jc	errhnd
	popf

	mov	cx,3
	call	getback
	put	msg01+7
	
	put	msg1
	lea	dx,fname
	mov	ah,0ah
	int	21h

	call 	maknam1			;convert name to directory format
	
	cld
	lea	di,dirbuff
	mov	dx,di
	
doagain:
	mov	cx,11
	lea	si,[actname]
	rep	cmpsb
	je	found			
	add	dx,32			;point to next dir entry
	mov	di,dx
	jne	doagain
	jmp	nfound
	

found:
	put	msg2
	add	di,0fh			;point di to first cluster
	mov	ax,[di]		
	mov	clust,ax
	call	dispnum

	mov	cx,3h
nextcluster:	
	mul	cx
	shr	ax,1			;multiply by 1.5

	lea	si,fatbuff		;reset si
	add	si,ax
	mov	ax,[si]
	
	test	clust,01b		;check for even/odd
	jz	eve
	shr	ax,4		;use first three
	jmp	cont

eve:
	and	ax,0fffh	;use last three
cont:
	call	dispnum
	mov	clust,ax	;save for later
	
	cmp	ax,0ff8h	
	jb	nextcluster
	cmp	ax,0fffh
	ja	nextcluster
	jmp	quit		
	
;##############################PROCEDURES##############################	

maknam1 proc				;PROCEDURE TO CONVERT THE FILENAME INTO DIRECTORY FORMAT
	xor	si,si
	xor	cx,cx
	lea	di,fname+2
@@make:
	mov	al,[di]
	cmp	al,61h
	jb	@@cont
	cmp	al,7ah
	ja	@@cont
	and	al,11011111b	
@@cont:
	cmp	al,'.'
	je	@@padspace
	mov	[actname+si],al
	inc	si
	inc	cx
@@continue:		
	inc	di			;skip the dot
	cmp	cl,11			;upto filename length
	jne	@@make
	
	cmp	[fname+1],12
	jne	@@adjust	
	jmp	finish
	
@@padspace:
	mov	dotflag,0		;dot is present
	cmp	cx,8h
	je	@@continue
	inc	si
	inc	cx
	jmp	@@padspace

@@adjust:	
	xor	si,si
	mov	cx,8
	lea	di,[actname]
	mov	al,20H
@@1:
	cmp	al,[di]
	jne	@@ninc
	inc	si
@@ninc:
	inc	di
	dec	cx
	jnz	@@1

	xor	cx,cx
	mov	cl,[fname+1]
	sub	cl,12
	add	cl,dotflag 		;no offect if dot present
	add	cx,si
	
	lea	si,[actname+10]
@@append:
	cmp	cl,0
	jge	finish
	mov	byte ptr [si],20h
	dec	si
	inc	cl
	jmp	@@append	
		
finish:	
	ret
maknam1	endp	

getback proc
	mov	ah,02h
	mov	dx,8h
	int	21h
	dec	cx
	jnz	getback
	ret
getback	endp
	
dispnum proc    ;uses ax dx cx si           ; procedure to convert 16 bit hex no.
        push	ax
        push	cx
        push	dx
        push	si
             
	mov	cx,10h
	xor	si,si
@@normal:       
	xor	dx,dx
	div	cx
	push	dx
	inc	si
	cmp	si,4
	jne	@@normal
	
popagain:
	pop	dx
	cmp	dl,9
	ja	char
	add	dl,30h
	jmp	skip
char:
	add	dl,37h
skip:
	mov	ah,02h
	int	21h
	dec	si
	jnz	popagain
	
	put	crlf1
	
	pop	si
	pop	dx
	pop	cx
	pop	ax
	
	ret	
dispnum endp


;#########################################ERROR HANDLER############
nfound:
	put	err3
	jmp	quit	
	
errhnd:
	cmp	ah,80h
	je	known
	put	err2
	jmp	quit
	
known:
	put	err1
	xor	ah,ah
	int	16h
	dec	cnt
	jz	quit
	jmp	tryagain
	
quit:
	mov	ax,4c00h
	int	21h
end	start	
