;16 BIT EXE WITH SIMPLIFIED DIRECTIVES
.model 	small
.stack 	64h
.data
.386
include ..\macro.inc
buffer	db	20 dup('$')
a1	dd	123456h
a3	dw	0200h

.code
start:
	mov	ax,@data
	mov	ds,ax
	
	
;pascal calling- left to right pushing	
;in this we have used this because the the proc is defined according to the 
;count of bytes to be converted,which is to be remain at constant position.
	mov	bx,offset buffer
	push	a1
	push	bx
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
	
        mov     si,[bp+04h]       ;get the pointer to the ascii string to be filled
      	mov     eax,dword ptr [bp+06h]      ;get the word to be converted to ascii

	mov	bl,10h
@@divide:	
	xor	edx,edx
	div	ebx
	push	dx		;we onlu need to push a word
	inc	di
	cmp	eax,0
	jne	@@divide
	
@@store:
	pop	dx			;we pushed a word
	dec	di
	cmp	dx,9
	ja	@@char
	add	dx,30h
	jmp	@@cont
@@char:
	add	dx,37h
@@cont:
	mov	[si],dl
	inc	si
	cmp	di,0
	jne	@@store

	pop	edi
	pop	esi
	pop	edx
	pop	ecx
	pop	ebx
	pop	eax
	pop	bp
	ret	6		;total bytes of parameters pushed
dw2hex	endp
	
quit:
	mov	ax,4c00h
	int	21h

end	start		