;16 BIT EXE WITH SIMPLIFIED DIRECTIVES                
.model 	small                                         
.stack 	100h                                          
.data                                                 
line	db	0dah,0bfh,0c0h,0d9h,0c4h,0b3h,10,13
line1	db	0c9h,0bbh,0c8h,0bch,0cdh,0bah,10,13
line2	db	0b0h,0b1h,0b2h,0dbh
logo	db	0dah,12 dup(0c4h),0bfh
	db	0b3h,' madhur ahuja',0b3h
	db	0b3h,' madhur ahuja',0b3h
	db	0b3h,' madhur ahuja',0b3h
	db	0b3h,' madhur ahuja',0b3h
	db	0c0h,12 dup(0c4h),0d9h,'$'
logo1	db	0c9h,17 dup(0cdh),0bbh
	db	0bah,' madhur ahuja',0bah
	db	0bah,' madhur ahuja',0bah
	db	0bah,' madhur ahuja',0bah
	db	0bah,' madhur ahuja',0bah
	db	0c8h,17 dup(0cdh),0bch
	
	
.code                                                 
start:                                                
	mov	ax,@data                              
	mov	ds,ax                                 
	lea	dx,line
	call	write
	lea	dx,line1
	call	write	
	lea	dx,logo
	;call	write
	mov	ah,40h
	mov	bx,01
	mov	cx,152
	lea	dx,logo
	;int	21h
	call	quit                                              
	                                              
	                                              
	                                              
write:	                                              
	mov	ah,09h                                
	int	21h                                   
	ret	                                      
	                                              
quit:                                                 
	mov	ax,4c00h                                
	int	21h                                   
	                                              
end	start		                              
