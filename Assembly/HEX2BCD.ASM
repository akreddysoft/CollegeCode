.model small
.data
num 	db 	10, 0, 10 dup(0)
hex	db	4 dup(0)
str1 	db 	'enter the num ' ,10,13,'$'
str2	db 	10,13,'not equal' ,10,13,'$'
str3	db 	10,13,'enter another number' ,10,13,'$'
outp	db	10,13,'The answer is:$'
len 	dw 	?
.code
main:
	mov 	ax,_data
	mov 	ds,ax
	lea 	dx,str1
	mov	ah,09h
	int	21h
		
	mov 	ah,0ah
	lea 	dx,num
	int 	21h		;31 32 33 34
	
	xor 	ax,ax
	mov 	al,num+1 
	mov 	len,ax
	xor 	si,si
ascii:
	cmp	[num+2+si],39h
	ja	char1
	sub	[num+2+si],30h
	jmp	cont
char1:
	sub	[num+2+si],37h
cont:	
	inc 	si
	cmp 	si,len
	jne 	ascii


convert:
	mov	si,len
	dec	si
	mov	cl,1
	mov	bx,10h
	xor	di,di
loop3:               ;packing of bcd
	mov	al,[num+2+si]	
	mul	cx
	push	ax
	inc	di
;;;;;;;;;;;;;;;;;;;;;;;;;
	mov	ax,cx
	mul	bx
	mov	cx,ax
;;;;;;;;;;;;;;;;;;;;;;;	
	dec	si
	cmp	si,-1
	jne	loop3	

	xor	ax,ax
loop4:
	pop	cx
	add	ax,cx
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
	
	xor	ax,ax
	lea 	dx,outp
	mov	ah,09h
	int	21h
	
disp2:
	pop	dx
	dec	bx
	add	dl,30h
	mov	ah,02h
	int	21h
	cmp	bx,0
	jne	disp2

quit:
	mov 	ax,4c00h
	int 	21h
end 	main	
