;16 BIT EXE WITH SIMPLIFIED DIRECTIVES                
;.386
.model 	small                                         
.stack                                 
.const
tile	db	12h
.data                                                 
text	db	'hi this is madhur',0                                                      
a3	dd	12345678h
.data?         ;this segment goes far away
a1	db 	?
a2	dw	?
.code                                                 
start:                                                
	mov	ax,@data                              
	mov	ds,ax                
	lea	si,text
	mov	al,text
	mov	a1,al
		a5 db	'madhur$'
	mov	a2,1234h
	inc	a2
	inc	[a2]
	inc	[a2+1]
	inc	[a2]+1
	
	;mov	a3,12345678h
	inc	byte ptr [a3]
	inc	word ptr [a3]          ;this is same as above
	;inc	dword ptr [a3]
	inc	word ptr [a3+1]
	inc	word ptr [a3+2] ;inc dword ptr doesnt work
	inc	byte ptr [a3+3]
	lea	dx,a5
	call	write
	call	quit
		                 
	                                              
	                                              
set	proc
	;mov	a3,12345678h
	ret
set	endp		                                              
	                                              
write:	                                              
	mov	ah,09h                                
	int	21h                                   
	ret	                                      
	                                              
quit:                                                 
	mov	ax,4c00h                                
	int	21h                                   
	                                              
end	start		                              
