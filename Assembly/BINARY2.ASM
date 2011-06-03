.model small
.stack

.data

n       dw      0
lsize	dw	0
list	db	40 dup(0)
sizem	db	10,13,'Enter the size of the list:$'                                                 
entern	db	10,13,'Enter the number:$'
sear    db      10,13,'enter the number to be searched',10,13,'$'
output	db	10,13,10,13,'The sorted list is:',10,13,'$'
buff    db      10,0
temp	db	10 dup(0)                                                  
fnd     db      10,13,'the no is in the list $'
nfnd    db      10,13,'the no is not in the list $'
error	db	10,13,'Invalid Input$'
len	dw	?
num     dw      10,0
flag    db      0
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
        call    pack                   ;FOR PACKED DATA
	mov	ax,n
	mov	[list+bx],al
	inc	bx
	cmp	bx,[lsize]
	jne	input
        lea     dx,[sear]
        call    write
        lea     dx,[buff]
        mov     ah,0ah
        int     21h
        call    pack
        mov     ax,n
        mov     num,ax
        mov     si,lsize
        dec     si
        xor     di,di
        xor     cx,cx

        call    check

search:
       cmp      di,si
       ja       result
compare:
       xor      ax,ax
       mov      al,list[bx]
       
       cmp      num,ax
       je       found
       ja       above
below:
       sub      bx,01h
       mov      si,bx
       xor      cx,cx
       jmp      check

check:
      cmp       si,0h
      je        check1

middle:
       xor      cx,cx
       mov      cx,si
       xor      ax,ax
       add      si,di
       mov      ax,si
       xor      bx,bx
       mov      bl,02h
       div      bx
       mov      bx,ax
       mov      si,cx
       jmp      search
             
above:
      add       bx,01h
      mov       di,bx
      xor       cx,cx
      jmp       check

found:
      mov       flag,01h
      jmp       result
check1:
      cmp       di,0h
      jne       middle
      jmp       compare
result:
       cmp      flag,01h
      jne       nofound
      mov       ah,09h
      lea       dx,fnd
      int       21h
      call      quit



nofound:
      mov       ah,09h
      lea       dx,nfnd
      int       21h
      call      quit

	
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
end 	begin                                     
