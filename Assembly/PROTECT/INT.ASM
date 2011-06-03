stack segment stack
dw 32(0)
stack ends

data segment
data ends

code segment
start:
      assume cs:code,ds:data,ss:stack
      mov       ax,data
      mov       ds,ax
      
jumpit:
      shr       ax,4
      xor       ax,ax
      xor       bx,bx
      xor       cx,cx
      xor       dx,dx
      jmp       jumpit

      mov       ax,4c00h
      int       21h
code  ends
end   start
