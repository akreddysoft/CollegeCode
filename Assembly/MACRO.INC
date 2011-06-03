puts	macro m1
	push	dx
	push	ax
	lea	dx,m1
	mov	ah,9h
	int	21h
	pop	ax
	pop	dx
endm

gets	macro	m1
	lea	dx,m1
	mov	ah,0ah
	int	21h
endm	

return	macro m1
	mov	eax,m1
	ret
endm	

startup	macro
start:
	mov	ax,@data
	mov	ds,ax
	mov	es,ax
endm

exit	macro
	mov	ax,4c00h
	int	21h
endm		

endup	macro
	end	start
endm	

putchar	macro	char
	mov	dl,char
	mov	ah,02
	int	21h
endm	

strlen	macro	buff
	xor	cx,cx
	mov	cl,buff+1
endm	

m2m	macro m1, m2
	push	m2
	pop	m1
endm
