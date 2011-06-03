;=================================================
;PROGRAM FOR EVALUATION OF POSTFIX EXPRESSION
;PROGRAMMER: MADHUR AHUJA
;	     BVP,PUNE
;=================================================          
.model 	small                                         
.stack 	100h                                          
.data                                                 
tit	db 9,9,'==============================================',10,13
	db 9,9,' PROGRAM FOR EVALUATION OF POSTFIX EXPRESSION ',10,13
	db 9,9,'                  by Madhur                   ',10,13 
	db 9,9,'==============================================',10,13,10,13,'$'
input	db 	       '* Enter the postfix expression: $'
output	db 10,13,10,13,'* The answer is: $'
error	db 10,13,'* Error in Expression$' 
buff	db 20h
exp	db 0,20h dup(0)
post	db 20h dup(0)
len	dw ?
.code                                                 
start:                                                
	mov	ax,@data                              
	mov	ds,ax                                 
	lea	dx,tit
	call	write
	mov	dx,offset input
	call	write
	mov	ah,0ah
	lea	dx,buff
	int	21h
	lea	dx,output
	call	write
	call	putbrack
	inc	len		;increase len by 2 for 2 brackets
	inc	len
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	xor	si,si
	xor	ax,ax
loop2:				;conversion starts from here
	mov	al,[exp+si]
	cmp	al,'0'
	jae	belowc
cont:
	cmp	al,'('
	je 	finish		;its brackit pushit
	cmp	al,')'
	je	endit
	cmp	al,'+'
	je	operandplus		;dispatch to operand handling procedures
	cmp	al,'-'
	je	operandminus
	cmp	al,'/'
	je	operanddiv
	cmp	al,'*'
	je	operandmul
 	cmp	al,'^'
	je	operandexp
belowc:	
	cmp	al,'9'
	jle	pushit         ;the char is operand,dispatch to expression
	jmp	cont		;not a operand,continue scan
finish:	
	inc	si		;scan next character
	jmp	loop2		;go to scan begin
endit:	jmp	disp

pushit:
	push	ax
	jmp	finish
	
operandplus:
	pop	bx
	pop	cx
	and	bl,0fh
	and	cl,0fh
	add	cl,bl
	add	cl,30h
	push	cx
	jmp	finish
	
operandminus:	
	pop	bx
	pop	cx
	and	bl,0fh
	and	cl,0fh
	sub	cl,bl
	add	cl,30h
	push	cx
	jmp	finish
	
operandmul:
	pop	ax
	pop	cx
	and	ax,0fh
	and	cx,0fh
	mul	cl
	push	ax
	jmp	finish
	
operanddiv:
	pop	ax
	xor	ah,ah
	pop	cx	
	div	cl
	xor	ah,ah
	push	ax
	jmp	finish

operandexp:
	jmp	finish

disp:
	mov	[post+1],'$'      ;add string terminator
	lea	dx,post
	call	write
	call	quit	                                                     
	                                              
putbrack	proc
	xor	si,si
	xor	cx,cx
	mov	cl,[exp]       ;does ch or cl matter
	mov	exp,'('
	mov	si,cx
	mov	[exp+si+1],')'     
	ret
putbrack	endp			
	                                              
write:	                                              
	mov	ah,09h                                
	int	21h                                   
	ret	                                      
	                                              
quit:                                                 
	mov	ax,4ch                                
	int	21h                                   
	                                              
end	start		                              
