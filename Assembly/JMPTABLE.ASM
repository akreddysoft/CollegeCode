;16 BIT EXE WITH SIMPLIFIED DIRECTIVES                
.model 	small                                         
.stack                                        
.data                                                 
custbl    dw		d00 
		dw d10 
		dw d20 
		dw d30 
		dw d40 
cuscode	db	04	                                                      
.code                                                 
start:                                                
	mov	ax,dgroup                        
	mov	ds,ax                                 
	mov	es,ax
	call	d10jump	
quit:	
	mov	ax,4c00h
	int	21h
	
d10jump:
	mov	bl,cuscode
	xor	bh,bh
	shl	bx,01
	jmp	[custbl+bx]
	
d00:
	mov	ax,1h
	jmp	quit
	
d10:
	mov	bx,1h
	jmp	quit
	
d20:
	mov	dx,1h
	jmp	quit
	
d40:
	mov	cx,2h
	jmp	quit	

d30:
	mov	cx,1
	jmp	quit
	
end	start			
	                                              
write:	                                              
	mov	ah,09h                                
	int	21h                                   
	ret	                                      
	                                              
quit:                                                 
	mov	ax,4c00h                                
	int	21h                                   
	                                              
end	start		                              
