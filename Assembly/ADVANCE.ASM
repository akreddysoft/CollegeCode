.model  small
.stack

.data
mad	db	'madhur ahuja$'
mad1	dw	0
kutta	db	'ddffd$'

.code


start:
	mov     ax,@data
	mov     ds,ax
	mov	es,ax
	mov	ax,1h
	lea	dx,mad
	call	write
	mov	ax,seg write
	mov	bx,offset write
	call	quit

write:
	mov     ah,09h
	int     21h
	ret	
quit:
	.exit
end   start