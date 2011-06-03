;PROGRAM TO IMPLEMENT BUBBLE SORT IN ASSEMBLY
;MADHUR AHUJA
;ROLL NO 22
.model small
.stack
.data
n	dw	0
lsize	dw	0
list	db	40 dup(0)
sizem	db	10,13,'Enter the size of the list:$'                                                  
entern	db	10,13,'Enter the number:$'
output	db	10,13,10,13,'The sorted list is:',10,13,'$'
buff	db	10,0
temp	db	10 dup(0)                                                  
error	db	10,13,'Invalid Input$'
len	dw	?
crlf	db	10,13,'$'
.code
begin:                                            
	mov	ax,@data
	mov	ds,ax
	lea	dx,[sizem]
	call	write
	mov	ah,0ah
	lea	dx,buff
	int	21h
	call	bcd2hex
	xor	ax,ax
	mov	ax,n
	mov	lsize,ax
	
	xor	bx,bx
input:
	lea	dx,[entern]
	call	write
	lea	dx,[buff]
	mov	ah,0ah
	int	21h
	call	pack
	mov	ax,n
	mov	[list+bx],al
	inc	bx
	cmp	bx,[lsize]
	jne	input	                
	
	xor	dx,dx
	xor	cx,cx
	xor	si,si
	mov	ax,[lsize]
	mov	bx,[lsize]
	dec	ax
	dec	ax
	dec	bx
siloop:							;FIRST LOOP
	xor	di,di
diloop:							;SECOND LOOP
	mov	cl,[list+di]
	mov	dl,[list+di+1]
	cmp	cl,dl
	jbe	cont
	mov	[list+di],dl
	mov	[list+di+1],cl
cont:
	inc	di
	cmp	di,ax
	jle	diloop
	inc	si
	cmp	si,bx
	jbe	siloop
		
	xor	si,si
	lea	dx,output	
	call	write
	
	mov	cl,10h
	xor	bx,bx
disp:
	mov	al,[list+si]
	xor	ah,ah
	div	cl
	mov	bl,ah         			;store remainder
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
	
	call	quit                
	
bcd2hex	proc
	xor 	si,si
	xor	cx,cx
	mov	cl,[buff+1]
	mov	len,cx
	mov	si,len
	mov	bl,1
	mov 	cl,10d
	xor	dx,dx
loop2:
	xor 	ax,ax
	mov 	al,byte ptr [temp+si-1]
	and	al,0fh
	dec 	si 
	mul 	bx
	add	n,ax
	mov	ax,bx
	mul	cx
	mov	bx,ax
	cmp 	si,0h
	jne	loop2
	ret
bcd2hex	endp
	
pack	proc					
	push	bx
	call	getlen
	xor	ax,ax
	mov	si,len
	mov	bx,10h
	mov	cx,1h
	mov	n,0
convit:
	mov	al,[temp+si-1]
	cmp	al,30h
	jl	err1
	cmp	al,39h
	ja	err1
	and	ax,000fh
	mul	cx
	add	n,ax
	mov	ax,cx
	mul	bx
	mov	cx,ax
	dec	si
	cmp	si,0
	jne	convit
	pop	bx
	ret
pack	endp	

getlen	proc
	xor	cx,cx
	mov	cl,buff+1
	mov	si,cx
	mov	len,si
	ret
getlen	endp

err1:
	lea	dx,error	
	call	write
	call	quit

write:
	mov	ah,09h
	int	21h
	ret                
quit:                                             
	mov 	ax,4c00h                                
	int 	21h                                   
end     begin