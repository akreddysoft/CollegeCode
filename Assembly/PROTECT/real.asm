.386
data 	segment
logo	db	"t h i s is r e a l m o d e"
data	ends
code	segment
start:
	mov	ax,data
	mov	ds,ax
	xor	bx,bx
	mov	cx,0b800h
	push	cx
	pop	es
	mov	byte ptr es:[bx],'M'	;print  m at 0,0 using seg:offset
	
	mov	ebx,0b8000h
	push	dx
	pop	es
	mov	byte ptr es:[ebx+2],'N'	;print directly using 32bit address
	
	mov	ah,4ch
	int	21h
code	ends
end 	start