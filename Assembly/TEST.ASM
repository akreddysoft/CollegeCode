;16 BIT EXE WITH SIMPLIFIED DIRECTIVES
.model 	small
.stack 	64h
.data
a2	db	'madhur$'
.code
start:
	mov	ax,@data
	mov	ds,ax
	lea	dx,a2
	call	write
	int	1
	lea	dx,a2
	call	write	
	int	3
	lea	dx,a2
	call	write
	int	2
	lea	dx,a2
	call	write
	;int 	0	;produces illegal fault
	call	quit
	
write:	
	mov	ah,09h
	int	21h
	ret	
	
quit:
	mov	ax,4c00h
	int	21h

end	start		