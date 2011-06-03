;    Printer Device Drivers
; ===============================


.model small
.code
        org 0
begin :

;---------------- Variables --------------------------------

header		dd 	-1         ; linking to next d. driver
          	dw 	8000h      ; char d. driver
             	dw 	strat      ; offset of strategy routine
          	dw 	intr       ; offset of interrupt routine
         	db 	'P_PRINT ' ; logical device name
         	
rhptr           dd      ?          ; request header pointer


;----------------- Strategy Routine ------------------------

strat proc far           

	mov word ptr cs:[rhptr], bx    
	mov word ptr cs:[rhptr+2], es  
	ret

strat endp

;------------------ Interrupt Routine ----------------------

intr proc far
         
	push ax              	; saving registers
	push bx
	push cx
	push dx
	push si
	push di
	push es
	push ds
	push bp
	
	push cs
	pop  ds

        les di , [rhptr]
        
	mov bl, es:[di+2]    	; Get command code
	xor bh, bh
	cmp bx, 24           	; Check if it is valid
	jle intr1
	call Error
	jmp intrn

intr1 :				; Init. device driver
	cmp bl,00            
	jne intr2
	call initz
	jmp intrn

intr2 :
	cmp bl, 01            	; Media Check
	jne intr3
	call mediachk
	jmp intrn

intr3 :
	cmp bl, 02            	; Build BPB
	jne intr4
	call bpb     
	jmp intrn

intr4 :
	cmp bl, 08            	; Write o/p
        jne intr6
	call write
	jmp intrn

intr6 :
	cmp bl, 10           	; Output status
	jne intr7
	call outstat
	jmp intrn

intr7 :
	cmp bl, 11           	; Flush output buffers
	jne intr8
	call flushbuff
	jmp intrn

intr8 :
	call Error
intrn :
	or bx, 0100h         ; merge 'Done' bit into status &
	mov es:[di+3], bx    ; store status word in R.H.
	
	pop bp
	pop ds
	pop es
	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
       	ret

intr endp

;-----------------------------------------------------------

mediachk proc near
	xor bx ,bx
   	ret
mediachk endp

;-----------------------------------------------------------

bpb proc near
	xor bx ,bx
	ret
bpb endp

;-----------------------------------------------------------

write proc near

	push es
	push di

	les di, [rhptr+14]          ; memory address for transfer
	mov cx, word ptr es:[di+18] ; size in bytes per sector

printch :
	mov ah,00      
        mov al, byte ptr es:[di]
	mov dx, 00
	int 17h
	
	test ah, 00101001b
	jnz err_ret
	inc di
	loop printch

	pop di
	pop es
	xor bx, bx
   	ret
err_ret :
	pop di
	pop es
	mov bx, 800ah           ; 0a -> error  : write fault
	ret

write endp

;-----------------------------------------------------------

outstat proc near

	mov ah, 02            
	mov dx, 00
	int 17h

	test ah, 00101001b
	jnz err_ret01

	xor bx, bx
        ret
        
err_ret01 :
	mov bx, 0200h         ; set busy bit-9 in status word
        ret

outstat endp


;-----------------------------------------------------------

flushbuff proc near
	xor bx, bx
	ret
flushbuff endp

;-----------------------------------------------------------

Error proc near
        mov bx, 8003h           ;03 -> Unknown command
	ret
Error  endp

;-----------------------------------------------------------

msg_init        db      13,10
                db      'ษอออออออออออออออออออออออออออออออป',13,10
                db      'บ    Printer Driver Installed   บ',13,10
                db      'ศอออออออออออออออออออออออออออออออผ',13,10,'$'                        

;-----------------------------------------------------------

initz proc near

	mov ah, 01		; Init printer
	mov dx, 00
	int 17h

        cmp ah, 10h
	je Ok
	
; Now , an error has occured. 
; Abort installation
	
	and word ptr [header+4],8000h	; Set Bit-15 of attribute
					; word in header
	mov word ptr es:[di+13],00	
	mov word ptr es:[di+14],00	
	mov word ptr es:[di+16],cs	; Break Addr = CS:0000	
	xor bx,bx
        ret

Ok:
        mov ah , 09
        lea dx , msg_init
        int 21h
        
	mov word ptr es:[di+14], offset initz  ; Break address
	mov word ptr es:[di+16], cs
        ret
        
initz endp

;-----------------------------------------------------------------

end begin
