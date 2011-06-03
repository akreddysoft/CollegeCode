;16 BIT EXE WITH SIMPLIFIED DIRECTIVES
.model 	small
.stack 	64h
.data
.386
locals
buffer	db	0aah,4bh,45h,34h,34h,23h,78h
buff	db	20 dup(0)
pushcount	db	0
pcount	db	0
count	dw	0
data	dw	0
mult10	dd	10h
.code
;;;;;;;;LASTLT IMPLEMENTED IN BFLOPY2.ASM;;;;;;;;;;;;;;;;;;;;;;;;;
start:
	mov	ax,@data
	mov	ds,ax
	
	mov	cx,3
	push	cx
	mov	bx,offset buff
	push	bx		
	mov	bx,offset buffer
	push	bx
	call	buf2hex
	
	
	mov	cx,6		;no of bytes,this shud be double of above
	push	cx
	lea	bx,buff
	push	bx
	call	asciihex2bcd
;	
;	mov	cx,6h
;	push	cx	;no of ascii bytes to display	;second param
;	lea	bx,buff
;	push	bx	;address of data to display	;first param
;	call	dispchar
	
	jmp	quit
	
;here

        
buf2hex	proc
	push	bp
	mov	bp,sp
	
	push	ax
	push	bx
	push	cx
	push	dx
	push	si
	push	di
	
	mov	si,[bp+4]	;get pointer to data, first param
	mov	di,[bp+6]	;get pointer to buffer	,second param
	mov	cx,[bp+8]	;get count to converted	,third param
	
	
nextbyt:
	mov	pcount,0
	mov	bx,10h
	xor	ax,ax
	mov	al,byte ptr [si]	;get first byte
	
divag:
	xor	dx,dx
	div	bx
	push	dx
	inc	pcount
	cmp	pcount,2
	jne	divag
	
popit:
	pop	dx
	cmp	dl,9h
	ja	char
	add	dl,30h
	jmp	cont
	
char:	
	add	dl,37h			
cont:	
	mov	[di],dl
	inc	di		;point to next empty pos
	dec	pcount
	jnz	popit
	
	inc	si		;point to next byte
	dec	cx
	jnz	nextbyt
	
	pop	di
	pop	si
	pop	dx
	pop	cx
	pop	bx
	pop	ax
	
	pop	bp
	ret	6
buf2hex	endp

asciihex2bcd	proc
	push	bp
	mov	bp,sp
	
	mov	ax,[bp+4]	;get pointer to ascii bytes
	mov	data,ax
	mov	bx,ax
	mov	ax,[bp+6]	;get count of ascii bytes to be converted
	mov	count,ax
	
	xor	ax,ax
	xor	si,si
	xor	cx,cx
@@packit:
	mov	al,byte ptr [bx+si]
	cmp	al,39h
	ja	@@char
	sub	byte ptr [bx+si],30h
	jmp	@@cont
	
@@char:
	sub	byte ptr [bx+si],37h
@@cont:
	inc	si
	inc	cx
	cmp	cx,count
	jne	@@packit
	
	mov	bx,data
	mov	si,count
	dec	si
	mov	cl,1
	xor	di,di
	
loop3:               ;packing of bcd
	mov	al,byte ptr [bx+si]	
	mul	cx
	push	eax
	inc	di
;;;;;;;;;;;;;;;;;;;;;;;;;
	mov	eax,ecx
	mul	mult10
	mov	ecx,eax
;;;;;;;;;;;;;;;;;;;;;;;	
	dec	si
	cmp	si,-1
	jne	loop3	

	xor	ax,ax
loop4:
	pop	ecx
	add	eax,ecx
	dec	di
	jnz	loop4

	xor	bx,bx
loop5:			;main conversion
	mov	cx,10
	xor	dx,dx
	div	cx
	push	dx
	inc	bx        ;c
	cmp	ax,0
	jne	loop5
	
disp2:
	pop	dx
	dec	bx
	add	dl,30h
	mov	ah,02h
	int	21h
	cmp	bx,0
	jne	disp2

			
	pop	bp
	ret	4
asciihex2bcd	endp		

dispchar	proc
	push	bp
	mov	bp,sp
	
	push	ax
	push	cx
	push	dx
	push	si
	
	xor	dx,dx
	mov	si,[bp+4]	;get pointer to data
	mov	cx,[bp+6]	;GET COUNT
	mov	ah,02h
dispag:
	mov	dl,[si]
	int	21h
	inc	si
	dec	cx
	jnz	dispag

	pop	si
	pop	dx
	pop	cx
	pop	ax
	
	pop	bp
	ret	4
dispchar	endp

	
quit:
	mov	ax,4c00h
	int	21h

end	start		