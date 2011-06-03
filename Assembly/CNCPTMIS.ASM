;16 BIT EXE WITH SIMPLIFIED DIRECTIVES
;CONCEPT OF UNUSUALS
.model 	small
.stack 	64h
.data

.code
start:
	mov	ax,@data
	mov	ds,ax
	xor	ax,ax
	mov	al,11001011b
	cbw				;see this inst
	mov	bx,offset a1+1
	;call	offset a1		;error:illegal immediate
	;call	bx			
;	mov	bx,quit                 ;r&d on this,can we do on label
	mov	cx,type ax
	MOV	CX,TYPE quit
	
	mov	bx,offset quit1
	call	bx
	
	
	
a1	db	0			;THIS INST INTERFERES WITH THE 
quit:
	mov	ax,4c00h		;OBJECT CODE OF NEXT INST
	int	21h
	
QUIT1:
	MOV	AX,4C00H
	INT	21H	

end	start		