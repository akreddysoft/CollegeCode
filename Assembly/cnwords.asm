;16 BIT EXE WITH SIMPLIFIED DIRECTIVES
.model 	small
.stack 	64h
.data
a1	db	12h
a2	dw	7689h
a3	dd	12345678h
.code
start:
	mov	ax,@data
	mov	ds,ax
	mov	al,byte ptr [a2]
	mov	cl,byte ptr [a3+2]
	mov	dx,word ptr [a3]
	
	mov	ax,1234
	cmp	ax,word ptr a3
	
	mov	ax,3421
	cmp	ax,word ptr a3
	
	mov	cx,word ptr a3+1
	
	mov	dx,word ptr a3+2
	
	mov	ah,byte ptr a2+1
	
	
	
	
	
quit:
	mov	ax,4c00h
	int	21h

end	start		