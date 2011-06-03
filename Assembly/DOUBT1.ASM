;16 BIT EXE WITH SIMPLIFIED DIRECTIVES                
.model 	small                                         
.stack                                 
.data                                                 
                                                      
.code                                                 
start:                                                
	mov	ax,@data                              
	mov	ds,ax                                 
	xor	dx,dx
	mov	ah,02
	int	21h
	call	quit
		                                              
	                                              
	                                              
	                                              
write:	                                              
	mov	ah,09h                                
	int	21h                                   
	ret	                                      
	                                              
quit:                                                 
	mov	ax,4c00h                                
	int	21h                                   
	                                              
end	start		                              
