;EXE FILE WITH FULL SEGMENTS                      
;this is ideal method for studying grouping of multiple segmets
;rather than using 2 diff files , use multiple seg in one file
;madhur ahuja
;===================================================
stacksg	segment para stack 'stack'
a	dw 	32(0)
stacksg	ends
;===================================================
datasg	segment para 'data'                                   
a1	db	'madhur','$'                                                  
                                                  
datasg	ends                                      
;====================================================                                                  




code	segment 'code1'		

assume	cs:code
write:
	mov	ah,09
	int	21h
	ret                                                
           
                                                  
                                                  
quit:                                             
	mov 	ah,4ch                                
	int 	21h                                   
code	ends                                      


                                     




code1 	segment para 'code1'                                  
	assume 	cs:code1,ds:datasg,ss:stacksg,es:datasg     
begin:                                            
	mov	ax,datasg
	mov	ds,ax
	mov	es,ax
	lea	dx,a1
	call	 write	                
	call	 quit                
                
code1	ends

end 	begin