;16 BIT EXE WITH SIMPLIFIED DIRECTIVES
.model 	small
.stack 	64h
.data
.386
include macro.inc
buffer	db	20 dup('$')
a1	dd	12345678h
a2	dd	98765432h
const1	dw	8
.code
start:
	mov	ax,@data
	mov	ds,ax
	
	xor	ax,ax
	mov	ax,offset a1
	push	ax
	
	xor	eax,eax
	mov	eax,offset a1
	push	eax
	
	pop	eax
	pop	ax
	
;pascal calling- left to right pushing	
;in this we have used this because the the proc is defined according to the 
;count of bytes to be converted,which is to be remain at constant position.
	mov	bx,offset buffer
	push	a2
	push	bx
	push	const1
;	push	a1
	call	dw2hex
	
	puts	buffer
	jmp	quit



dw2hex	proc
	push	bp
	mov	bp,sp
	push	eax
	push	ebx
	push	ecx
	push	edx
	push	esi
	push	edi
	
	xor	eax,eax
	xor	ecx,ecx
	xor	edx,edx
	xor	esi,esi
	xor	edi,edi
	xor	ebx,ebx
	
        
        
        mov     di,[bp+04h]      ;get the count of the hex digits to be converted
	mov	cx,di		;save the count for later reference
        mov     si,[bp+06h]       ;get the pointer to the ascii string to be filled
      	mov     eax,dword ptr [bp+08h]      ;get the word to be converted to ascii
        cmp	cx,8
        jle	easy
         
	mov	bl,10h
@@divide1:	
	xor	edx,edx
	div	ebx
	push	edx
	dec	edi
	cmp	edi,0
	jne	@@divide1
	
     	
;####################################################################33     	   
        mov     eax,dword ptr [bp+0ch]
easy:        
;        mov     eax,dword ptr [bp+08h]      ;get the word to be converted to ascii   
	mov	bl,10h
@@divide:	
	xor	edx,edx
	div	ebx
	push	edx
	dec	edi
	cmp	edi,0
	jne	@@divide
	
@@store:
	pop	edx
	inc	edi
	cmp	edx,9
	ja	@@char
	add	edx,30h
	jmp	@@cont
@@char:
	add	edx,37h
@@cont:
	mov	[si],dl
	inc	esi
	cmp	edi,ecx
	jne	@@store

	pop	edi
	pop	esi
	pop	edx
	pop	ecx
	pop	ebx
	pop	eax
	pop	ebp
	ret	6		;total bytes of parameters pushed
dw2hex	endp

	
quit:
	mov	ax,4c00h
	int	21h

end	start		