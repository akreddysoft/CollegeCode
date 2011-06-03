
         ;program to explore the partition table of hard-disk

     puts  macro mes          ;macro defi. for display
     mov ah,09h
     lea dx,mes
     int 21h
     endm

setcur  macro r , c
     mov ah,02h               ;set cursor macro
     mov bh,00h
     mov dh,r
     mov dl,c
     int 10h
     endm


    .model small
    .stack
    .486
    .data
      buffer  db  512 dup(0)
      num     dw  (0)
      r       db  (4)  
      mes0    db 10,13,"bootable / non-bootable            -> $"
      mes1    db  "this partition is bootable.$"
      mes2    db  "this partition is non-bootable.$"
      mes3    db  10,13,"starting head                     -> $"
      mes5    db  10,13,"partition type                    -> $"
      mes4    db  10,13,"starting track                    -> $"
      mes6    db  "unused partition$"
      mes7    db  "fat file system , 12-bit fat entry $"
      mes8    db  "fat file system , 16-bit fat entry $"
      mes     db  "fat file system , 32-bit fat entry $" 
      mes9    db  "extended partition,32-bit fat entry $"
      mes10   db  "huge partition$"
      mes11   db  10,13,"ending head                       -> $"
      mes12   db  10,13,"ending cylinder                   -> $"
      mes13   db  10,13,"starting sector no. for partition -> $"
      mes14   db  10,13,"length of partition               -> $"
      mes15   db  "unknown partition.$"
      mes16   db  10,13,"signature word                    -> $"

    .code
    start:
      mov ax,@data

      mov ah,02h
      mov al,1
      lea bx,buffer
      mov cx,0001             ;read the mbr
      mov dh,00
      mov dl,80h
      int 13h

      setcur 1 , 0            ;set the cursor

      lea si,buffer           ;point to buffer having buffer
      add si,01beh
 k :  puts mes0
      mov al,0
      cmp [si],al             ;display the active flag
      jne j1                  ;0h  - nonbootable
      puts mes2               ;80h - bootable
      jmp j2
 j1 :
      puts mes1
 j2 :
      puts mes3
      inc si

      mov bh,0
      mov bl,[si]             ;display starting head
      call disp16

      inc si
      puts mes4
      mov bx,word ptr[si]     ;display starting cylinder
      call disp16

      add si,02
      puts mes5               ;display partition type
      mov al,0                ;00h - unused partition
      mov ah,[si]             
      cmp ah,al               
      jne j3                  
      puts mes6
      jmp j8

 j3 : mov al,01               ;01h - fat fs , 12-bit fat entries
      cmp ah,al
      jne j4
      puts mes7
      jmp j8

 j4 : mov al,04               ;04h - fat fs , 16-bit fat entries
      cmp ah,al
      jne j5
      puts mes8
      jmp j8

 j5 : mov al,0fh              ;0fh - extended partition
      cmp ah,al
      jne j6
      puts mes9
      jmp j8

 j6 : mov al,06               ;06h - huge partition
      cmp ah,al
      jne j7
      puts mes10
      jmp j8
 j7 : mov al,0ch              ;0ch - fat fs , 32-bit fat entries
      cmp ah,al
      jne j9
      puts mes
      jmp j8
 j9 : puts mes15
 j8 :
      inc si
      puts mes11
      
      mov bl,[si]             ;display ending head
      mov bh,0
      call disp16
      inc si
      puts mes12
      mov bx,word ptr[si]     ;display ending cylinder
      call disp16
      puts mes13
      add si,02
      mov ax,word ptr[si]     ;display starting sector no. for partitio
      mov num,ax
      add si,02
      mov bx,word ptr[si]
      call disp16
      mov bx,num
      call disp16
      add si,02
      puts mes14
      mov ax,word ptr[si]     ;display length of partition in no.
      mov num,ax              ; of sectors
      add si,02
      mov bx,word ptr[si]
      call disp16
      mov bx,num
      call disp16
      add si,02
      mov ah,01h
      int 21h
      dec r                   
      jnz k                   
      puts mes16
      mov bx,word ptr[si]     ;display signature word at last
      call disp16


      mov ah,4ch
      int 21h

      disp16 proc             ; --- display 16 bit number
      mov cl,04h
      mov ch,04h
 l3 : rol bx,cl
      mov dx,bx
      and dx,000fh
      cmp dx,000ah
       jb l4
      add dx,0007h
 l4 : add dx,0030h
      mov ah,02h
      int 21h
      dec ch
      jnz l3
      ret
disp16      endp


      end start

