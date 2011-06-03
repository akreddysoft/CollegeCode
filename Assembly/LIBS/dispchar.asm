;16 BIT EXE WITH SIMPLIFIED DIRECTIVES
;THIS IS A PROCEDURE TO DISPLAY THE ASCII DATA DIRECTLY
.model 	small
.stack 	64h
.data
a3	db	31h,32h,33h,34h
.code
start:
	mov	ax,@data
	mov	ds,ax
	mov	cx,4
	push	cx
	mov	bx,offset a3
	push	bx
	call	dispchar
	jmp	quit	

dispchar proc              ; procedure to display characters
	push	bp
	mov	bp,sp
	mov	cl,[bp+6]		;get count in cl register
	mov	bx,[bp+4]
        mov 	ah,02h                ; accepts character count in cl reg.

loop1:                       ; and address of data in bx reg.
        mov 	dl,[bx]
        int 	21h
        inc 	bx
        dec 	cl
        jnz 	loop1
        pop	bp
        ret	4
dispchar endp
	
	jmp	quit
	
quit:
	mov	ax,4c00h
	int	21h

end	start		