;FREE HAND DRAWING USING MOUSE
;!!!!COM FILE!!!!!
;MADHUR AHUJA
;TE IT
;BVP INDIA
.model tiny
init macro m1
        mov	al,m1
        xor	ah,ah
        int     10h
endm        

drawhline macro a, b,c
local @@draw
	mov	ah,02
	mov	bh,0
	mov	cx,a
	mov	dx,c
@@draw:
	call	putpixel
	inc	cx
	cmp	cx,b
	jle	@@draw
endm

drawvline macro a, b,c
local @@draw1
	mov	ah,02
	mov	bh,0
	mov	cx,c
	mov	dx,a
@@draw1:
	call	putpixel
	inc	dx
	cmp	dx,b
	jle	@@draw1
endm

.data
msg	db	10,13,77 dup(32),"x$"
.code
org 	100h
start:
        init	12h			;graphics mode
        xor     ax,ax
        int     33h			;init mouse driver
 	mov     ax,0001h
        int     33h			;show pointer
	
	lea	dx,msg
	mov	ah,09h
	int	21h
	
	drawhline 600,639,0    
	drawvline 0,39,639
	drawhline 600,639,39
	drawvline 0,39,600
test1:
        mov 	ax,0001h
        int 	33h     
        mov     ax,0003h
        int     33h
        test    bl,00000001b
        jz      test1
        cmp	cx,600
        jl	cont
	cmp	dx,39
	ja	cont
	jmp	quit
cont:

	mov 	ax,0002h       ;hide mouse pointer
        int 	33h
        mov	ax,0c07h
        mov     bh,0
        int     10h
        jmp     test1


putpixel:
	mov	ax,0c01h
        mov     bh,0
        int     10h
        ret

quit:
        init	3			;text mode
        mov     ax,4c00h
        int     21h
end     start
