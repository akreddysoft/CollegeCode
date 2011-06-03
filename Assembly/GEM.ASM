;16 BIT EXE WITH SIMPLIFIED DIRECTIVES
.model 	small
.stack 	64h
include macro.inc
.data

.code
start:
	mov	ax,@data
	mov	ds,ax
	printf('df fd')
	
	
	jmp	quit
	
write:	
	mov	ah,09h
	int	21h
	ret	
	
quit:
	mov	ax,4c00h
	int	21h

end	start		