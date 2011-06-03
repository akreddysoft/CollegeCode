title directory
.model	small
.code
org 100h
begin:	jmp	short main
pathnam		db 64 dup(' ') 

main 	proc near
call	b10drv
call	c10path
mov	ah,10h
int	16h
mov	ax,4c00h
int	21h
main	endp

b10drv	proc near
mov	ah,19h
int	21h
add	al,41h
mov	dl,al
call	q10disp
mov	dl,'\'
call	q10disp
ret
b10drv	endp

c10path	proc near
mov	ah,47h
mov	dl,00
lea	si,pathnam
int	21h
c20:	
cmp	byte ptr [si],00h
je	c90	
mov	al,[si]
mov	dl,al
call	q10disp
inc	si
jmp	c20
c90:
ret
c10path	endp

q10disp	proc near
mov	ah,02h
int	21h
ret
q10disp	endp

end	begin
