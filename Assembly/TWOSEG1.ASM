;EXE FILE WITH FULL SEGMENTS                      
;this is ideal method for studying grouping of multiple segmets
;rather than using 2 diff files , use multiple seg in one file
;madhur ahuja
stacksg	segment para stack 'stack'
a	dw 	32(0)
stacksg	ends
                                     

code1 	segment para 'code1'                                  
	assume 	cs:code1,ds:datasg,ss:stacksg,es:datasg     
begin:                                            
	mov	ax,datasg
	mov	ds,ax
	mov	es,ax
	lea	dx,a1
	call	far ptr  write	                
	call	far ptr  quit                
                
code1	ends

datasg	segment para 'data'                                   
a1	db	'madhur','$'                                                  
                                                  
datasg	ends 

;here since 2 seg hav different names a far call is an absolute
;necessity, call must be preceded with far ptr othersise errorrs
;tasm: near jump or call to different cs
;masm: cannot have implicit far jump or near call
;both refers to error that call xx,here xx must be near


;another if the 2 segments have different names
;and diff class they entirely different and no grouping of segments follows

;however if they hgave different names but same class,they are put one
;after another,however we still require a far call

;try here changing the class to code2 and see the link map

code2	segment 'code2'		
assume	cs:code2	;we cannot put here another segment:error cs unreachable from curr segment
write proc            ;here even if i put near the call will be far,since it is explicitly
		     	;mentioned in the call
	mov	ah,09
	int	21h
	retf                                                
           
write endp           
                                                  
                                                  
quit:                                             
	mov 	ah,4ch                                
	int 	21h                                   
code2	ends                                      


end 	begin                                     
