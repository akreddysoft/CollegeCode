;COM FILE WITH FULL SEGMENTS                 
biodata segment at 40h
	org 17h
kbstat	db	?
biodata	ends

codesg 	segment                              
	assume cs:codesg,ds:biodata
	org 100h                             
main:                                        
	jmp 	initze
savint9	dd	?          
testnum:
	push	ax
	push	cx
	push	ds
	
	mov	ax,biodata
	mov	ds,ax
	mov	al,kbstat
	test	al,00100000b
	jz	exit
	
	in	al,60h
	cmp	al,71h
	jl	exit
	cmp	al,83
	jg	exit
	
	mov	al,10110110b
	out	43h,al
	mov	ax,0100
	out	42h,al
	in	al,61h
	mov	ah,al
	or	al,03
	out	61h,al
	mov	cx,5000	                                     
                                             
pause:
	loop	pause
	mov	al,ah
	out	61h,al

exit:
	pop	ds
	pop	cx
	pop	ax
	jmp	cs:savint9	                                             
                                             
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
initze:
	cli
	mov	ah,35h
	mov	al,09h
	int	21h
	mov	word ptr savint9,bx
	mov	word ptr savint9+2,es
	
	mov	ah,25
	mov	al,09
	mov	dx,offset testnum
	int	21h
	
	mov	ah,31h
	mov	dx,offset initze
	sti
	int	21h
codesg	ends
end	main