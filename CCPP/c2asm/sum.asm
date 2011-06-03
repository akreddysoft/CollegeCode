;16 BIT EXE WITH SIMPLIFIED DIRECTIVES
.model 	small

.code
public _sum
extrn _main
_sum proc
	push	bp
	mov	bp,sp
	mov	ax,[bp+4]
	mov	bx,[bp+6]
	add	ax,bx
	pop	bp
	ret
_sum	endp
end _main