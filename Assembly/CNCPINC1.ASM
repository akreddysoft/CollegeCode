;CONCEPT SERIES
;FOCUSES ON INCREMENTS
.model small
.data
a1 	db 	12h
a2 	dw 	1234h
a3 	dd 	12345678h
a4 	db 	0
a5 	dw 	0
a6 	dd 	0
mult	dw	1h,10h,100h,1000h    ;see how it goes into memory

				     ;01 00  10 00  00 01  00 10
				     ;0  1   2  3   4  5   6  7
;above mul				 
;above individual reversing of dw's takes places
;above def is similar to 
mult5	dw	1h
	dw	10h
	dw	100h
	dw	1000h
;as wee see allt the 4 definition of dw are independent of each other
;and the defintion of the words takes in the same sequence as defined	
;the reversing takes place of the individual bytes of the definition of the word
;for ex in mult3 ,each byte is reversely stored,see that 78 will never be stored as 87
mult1	dw	1234h
mult2	dw	12h,34h
mult3	dd	12345678h         ;it will be stored as= 78 56 34 12
;see that each byte from the last byte is reversely stored
;above mult1 will be stored as 3412 while mult2 as 1200,3400
;in mult2 
.code
start:
	mov 	ax,@data
	mov     ds,ax
	;;;;;;;;;;;;;;;;;;;;;;;;
	mov     bx,offset a1
	inc     byte ptr bx
	inc     word ptr bx
	inc     dword ptr bx
	;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov     bx,offset a1
	inc     byte ptr [bx]        ;this is diff from abobe
	inc     word ptr [bx]		;here bx is representing the content of the addre
					;of bx
	;inc     dword ptr [bx]
	;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov     bx,offset a3
	inc     byte ptr [bx]
	inc     word ptr [bx]
	;inc     dword ptr [bx]
	;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov     bx,offset a2
	inc     byte ptr bx
	inc     word ptr bx
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov     bx,offset a2
	inc     byte ptr [bx]
	inc     word ptr [bx]
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	call    clear
	mov     ah,byte ptr a3
	mov     ax,word ptr a3
	call    clear
	lea     bx,a3                      ; mov bx,offset a3
	mov     ah,byte ptr [bx]
	mov     ax,word ptr [bx]
	;mov    eax,dword ptr [bx]
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	int	3			;see that here breakpoint is set
	mov	ax,02h
	mov	bh,byte ptr mult[6]
	mov	bl,byte ptr mult[5]
	mov	bx,word ptr mult[5]
	mov	bx,word ptr mult[6]
	mul	bx
	jmp	quit
	
clear:
	xor     ax,ax
	xor     bx,bx
	xor     cx,cx
	ret
	
quit:
	mov     ah,4ch
	int     21h
end     start
