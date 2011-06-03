.model small
.stack 64h

data    segment  at 0b800h
cnt     db 4000 dup(?)
data	ends

datasg  segment
str1     db 'enter the color code in hex(caps):$'
err1     db 10,13,'wrong color$'
buff     db 2,0
val1     db 2 dup(0)
datasg	ends

code    segment 
start:
	assume  cs:code,ds:datasg,es:data
	mov     ax,datasg
	mov     ds,ax
	mov     ax,data
	mov     es,ax
	lea     dx,str1
	call    write
	lea     dx,buff
	mov     ah,0ah
	int     21h
	cmp     val1,39h
	jg      char
	sub     val1,30h
	jmp     cnt1
char:
	sub     val1,37h

cnt1:
	xor     bx,bx
	mov     bx,1
loop1:       
	mov     al,val1
	mov     es:[cnt+bx],al
	inc     bx
	inc     bx
	cmp     bx,0F9FH
	jne     loop1

quit:
	mov     ax,4c00h
	int     21h

write:
	mov     ah,09h
	int     21h
	ret

errr:
	lea     dx,err1
	call    write
	call    quit
code	ends
end     start
