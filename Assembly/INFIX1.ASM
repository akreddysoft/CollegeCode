;=================================================
;PROGRAM TO CONVERT INFIX TO POSTFIX EXPRESSION
;PROGRAMMER: MADHUR AHUJA
;	     BVP,PUNE
;=================================================
.model 	small                                         
.stack 	100h                                          
.data                                                 
tit	db 9,9,'==============================================',10,13
	db 9,9,'PROGRAM TO CONVERT INFIX EXPRESSION TO POSTFIX',10,13
	db 9,9,'                  by Madhur                   ',10,13 
	db 9,9,'==============================================',10,13,10,13,'$'
input	db 	       '* Enter the infix expression: $'
output	db 10,13,10,13,'* The postfix expression is:  $'
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
	mov	ah,exp
	mov	byte ptr len,ah
	call	putbrack
	inc	len		;increase len by 2 for 2 brackets
	inc	len
	call	valid
	call	conv
	lea	dx,output
	call	write
	mov	[post+di],'$'      ;add string terminator
	lea	dx,post
	call	write
	call	quit	                                              
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                         
conv	proc			;conversion routine
	xor	si,si
	xor	di,di
	xor	ax,ax
	mov	cx,len         ;2 extra for starting and ending brackets
loop2:				;conversion starts from here
	mov	al,[exp+si]
	cmp	al,'A'
	jae	belowc
cont:
	cmp	al,'('
	je 	pushit		;its brackit pushit
	cmp	al,')'
	je	bracke
	cmp	al,'+'
	je	operand		;dispatch to operand handling procedures
	cmp	al,'-'
	je	operand
	cmp	al,'/'
	je	operand
	cmp	al,'*'
	je	operand
 	cmp	al,'^'
	je	operand
	jmp	err1
belowc:	
	cmp	al,'Z'
	jle	movit         ;the char is operand,dispatch to expression
	jmp	cont		;not a operand,continue scan
finish:	
	inc	si		;scan next character
	loop	loop2		;go to scan begin
	ret
conv	endp	

pushit:				;mirror of pushthis for future
	push	ax
	jmp	finish
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
movit:				;if the scanned char is operand, mov to exp
	mov	[post+di],al
	inc	di
	jmp	finish

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bracke:			;if the operand is right bracket
	mov	bp,sp
	cmp	byte ptr [bp],'('         ;check if char on stack is (
	je	end1			 ;if yes,drop this left bracket and 
	pop	bx			;scan next char
	mov	[post+di],bl		;if no, pop the element and mov to exp
	inc	di			;increment top of exp
	jmp	bracke			;get next element on stack
end1:
	add	sp,2h			;discard left bracket
	jmp	finish

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;OPERAND HANDLING PROCEDURE
operand:
	cmp	al,'+'
	je	hndplus		;operand is +, jmp to handling procedure
	cmp	al,'-'
	je	hndminus
	cmp	al,'*'
	je	hndmult
	cmp	al,'/'
	je	hndiv
	cmp	al,'^'
	je	hndexp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
hndplus:
	mov	bp,sp
	cmp	byte ptr [bp],'+'
	je	popthat
	cmp	byte ptr [bp],'*'
	je	popthat
	cmp	byte ptr [bp],'/'
	je	popthat
	jmp	pushthis
hndminus:
	mov	bp,sp
	cmp	byte ptr [bp],'-'
	je	popthat
	cmp	byte ptr [bp],'*'
	je	popthat		       ; if precedence on stack is more
	cmp	byte ptr [bp],'/'	;pop from stack and push current char
	je	popthat			;else simply push the operand
	jmp	pushthis	
hndmult:
	mov	bp,sp
	cmp	byte ptr [bp],'/'
	je	popthat
	cmp	byte ptr [bp],'^'
	je	popthat
	jmp	pushthis
hndiv:
	mov	bp,sp
	cmp	byte ptr [bp],'/'
	je	popthat
	cmp	byte ptr [bp],'^'
	je	popthat	
	jmp	pushthis
hndexp:
	jmp	pushthis
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
pushthis:		
	push	ax            ;if precedence is greater just push the operator
	jmp	finish

popthat:			;if precedence is less, pop the prev one
	pop	bx		;and push the new one
	mov	[post+di],bl
	inc	di
	inc	bp               ;after popping again check the stack for any
	inc	bp
	cmp	byte ptr [bp],'+' ;operand which might be higher in precedence
	je	hndplus		 ;if not push the new scanned and continue
	cmp	byte ptr [bp],'-'           ;we have to INC bp because popping only dec
	je	hndminus           ;sp and not bp, to be in sync with stack
	cmp	byte ptr [bp],'*'             ; we have to dec the bp
	je	hndmult
	cmp	byte ptr [bp],'/'
	je	hndiv
	cmp	byte ptr [bp],'^'
	je	hndexp
	push	ax
	jmp	finish

putbrack	proc
	xor	si,si
	xor	cx,cx
	mov	cl,[exp]       ;does ch or cl matter
	mov	exp,'('
	mov	si,cx
	mov	[exp+si+1],')'     
	ret
putbrack	endp				                                              


valid	proc
	xor	si,si
	xor	di,di
	mov	cx,len
next:
	mov	al,[exp+si]
	cmp	al,'('
	je	incr
	jmp	decr
incr:
	inc	di
	jmp	cont1
decr:
	cmp	al,')'
	jne	cont1
	dec	di
cont1:
	inc	si
	loop	next
	cmp	di,0
	jne	err1
	ret
valid	endp			

err1:
	lea	dx,error
	call	write
	call	quit	                                              
write:	                                              
	mov	ah,09h                                
	int	21h                                   
	ret	                                      
quit:                                                 
	mov	ax,4c00h                                
	int	21h                                   
end	start		                              

