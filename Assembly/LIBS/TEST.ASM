;16 BIT EXE WITH SIMPLIFIED DIRECTIVES
;;set the location of the stack,whenit isnot provided

;p186
includelib getlen.obj
includelib dw2hex.obj

stack1 	segment stack
dw	64 dup(1)
stack1	ends
extrn	dw2hex:near		;3 diff machine codes :far ,:near,:none how ;see what makes diff
extrn	getlen:near
				;for none i think it assumes that its word val rather then proc
code2	segment byte 	 'code2'
assume	cs:code2,ds:data,ss:stack1
start:
	mov	ax,data
	mov	ds,ax
	mov	ax,4h
	push	ax
	mov	ax,offset buff
	push	ax
	push	a2
	call	dw2hex
	lea	dx,buff	
	call	write
	mov	bx,'$'
	push	bx
	mov	ax,offset buff
	push	ax
	
	call	getlen
	
	
	jmp	quit
	
write:	
	mov	ah,09h
	int	21h
	ret	
	
quit:
	mov	ax,4c00h
	int	21h
code2	ends



data	segment
a2	dw	1234h
buff	db	10 dup(0),'$'
data	ends

end	start