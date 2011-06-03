;FOCUSES ON INCREMENTS,DECREMENTS AND UNUSUAL THINGSs
.model 	small                                         
.stack                                 
.const     ;this segment although defined earlier , is placed after data
tile	db	12h
.data                                                 
a2	dw	1234h
a3	dd	12345678h
.code                                                 
start:                                                
	mov	ax,@data                              
	mov	ds,ax                
	mov	ax,ds:[0]


	                                              
quit:                                                 
	mov	ax,4c00h                                
	int	21h                                   
	                                              
end	start		                              
