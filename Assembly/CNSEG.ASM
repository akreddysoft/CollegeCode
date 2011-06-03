;16 BIT EXE WITH SIMPLIFIED DIRECTIVES
.model 	small
.stack 	64h
.data
madhur	db	6 dup(0)

a2	db	34h
a3	db	65h
.code
start:
	mov	ax,@data
	mov	ds,ax
	mov	ax,offset a2
	mov	bx,offset cs:a2
	
	lea	cx,a3
	lea	dx,cs:a3
	
quit:
	mov	ax,4c00h
	int	21h

end	start		





