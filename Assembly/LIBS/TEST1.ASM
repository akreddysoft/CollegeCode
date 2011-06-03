;16 BIT EXE WITH SIMPLIFIED DIRECTIVES
.386
.model 	small
.stack 	64h
.data
a1	dw	1234h
a2	db	10 dup('$')
.code
start:
	extrn dw2hex:near
	mov	ax,@data
	mov	ds,ax
	mov	ax,8
	push	ax
	mov	ebx,offset a2
	push	bx
	mov	ax,a1
	push	ax
	call	dw2hex
	lea	dx,a2
	call	write
	
	
	jmp	quit
	
write:	
	mov	ah,09h
	int	21h
	ret	
	
quit:
	mov	ax,4c00h
	int	21h

end	start		