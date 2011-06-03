;16 BIT EXE WITH SIMPLIFIED DIRECTIVES
stack1 	segment word	stack
a	db	64	dup(0)
stack1	ends

data 	segment word
a1	db	'1234$'
data	ends

code	segment	word	public	'code'
start:
assume	cs:code,ss:stack1
	mov	ax,data
	mov	ds,ax
	lea	dx,a1
	call	write
	
	
	jmp	quit
	
write:
	mov	ah,09h
	int	21h
	ret	
	
quit:
	mov	ax,4c00h
	int	21h

code	ends
end	start