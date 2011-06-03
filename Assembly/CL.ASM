   title    program to build 32-bit calculator

       ;   program by      ajay nyalpelli       

clrscr macro
    mov  ax,0600h                 ; clear screen macro
    mov  bh,07h
    mov  cx,0000h
    mov  dx,184fh
    int  10h
endm

setcursor macro
    mov  ah,02h                   ; set cursor macro
    mov  bh,00h
    mov  dx,00h
    mov  dl,00h
    int  10h
endm
                    
dispmes macro mes
    mov  ah,09h                   ; message display macro
    lea  dx,mes
    int  21h
endm

input_4_bit macro
    mov  ah,01h                   ; key stroke read macro
    int  21h  
endm

.model small
.386
.stack
.data
    menu   db 10,13,"1 : addition"
           db 10,13,"2 : subtraction"
           db 10,13,"3 : multiplication"
           db 10,13,"4 : division"
           db 10,13,"0 : quit"
           db 10,13,"    choice : $"
    answer db 10,13,"answer is = $"
    mes1   db 10,13,"enter the first 32-bit number  : $"
    mes2   db 10,13,"enter the second 32-bit number : $"
    error  db 10,13,"wrong entry......",10,13,"program ends.$"
    dz     db 10,13,"divide by zero error......$"
    quotient db 10,13,"quotient : $"
    remainder db 10,13,"remainder : $"
    negans db 10,13," answer is = -$"
    eror   db " enter properly   $"
    arr    db 16 dup(0)
    ten    dd ?
    temp   dd ?
    divz   db 1
    num1   dd ?
    num2   dd ?
    ans1   dd ?
    ans2   dd ?

.code
    mov  ax,@data
    mov  ds,ax

    clrscr
    setcursor
    dispmes mes1
    call input32             ; take first 32-bit number
    call bcd_hex
    mov  ebx,temp
    mov  num1,ebx

    dispmes mes2
    call input32             ; take second 32-bit number
    call bcd_hex
    mov  ebx,temp
    mov  num2,ebx

mai_nu :
    clrscr
    setcursor
    dispmes  menu
    input_4_bit
    cmp  al,30h                   ; check whether wrong choice
    jl   wr_ch
    cmp  al,34h
    jg   wr_ch
    cmp  al,30h
    je   stop
    cmp  al,31h
    jne  l1 
    call add_num
    mov   eax,ans1
    call hex_bcd
    dispmes answer                ; display answer
    call disp 

    mov  ah,07h
    int  21h

    jmp mai_nu

l1 :
    cmp  al,32h                   ; check which operation is to perform
    jne  l2 
    call sub_num
    mov   eax,ans1
    test  eax,80000000h
    jz    pos
    neg   eax
    mov   ans1,eax
    dispmes negans
    mov   eax,ans1
    call hex_bcd
    call disp 
    jmp gt_j

pos:
    call hex_bcd
    dispmes answer                ; display answer
    call disp 
gt_j:
    mov  ah,07h
    int  21h

    jmp mai_nu

l2 :
    cmp  al,33h
    jne  l3 
    call mul_num
    mov   eax,ans1
    call hex_bcd
    dispmes answer                ; display answer
    call disp 

    mov  ah,07h
    int  21h

    jmp mai_nu

l3 :
    cmp  num2,00h
    jne  l4
    dispmes  dz
    mov  ah,07h
    int  21h
    jmp  mai_nu

l4 :
    call div_num
    mov   eax,ans1
    call hex_bcd
    dispmes quotient                ; display answer
    call disp
    mov   eax,ans2
    call hex_bcd
    dispmes remainder               ; display answer
    call disp


    mov  ah,07h
    int  21h

    jmp mai_nu

wr_ch :
    dispmes  error  

stop :
    mov  ah,4ch                   ; exit to 'dos'
    int  21h


add_num  proc near                ; procedure to add two numbers
    mov  eax,num1
    add  eax,num2
    mov  ans1,eax          
    ret
add_num endp


sub_num  proc near                ; procedure to subtract two numbers
    mov  eax,num1
    sub  eax,num2
    mov  ans1,eax
    ret
sub_num endp


mul_num  proc near                ; procedure to multiply two numbers
    mov  eax,num1
    mov  edx,00h
    mul  num2
    mov  ans1,eax
    mov  ans2,edx
    ret
mul_num endp


div_num  proc near                ; procedure to divide two numbers
    mov  eax,num1
    cdq  
    div  num2
    mov  ans1,eax
    mov  ans2,edx
    ret
div_num endp


input32    proc near
    mov    cx,08h
    lea    si,arr
    mov    ebx,0
    mov    ah,1
again:                            ; procedure to take 32-bit number
    int    21h
    cmp    al,20h
    je     rt
    cmp    al,13h
    je     rt
    cmp    al,39h
    ja     er
    cmp    al,30h
    jb     er
next:
    sub    al,30h
    mov    [si],al
    inc    si
    inc    ch
    shl    ebx,4
    add    bl,al
    dec    cl
    jnz    again
    mov    ah,02h
    mov    dl,20
    int    21h
    jmp    rt
er:
    dispmes eror
rt:
    mov    ah,02h
    mov    dl,20h
    int    21h
    mov    byte ptr[si],20h

    ret
input32    endp

bcd_hex    proc near
    lea     si,arr
    mov     cl,ch                 ; procedure to convert bcd number
    xor     ch,ch                 ; to hex
    add     si,cx
    dec     si
    mov     ebx,1
    mov     ten,0ah
    mov     temp,0
a1:
    xor     eax,eax 
    mov     al,[si]
    mul     ebx
    add     temp,eax
    mov     eax,ebx
    mul     ten
    mov     ebx,eax
    dec     si
    dec     cl
    jnz     a1
    ret
bcd_hex endp

hex_bcd  proc  near
    mov   edx,0                   ; procedure to convert hex number
                                  ; bcd number
    mov   ebx,0ah                  
    lea   si,arr
    add   si,15
    mov   cl,15
a:  div   ebx                     ; divide by 0ah
    add   dl,30h
    mov   [si],dl                 ; get bcd no. in array
    dec   cl
    dec   si
    cmp   eax,000ah
    jae   b
    jmp   c
b:  mov   edx,00h
    jmp   a
c:  cmp   eax,00h
    jz    d
    add   al,30h
d:  mov   [si],al

    ret
hex_bcd   endp

disp proc  near                   ; display
    
    lea    si,arr
    xor    ch,ch
    add    si,cx
dps1:
    cmp    cl,15
    ja     r1
    mov    dl,[si]
    inc    si
    inc    cl
    mov    ah,02h
    int    21h                    ; display one digit
    jmp    dps1
r1: ret

   disp  endp

       end
