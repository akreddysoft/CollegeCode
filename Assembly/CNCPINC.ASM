;CONCEPT SERIES
;FOCUSES ON INCREMENTS
.model small
.data
a1 	db 12h
a2 	dw 1234h
a3 	dd 12345678h
a4 	db 0
a5 	dw 0
a6 	dd 0
mult	dw	1,10,100,1000
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
	inc     byte ptr [bx]
	inc     word ptr [bx]
	;inc     dword ptr bx
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
	
	
clear:
	xor     ax,ax
	xor     bx,bx
	xor     cx,cx
	ret
	
	
quit:
	mov     ah,4ch
	int     21h
end     start
