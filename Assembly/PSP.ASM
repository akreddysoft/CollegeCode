;16 BIT EXE WITH SIMPLIFIED DIRECTIVES                
.model 	small                                         
.stack  32h                               
.data                                                 
include macro.inc                                                      
first	db	10,13,'The first(8 chars)(5b-6c) argument is:',10,13,'$'
second	db	10,13,'The second argument is:',10,13,'$'
show1	db	10,13,'This is the text in the DTA...',10,13,'$'
cmdline	db	11 dup(0)
cmdline1 db	 11 dup(0)
.code                                                 
start:                                                
	mov	ax,@data                              
	mov	ds,ax                                 
	
	mov	ah,62h
	int	21h
	
	mov	es,bx  
	mov	si,6bh
	lea	di,cmdline
	xor	cx,cx
here:
	push	es:[si]
	inc	cx
	dec	si
	cmp	si,5ch
	jne     here                                       
	                                              
	puts	first
there:
	xor	dx,dx
	pop	dx
	mov	cmdline,dl
	putchar	dl
	dec	cx
	jnz	there

hehe:	
	mov	si,0ffh
	xor	cx,cx
@here:
	push	es:[si]
	inc	cx
	dec	si
	cmp	si,80h
	jne     @here                                       
	                                              
	puts	first
@there:
	xor	dx,dx
	pop	dx
	
	putchar	dl
	mov	cmdline1,dl
	dec	cx
	jnz	@there	                     

	jmp	quit	                                              

quit:                                                 
	mov	ax,4c00h                                
	int	21h                                   
	                                              
end	start		                              
