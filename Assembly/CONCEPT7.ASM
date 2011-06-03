;seventh series of concept
;focuses on addresses and procedures and advanced masm capabilities
;also focuses on return types
.model  small,stdcall
.stack
write1 proto:byte,:byte
writ proto
.data
mad	db	'madhur ahuja$'
mad1	dw	0
kutta	db	'ddffd$'
kuta	db	12h
.code


start:
	mov     ax,@data
	mov     ds,ax
	mov	es,ax
	mov	ax,1
	.if ax==1
	mov	bx,2
	.else
	mov	cx,3
	.endif
	.while ax==1
	mov	cx,2
	.endw
	invoke	write1,kuta,kutta
	invoke	writ
	mov	ax,seg write   ;the cs will go in ax
	mov	bx,offset write ;the offset of the first of inst in write will
	        		;will go in bx, useful in tsr's
	call	just		
	call	quit

write:
	mov     ah,09h
	int     21h
	ret                    ;here retn will work but not retn


just	proc
LOCAL	madhur:WORD
LOCAL	arg1:BYTE
LOCAL	arg2:DWORD
	mov	ax,2h
	mov	cx,3h
	mov	dh,arg1
	mov	ax,madhur
	ret
just	endp	

writ proc uses ax
	
	mov	ah,09h
	int	21h
	ret
writ 	endp

write1 proc dfs:byte,dfs1:byte
	mov	ah,09h
	lea	dx,dfs
	mov	cl,dfs1
	int	21h
	ret                   ;if we use retn here only 2 bytes are popped off
write1 endp

quit:
	.exit
end   start