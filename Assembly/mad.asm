.model small 
.stack 1000h 
.data 
mess1 db 'Number 1: $' 
mess2 db 'Number 2: $' 
return db 10,13,'$' 
number1 db 4 dup(?),'$' 
number2 db 4 dup(?),'$' 
mess3 db 'Product= ' 
product db 8 dup(?),'$' 
.code 
.startup 
.repeat 
; input 1st number 
lea dx, mess1 
call print 
mov bx, offset number1 
call in2key 
lea dx, return 
call print 

; input 2nd number 
lea dx, mess2 
call print 
mov bx, offset number2 
call in2key 
lea dx, return 
call print 

;convert ASCII data to number 
lea bx, number1 
mov ax, [bx] 
sub ax,3030h 
aad 
;push ax 
mov ax,[bx+2] 
sub ax,3030h 
aad 
mov cx, ax 
;pop ax 
mul cx 
lea bx, number2 
mov ax, [bx+4] 
sub ax,3030h 
aad 
mul cx 

;convert product to ascii data 
mov bx, offset product 
mov cx,100 
xor dx,dx 
div cx 
aam 
add ax,3030h 
xchg al,ah 
mov [bx], ax 
xchg ax,dx 
aam 
add ax,3030h 
xchg al,ah 
mov [bx+2], ax 

;print product 
lea dx, mess3 
call print 
lea dx, return 
call print 
.until al==3 
quit: 



.exit 

print proc near 
mov ah, 09 
int 21h 
ret 
print endp 


in2key proc near 
push dx 
key1: 
mov ah,06h 
mov dl,0ffh 
int 21h 
.if (al>='0') && (al<='9') 
mov ah,06h 
mov dl,al 
int 21h 
mov [bx+1], al 
.elseif al==03h 
jmp quit 
.else 
JMP key1 
.endif 
key2: 
mov ah,06h 
mov dl,0ffh 
int 21h 
.if al>='0' && al<='9' 
mov ah,06h 
mov dl,al 
int 21h 
mov [bx], al 
.elseif al==03h 
jmp quit 
.else 
JMP key2 
.endif 
key3: 
mov ah,06h 
mov dl,0ffh 
int 21h 
.if al>='0' && al<='9' 
mov ah,06h 
mov dl,al 
int 21h 
mov [bx], al 
.elseif al==03h 
jmp quit 
.else 
JMP key3 
.endif 
key4: 
mov ah,06h 
mov dl,0ffh 
int 21h 
.if al>='0' && al<='9' 
mov ah,06h 
mov dl,al 
int 21h 
mov [bx], al 
.elseif al==03h 
jmp quit 
.else 
JMP key4 
.endif 
pop dx 
ret 
in2key endp 
end 

