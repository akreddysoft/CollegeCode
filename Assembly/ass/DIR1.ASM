;16 BIT EXE WITH SIMPLIFIED DIRECTIVES
.model 	small
.stack 	64h
.data
include ..\macro.inc
curdir	db	64 dup(0)
wild	db	"e:\programs",0
dta	dd	0
file	db	11 dup(0)
crlf	db	10,13,"$"
.code
start:
	mov	ax,@data
	mov	ds,ax
	
	mov	ah,2fh
	int	21h			;get d
	mov	word ptr dta,es
	mov	word ptr dta+2,bx
	
	mov	ah,47h
	xor	dl,dl
	lea	si,curdir
	int	21h
	
	mov	ah,4eh
	lea	dx,wild
	mov	cx,0
	int	21h
	call	getfile
	puts	file
	puts	crlf	
	
	xor	cx,cx
again:
	mov	ah,4fh
	int	21h
	jc	quit	
	call	getfile
	inc	cx
	puts	file
	puts	crlf
	jmp	again
	
	jmp	quit
	
	
getfile	proc
	push	ax
	push	bx
	push	si
	push	di
	
	mov	bx,80h
	lea	si,es:[bx]
	add	si,1eh
	
	xor	di,di
moveit:
	mov	al,es:[si]
	mov	[file+di],al
	inc	si
	inc	di
	cmp	al,0
	mov	[file+di],'$'
	jne	moveit
	
	
	pop	di
	pop	si
	pop	bx
	pop	ax
	ret
getfile	endp
	
	
	
quit:
	mov	ax,4c00h
	int	21h

end	start		