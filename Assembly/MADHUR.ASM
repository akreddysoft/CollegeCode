.model small
.stack 100h
.data
str1    db  'Enter the string:$'
str2    db   10,13,'The modified string is:$'
buff    db   40h,0
string  db   40 dup(0)
len     dw   ?
.code
start:
        mov     ax,@data
        mov     ds,ax
        mov     es,ax
        lea     dx,str1
        call    write
        mov     ah,0ah
        lea     dx,buff
        int     21h
        mov     ah,09h
        lea     dx,str2
        call    write
        call    conv
        call    quit

conv:   
        xor     cx,cx
        xor     di,di
        xor     bx,bx
        mov     bl,[buff+1]
        mov     si,bx
        dec     si
        xor     bx,bx
loop1:
        mov     bl,[string+si]
        cmp     bl,' '
        je      disp
        push    bx
        inc     cx
here:
        dec     si
        cmp     si,-1
        jne     loop1
        jmp     disp1
        ret

disp:
        xor     dx,dx
        pop     dx
        mov     ah,02h
        int     21h
        dec     cx
        jnz     disp
        mov     ah,02
        mov     dl,' '
        int     21h
        jmp     here

disp1:
        xor     dx,dx
        pop     dx
        mov     ah,02h
        int     21h
        dec     cx
        jnz     disp1
        call    quit
write:
        mov     ah,09h
        int     21h
        ret

quit:
        mov     ax,4c00h
        int     21h
end     start

