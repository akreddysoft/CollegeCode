.model small
.stack 64h
.386
.data
logo	db 10,13,9,9,'****************************************',10,13
     	db       9,9,'*        Winzip key Generator          *',10,13
    	db	 9,9,'*        --------------------          *',10,13
    	db	 9,9,'*  by Madhur(madhur_ahuja@yahoo.com)   *',10,13
    	db       9,9,'*   www.geocities.com/madhur_ahuja     *',10,13
    	db       9,9,'****************************************',10,13,10,13,'$' 
msg	db 10,13,'Enter you name: $'
msg1 	db 10,13,10,13,'Your registration number is: $'
input 	db 20h,0h
name1	db 20 dup (0)
serial1 dw 0
serial2 dw 0 
final	dd 0
regcode	db 8 dup(0),'$'
.code
start:
	mov	ax,@data
	mov	ds,ax
	mov	dx,offset logo
	call	write
	mov	dx,offset msg
	call	write
	mov	dx,offset input
	mov	ah,0ah
	int	21h
	cmp	input+1,0
	je	quit
	
	lea 	ecx,name1
	mov	dl,[ecx]
	xor	ebx,ebx
	xor 	eax,eax
	mov 	esi,ecx
	xor 	edi,edi
	movzx 	cx,[input+1]        ;get length of name in cx(number of loop)
loop1:
	movzx 	dx,dl
	imul 	edx,edi
	add	ebx,edx
	mov 	dl, byte ptr [esi+01]
	inc 	edi
	inc 	esi
	loop	loop1
	mov	serial1,bx
	lea	esi,name1
	mov	ch,byte ptr [esi]
	movzx	edx,[input+1]
loop2:
	cmp	ch,0dh             ;test for end of string i.e. enter char,13
	je	go	
	call	blah
	mov	ch,byte ptr [esi+1]
	inc	esi
	inc	edi
	jmp	loop2
go:
	add	eax,63h
	mov	serial2,ax
	
	mov	word ptr final+2,ax
	mov	ax,serial1
	mov	word ptr final,ax
	
	mov	bx,10h
	xor	si,si
loop0:
	mov	ax,word ptr [final+si]
	mov	cx,4h
loop4:
	xor	dx,dx
	idiv	bx
	push	dx        ;remainder in ah
	loop	loop4
	inc	si
	inc	si
	cmp	si,4h
	jne	loop0           ;each hex digit pushed on to the stack
		
	mov	cx,8h
	xor	si,si

loop3:
	pop	ax
	cmp	al,9h
	ja	char
	add	al,30h
cont:
	mov	[regcode+si],al
	inc	si
	loop	loop3                 ;each item popped,converted and saved in array
	jmp	go1

char:
	add	al,37h
	jmp 	cont

go1:
	lea	dx,msg1
	call	write
	lea	dx,regcode
	call	write
	jmp	quit

blah	proc
	mov	edx,8h
next5:
	mov	ebx,ecx
	xor	ebx,eax
	test	bx,8000h
	je	next3
	add	eax,eax
	xor	eax,00001021h
	jmp	next4
next3:
	shl	eax,1
next4:
	shl	ecx,1
	dec	edx
	jne	next5
	ret
blah	endp

write:
	mov	ah,09h
	int 	21h
	ret

quit:
	mov	ah,4ch
	int	21h
end 	start
