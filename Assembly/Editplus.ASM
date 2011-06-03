;16 BIT EXE WITH SIMPLIFIED DIRECTIVES                
.386
.model 	small                                         
.stack                                 
.data                                                 
data	dd	100 dup(0)                                                      
name1	db	'madhur',0
.code                                                 
start:                                                
	mov	ax,@data                              
	mov	ds,ax                                 
	lea	edi,name1
	xor	esi,esi
	mov	ecx,80h
	xor	eax,eax
	mov	edi,04fcaebh
	xor	esi,esi
	repe	stosd
	mov	edx,04fcae8h
last:
	mov	eax,0c0c1h
	mov	ecx,1h
there:
	test	esi,ecx
	jz	here
	xor	[data],eax
here:	
	add	eax,eax
	shl	ecx,1
	xor	eax,4003h
	cmp	ecx,100h
	jl	there
	add	edx,2
	inc	esi
	cmp	edx,0fcce8h
	jl	last	

	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	xor	eax,eax
	lea	ecx,name1
above:
	mov 	edx, eax              ; edx is zero
	xor	ebx, ebx              ; ebx is zero
	mov 	bl, [ecx]             ; bl gets first char
	and 	edx, 0FFh             ; do some maths...
	xor 	edx, ebx
	xor 	ebx, ebx
	mov 	bl, ah
	mov 	ax, [edx*2+004fcae8h]
	xor 	ax, bx
	inc 	ecx
	cmp 	ecx, esi              ; is end of name reached
	jb  	above

		                                              
	mov	ax,4c00h                                
	int	21h                                   
	                                              
end	start		                              
