;16 BIT EXE WITH SIMPLIFIED DIRECTIVES
.model 	small
.stack 	64h
.data
buff	db	512 dup(0)
.code
start:
	mov	ax,@data
	mov	ds,ax
	mov	es,ax
	mov	ah,02
	mov	al,1
	mov	cx,0001h
	mov	dh,0
	mov	dl,0h
	lea	bx,buff
	int	13h
	
	xor	si,si
	mov	si,offset buff
	add	si,2bh
	mov	dx,11
	push	dx
	push	si
	call	dispchar

	jmp	quit
	
	
dispchar	proc
	push	bp
	mov	bp,sp
	
	push	ax
	push	cx
	push	dx
	push	si
	
	xor	dx,dx
	mov	si,[bp+4]	;get pointer to data
	mov	cx,[bp+6]	;GET COUNT
	mov	ah,02h
dispag:
	mov	dl,[si]
	int	21h
	inc	si
	dec	cx
	jnz	dispag

	pop	si
	pop	dx
	pop	cx
	pop	ax
	
	pop	bp
	ret	4
dispchar	endp
	
	
	
	jmp	quit
	
quit:
	mov	ax,4c00h
	int	21h

end	start		