.model  small
.data
num 	db 	10, 0, 10 dup(0)
str1 	db 	'enter the num ' ,10,13,'$'
str2	db 	10,13,'not equal' ,10,13,'$'
str3	db 	10,13,'enter another number' ,10,13,'$'
outp	db	10,13,'The answer is:$'
len 	dw 	?
n	dw	0
.code
main:
	mov 	ax,_data
	mov 	ds,ax
	lea 	dx,str1
	mov	ah,09h
	int	21h
		
	mov 	ah,0ah
	lea 	dx,num
	int 	21h			;31 32 33 34
	
	xor 	ax,ax
	mov 	al,num+1 
	mov 	len,ax
	xor 	si,si
ascii:
	sub 	[num+2+si],30h
	inc 	si
	cmp 	si,len
	jne 	ascii			;01 02 03 04

convert	:
	mov	si,len
	mov	bl,1
	mov 	cl,10d
	xor	dx,dx
loop2:
	xor 	ax,ax
	mov 	al,byte ptr [num+1+si]		;al=04
	dec 	si 
	mul 	bx				;04*1
	add	n,ax				;n=4+3*a+2*aa+1*aaa
	;;;;;;;;;;;;;;;;;;;;;
	mov	ax,bx
	mul	cx
	mov	bx,ax				;bx=1*10
	;;;;;;;;;;;;;;;;;;;;;
	cmp 	si,0h
	jne	loop2
	
	mov	ax,n
display1:
	mov	cx,10h
	xor	dx,dx
	div	cx
	push	dx
	inc	si
	cmp	ax,0
	jne	display1
	
	lea	dx,outp
	mov	ah,09h
	int	21h

disp2:
	pop	dx
	dec	si
	cmp	dl,9h
	ja	char
	add	dl,30h
	jmp	cnt
char:
	add	dl,37h
cnt:
	mov	ah,02h
	int	21h
	cmp	si,0
	jne	disp2
	
	mov 	ax,4c00h
	int 	21h
end 	main

;logic
;1234=1*aaa+2*aa+3*a+4*1
