;16 BIT EXE WITH SIMPLIFIED DIRECTIVES
.model 	small
.stack 	64h
.data
a1	dw	1234h
res	db	4 dup(0)
.code
start:
	mov	ax,@data
	mov	ds,ax
	mov	bx,offset res
	push	res
	push	a1
	call	dispnum
	
	
	jmp	quit
	
dispnum proc               ; procedure to convert 16 bit hex no.

	push	bp
	mov	bp,sp
	
             mov si,[bp+6]                ; into its equivalent bcd and display it
             mov ax,[bp+4]
             mov dx,00h
tt1:
             cmp ax,0ah
             jb tt
             mov bx,0ah
             div bx                    ; divide no. by 0ah until it is greater than 0ah
             add dl,30h
             mov [si],dl
             inc si
             mov dx,00h
             jmp tt1

tt:
             add al,30h
             mov [si],al

call disp
ret

dispnum endp	

quit:
	mov	ax,4c00h
	int	21h

end	start		
