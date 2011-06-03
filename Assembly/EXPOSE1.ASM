write macro m1
	lea	dx,m1
	mov	ah,09h
	int 	21h
endm

.model small
.386
.stack 30h
.data
input	db 10,13,'* Enter your name: $'
buffer 	db 20h,0h
serial  db 20 dup(0)
msg2	db 10,13,10,13,'* Your password is: $'	
logo	db 10,13,9,9,'***************************************************',10,13
	db       9,9,'* Keygen for win-expose-I/O & Win-expose-registry *',10,13
	db	 9,9,'* ----------------------------------------------- *',10,13  		
	db       9,9,'*        by Madhur(madhur_ahuja@yahoo.com)        *',10,13
	db	 9,9,'*         www.geocities.com/madhur_ahuja          *',10,13
	db       9,9,'***************************************************',10,13,'$'
pass	dd 0f422c070h
pass1	db 8 dup(0),'$'

.code
start:
	mov	ax,@data
	mov	ds,ax
	write	logo
	write	input
	mov	ah,0ah
	lea	dx,buffer
	int	21h        ;401a05
	cmp	buffer+1,0
	je	quit
	
	movzx	cx,buffer+1   ;get length of serial
	lea	si,serial

caps:
	mov	al,[si]
	cmp	al,61h
	jnae	cont3
	sub	al,20h              ;convert to uppercase
cont3:
	mov	[si],al
	inc 	si
	loop	caps
	
	xor	eax,eax
	xor	ecx,ecx
	xor	esi,esi
	xor	edx,edx 
	movzx	ebx,buffer+1
	mov	edi,0f422c070h  ;very imp

calc:
	movsx	eax,byte ptr serial+esi
	cmp	eax,20h
	je	space
	imul	eax,esi
	mov	ecx,eax
	lea	eax,dword ptr [eax+eax*2]
	shl	eax,3h
	lea	edx,dword ptr [ecx+eax*8]
	lea	eax,dword ptr [edx+edx*4]
	add	eax,ecx
	neg	eax
	add	pass,eax
space:
	inc	esi          
	cmp	esi,ebx
	jne	calc                ;conversion routine
	
	mov	bx,10h
	xor	si,si
loop0:
	mov	ax,word ptr pass+si
	mov	cx,4h
loop1:
	xor	dx,dx
	idiv	bx
	push	dx        ;remainder in ah
	loop	loop1
	inc	si
	inc	si
	cmp	si,4h
	jne	loop0           ;each hex digit pushed on to the stack
	
	mov	cx,8h
	xor	si,si

loop2:
	pop	ax
	cmp	al,9h
	ja	char
	add	al,30h
	jmp	cont
char:
	add	al,37h
cont:
	mov	pass1+si,al
	inc	si
	loop	loop2                 ;each item popped,converted and saved in array
	write	msg2
	write 	pass1

quit:
	mov	ax,4c00h
	int	21h
end	start