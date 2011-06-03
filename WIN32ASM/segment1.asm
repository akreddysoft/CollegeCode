;16 BIT EXE WITH SIMPLIFIED DIRECTIVES
;.386
.model 	small
.stack 	64h
.data
a2	db	"madhur",0
.code
start:
	mov	ax,@data
	mov	ds,ax
	mov	ax,[0]
	
	
	
	
quit:
	mov	ax,4c00h
	int	21h

end	start		