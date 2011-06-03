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

;here	since the 2 seg have same name, they must have same class
;a second segment with same name is nothing but the extension of the 
;since the 2 seg have same name,they are combined into one segment
;since they are combined into one segment ,there is no need for the 
;far call, since the far call is needed only for the intersegment calls
;see twoseg1.asm


;here both the segments have been combined into one although
;public option have not been coded
;i think public is required only if segments reside in diff files
;as in case of libraries


code1	segment 'code1'		
;if give other class tasm gives error segments atributes illegaly redefined
;however masm modifies the class to code2


assume	cs:code1
write:
	mov	ah,09
	int	21h
	ret                                                
           
                                                  
                                                  
quit:                                             
	mov 	ah,4ch                                
	int 	21h                                   
code1	ends                                      


end 	begin                                     
