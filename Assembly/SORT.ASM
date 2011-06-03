.model small

.data
outpu	db	10,13,'dfdsfdfds','$'
.code
extrn lsize:word
extrn	list:byte
extrn	output:byte
extrn	crlf:byte
;extrn	write:
sor proc far
        public  sor
       
        xor     dx,dx
	xor	cx,cx
	xor	si,si
	mov	ax,lsize
	mov	bx,[lsize]
	dec	ax
	dec	ax
	dec	bx
	
siloop:
	xor	di,di
diloop:
	mov	cl,[list+di]
	mov	dl,[list+di+1]
	cmp	cl,dl
	jle	cont
	mov	[list+di],dl
	mov	[list+di+1],cl
cont:
	inc	di
	cmp	di,ax
	jle	diloop
	inc	si
	cmp	si,bx
	jle	siloop
		
	xor	si,si
	mov	dx,offset outpu
	call	write
	
	mov	cl,10h
	xor	bx,bx
disp:
	mov	al,[list+si]
	xor	ah,ah
	div	cl
	mov	bl,ah        ;store remainder
	mov	dl,al
	cmp	dl,0h
	je	here
	add	dl,30h
	mov	ah,02h
	int	21h
here:
	mov	dl,bl
	add	dl,30h
	mov	ah,02h
	int	21h
	lea	dx,crlf
	call	write
	inc	si
	cmp	si,lsize
	jne	disp
        ret
sor	endp
write:
mov ah,09h
int 21h
ret

;begin1 ends
end  sor
