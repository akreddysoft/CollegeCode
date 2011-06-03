;16 BIT COM WITH SIMPLIFIED DIRECTIVES
;.386
;.model	tiny
CODE SEGMENT byte
assume cs:code,ds:code
org	100h
start:
	jmp	main
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
int9	dd	0
err1	db	'TSR Already loaded$'
loaded	db	'TSR Loaded$'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

tsr:
	push	ds
	push	ax
	push	bx
	push	cx
	push	dx
	push	bp
	push	es
	push	si
	push	di
	
        in      al,60h   	  ;get keystroke from port(scancode)
        cmp     al,3ch 			;->check if f2
        je      dowork
        cmp     al,55h 		 ;check if f2 with caps lock on
        je      dowork
        
endit:        
        pop	di
        pop	si
        pop	es
        pop	bp
        pop	dx
        pop	cx
        pop	bx
        pop	ax
        pop	ds
        jmp	cs:int9		;if another key, jump to original routine
        	

dowork:
	mov	ah,03
	mov	bh,01
	int	10h		;get current cursor pos
	
	cmp	dl,9
	jl	endit
	
	sub	dl,08h		;sub 8 spaces 
	mov	ah,02h
	int	10h	
	
	jmp	endit	
		
	
main:
	cli
	mov	ah,35h
	mov	al,09h
	int	21h
	mov	cx,es
	cmp	cx,word ptr [int9+2]
	jne	continue
	cmp	bx,word ptr [int9]
	je	exit
		
continue:
	
	mov	word ptr int9,bx 	;save the original address
	mov	word ptr int9+2,es	;saved the lower address first
					;bcoz to be used in jmp cs:int9
			
	
	lea	dx,tsr			;set int 09 to our address	
	mov	ah,25h
	mov	al,09h
	int	21h
	
	xor	bx,bx
	mov	ah,35h
	mov	al,09h
	int	21h
	
	lea	dx,loaded		;display success
	call	write
	
	mov	ah,31h			;terminate and stay resident
	mov	al,0
	mov	dx,offset main
	sti
	int	21h
	
exit:
	lea	dx,err1
	int	21h
	call	quit


write:
	mov	ah,09h
	int	21h
	ret	
	
quit:
	mov	ax,4ch
	int	21h
code	ends
end	start	