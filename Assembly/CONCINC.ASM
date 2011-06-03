;16 BIT EXE WITH SIMPLIFIED DIRECTIVES
;CONCEPT SERIES ON INCREMENTS
.model 	small
.stack 64
.data
a1	db	12h
a2	dw	1234h

.code
start:
	mov	ax,@data
	mov	ds,ax
	inc	byte ptr [a2]     ;1235
	inc 	word ptr [a2]		;1236
	lea	bx,a2
	inc	byte ptr [bx]	;1237
	inc	word ptr [bx]	;1238
	
	call	quit
	
write:	
	mov	ah,09h
	int	21h
	ret	
	
quit:
	mov	ax,004ch
	int	21h

end	start		