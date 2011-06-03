.386
.model small
.data
.code
start:
        mov     ax,@data
        mov     ds,ax
        xor     eax,eax
;        div     ecx
        push    dx
        pop     es

        mov     ebx,0b8000h
 ;       mov     es:[ebx],'f'

        int     3

        mov     ax,4c00h
        int     21h
end     start
