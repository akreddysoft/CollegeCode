.386
put macro m1
	lea	dx,m1
	mov	ah,09h
	int	21h
endm
;############################################
code segment use32
start:

	mov	ax,4c00h
	int	21h



first	proc		;although we can put here the use statement but there is no effect
			;only segment statement has effect
	mov	ax,34h
	mov	eax,456h
	mov	cx,[bx]
	mov	dx,[eax]
first	endp

code	ends

code1   segment use16

second	proc
	mov	ax,34h
	mov	eax,456h
	mov	cx,[bx]
	mov	dx,[eax]
second	endp

code1	ends
end	start
