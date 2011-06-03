.model	small
include macro.inc
.stack
.data
first	db	'Enter the first number:$'
second	db	10,13,'Enter the second number:$'
answer	db	10,13,'The answer is:$'
buff1	db	5,0,5 dup(0)
buff2	db	5,0,5 dup(0)
len1	dw	?
len2	dw	?
num1	dw	0
num2	dw	0
num3	dw	0
testnum	dw	0000000000000001b
.code
startup
	printf	first
	gets	buff1
	printf	second
	gets	buff2
	xor	cx,cx
	mov	cl,buff1+1
	mov	len1,cx
	mov	cl,buff2+1
	mov	len2,cx
	xor	si,si
ascii:
	sub 	[buff1+2+si],30h
	sub	[buff2+2+si],30h
	inc 	si
	cmp 	si,4
	jne 	ascii
	
convert	:
	xor 	si,si
	xor	bx,bx
	mov	si,len1
	mov	bl,1
	mov 	cl,10d
	xor	dx,dx
loop2:
	xor 	ax,ax
	mov 	al,byte ptr [buff1+1+si]
	dec 	si 
	mul 	bx
	add	num1,ax
	mov	ax,bx
	mul	cx
	mov	bx,ax
	cmp 	si,0h
	jne	loop2

@convert:
	xor 	si,si
	xor	bx,bx
	mov	si,len2
	mov	bl,1
	mov 	cl,10d
	xor	dx,dx
@loop2:
	xor 	ax,ax
	mov 	al,byte ptr [buff2+1+si]
	dec 	si 
	mul 	bx
	add	num2,ax
	mov	ax,bx
	mul	cx
	mov	bx,ax
	cmp 	si,0h
	jne	@loop2		

	xor	cx,cx
	mov	cl,1
here:
	mov	ax,num2
	and	ax,testnum
	cmp	testnum,0000000000000001b
	je	there
	shl	num1,1
there:
	cmp	ax,testnum
	jne	zero
nonzero:
	mov	dx,num1
	add	num3,dx
zero:
	shl	testnum,1
	cmp	testnum,0
	jne	here

	printf	answer
	mov	ax,num3
	mov	bx,10d
	xor	cx,cx
divide:
	xor	dx,dx
	div	bx
	inc	cl
	push	dx
	cmp	ax,0
	jne	divide
	
disp:	
	pop	dx
	or	dx,0030h
	putchar dl
	dec	cx
	cmp	cx,0
	jne	disp
	
exit
endup