        IDEAL
        MODEL   small
ASCnull         EQU     0               ; ASCII null character

        DATASEG
buff	db	10 dup(0)
        CODESEG
start:
	mov	ax,_data
	mov	ds,ax

	mov	ax,1234h
	mov	bx,2
	mov	cx,4
	lea	di,[buff]
	call	bintoaschex






	mov	ax,4c00h
	int	21h






PROC    StrLength
        push    ax              ; Save modified registers
        push    di

        xor     al, al          ; al <- search char (null)
        mov     cx, 0ffffh      ; cx <- maximum search depth
        cld                     ; Auto-increment di
        repnz   scasb           ; Scan for al while [di]<>null & cx<>0
        not     cx              ; Ones complement of cx
        dec     cx              ;  minus 1 equals string length

        pop     di              ; Restore registers
        pop     ax
        ret                     ; Return to caller
ENDP    StrLength
%NEWPAGE
;---------------------------------------------------------------
; StrUpper      Convert chars in string to uppercase
;---------------------------------------------------------------
; Input:
;       di = address of string to convert (s)
; Output:
;       lowercase chars in string converted to uppercase
; Registers:
;       none
;---------------------------------------------------------------
PROC    StrUpper
        push    ax              ; Save modified registers
        push    cx
        push    di
        push    si
        call    StrLength       ; Set cx = length of string
        jcxz    @@99            ; Exit if length = 0
        cld                     ; Auto-increment si, di
        mov     si, di          ; Set si = di
@@10:
        lodsb                   ; al <- s[si]; si <- si + 1
        cmp     al, 'a'         ; Is al >= 'a'?
        jb      @@20            ; No, jump to continue scan
        cmp     al, 'z'         ; Is al <= 'z'?
        ja      @@20            ; No, jump to continue scan
        sub     al, 'a'-'A'     ; Convert lowercase to uppercase
@@20:
        stosb                   ; s[di] <- al; di <- di + 1
        loop    @@10            ; cx <- cx - 1; loop if cx <> 0
@@99:
        pop     si              ; Restore registers
        pop     di
        pop     cx
        pop     ax
        ret                     ; Return to caller
ENDP    StrUpper




;---------------------------------------------------------------
; HexDigit      Convert 4-bit value to ASCII digit
;---------------------------------------------------------------
; Input:
;       dl = value limited to range 0..15
; Output:
;       dl = ASCII hex digit equivalent
; Registers:
;       dl
;---------------------------------------------------------------
PROC    HexDigit
        cmp     dl, 10          ; Is dl < 10 (i.e. hex 'A')?
        jb      @@10            ; If yes, jump
        add     dl, 'A'-10      ; Else convert to A, B, C, D, E, or F
        ret                     ; Return to caller
@@10:
        or      dl, '0'         ; Convert digits 0 to 9
        ret                     ; Return to caller
ENDP    HexDigit
%NEWPAGE
;---------------------------------------------------------------
; ValCh         Convert ASCII digit char to binary value
;---------------------------------------------------------------
; Input:
;       dl = ASCII digit '0'..'9'; 'A'..'F'
;       bx = base (2=binary, 10=decimal, 16=hexadecimal)
; Output:
;       cf = 0: dx = equivalent binary value
;       cf = 1: bad char for this number base (dx is meaningless)
; Registers:
;       dx
;---------------------------------------------------------------
PROC    ValCh
        cmp     dl, '9'         ; Check for possible hex digit
        jbe     @@10            ; Probably '0'..'9', jump
        sub     dl, 7           ; Adjust hex digit to 3A..3F range
@@10:
        sub     dl, '0'         ; Convert ASCII to decimal
        test    dl, 0f0h        ; Check 4 msbs (sets cf=0)
        jnz     @@99            ; Jump  if error (not digit or A-F)

        xor     dh, dh          ; Convert byte in dl to word in dx
        cmp     dx, bx          ; Compare to number base (cf=1 if ok)
@@99:
        cmc                     ; Complement cf to set/reset err flag
        ret                     ; Return to caller
ENDP    ValCh
%NEWPAGE
;---------------------------------------------------------------
; NumToASCII    Convert unsigned binary value to ASCII
;---------------------------------------------------------------
; Input:
;       ax = 16-bit value to convert
;       bx = base for result (2=binary;10=decimal;16=hex)
;       cx = minimum number of digits to output
;       di = address of string to hold result
;       Note: assumes string is large enough to hold result
;       Note: creates full result if cx is less than the number
;             of digits required to specify the result or cx = 0
;       Note: if cx=0 and ax=0 then length of string will be 0
;             set cx=1 if you want string to = '0' if ax=0
;       Note: assumes (2<=bx<=16)
; Output:
;       none
; Registers:
;       ax, cx
;---------------------------------------------------------------
PROC    NumToASCII              ; Normal entry point
        push    dx              ; Save some modified registers
        push    di
        push    si

; si = count of digits on stack

        xor     si, si          ; Set digit-count to zero
        jcxz    @@20            ; If cx=0, jump to set cx=1
@@10:
        xor     dx, dx          ; Extend ax to 32-bit dxax
        div     bx              ; ax<-axdx div bx; dx<-remainder
        call    HexDigit        ; Convert dl to ASCII digit
        push    dx              ; Save digit on stack
        inc     si              ; Count digits on stack
        loop    @@10            ; Loop on minimum digit count
@@20:
        inc     cx              ; Set cx = 1 in case not done
        or      ax, ax          ; Is ax = 0? (all digits done)
        jnz     @@10            ; If ax <> 0, continue conversion
        mov     cx, si          ; Set cx to stack char count
        jcxz    @@40            ; Skip next loop if cx=0000
        cld                     ; Auto-increment di for stosb
@@30:
        pop     ax              ; Pop next digit into al
        stosb                   ; Store digit in string; advance di
        loop    @@30            ; Loop for cx digits
@@40:
        mov     [byte di], ASCnull      ; Store null at end of string
        pop     si              ; Restore saved registers
        pop     di
        pop     dx

        ret                     ; Return to caller
ENDP    NumToASCII
%NEWPAGE
;---------------------------------------------------------------
; BinToAscHex   Convert binary values to ASCII hex strings
;---------------------------------------------------------------
; Input:
;       ax = 16-bit value to convert
;       cx = minimum number of digits to output
;       di = address of string to hold result
;       Note: assumes string is large enough to hold result
;       Note: outputs full result if cx is less than the number
;             of digits required to specify the result
; Output:
;       none
; Registers:
;       ax, cx
;---------------------------------------------------------------
PROC    BinToAscHex
        push    bx              ; Save bx on stack
        mov     bx, 16          ; Set base = 16 (hex)
        call    NumToAscii      ; Convert ax to ASCII
        pop     bx              ; Restore bx
        ret                     ; Return to caller
ENDP    BinToAscHex
%NEWPAGE
;---------------------------------------------------------------
; BinToAscDec   Convert binary values to ASCII decimal strings
;---------------------------------------------------------------
; Input:
;       Same as BinToAscHex
; Output:
;       none
; Registers:
;       ax, cx (indirectly)
;---------------------------------------------------------------
PROC    BinToAscDec
        push    bx              ; Save bx on stack
        mov     bx, 10          ; Set base = 10 (decimal)
        call    NumToAscii      ; Convert ax to ASCII
        pop     bx              ; Restore bx
        ret                     ; Return to caller
ENDP    BinToAscDec
%NEWPAGE
;---------------------------------------------------------------
; SBinToAscDec  Convert signed binary to ASCII decimal strings
;---------------------------------------------------------------
; Input:
;       Same as BinToAscHex (ax = signed 16-bit value)
; Output:
;       none
; Registers:
;       ax, cx
;---------------------------------------------------------------
PROC    SBinToAscDec
        push    bx                      ; Save bx and di
        push    di
        cmp     ax, 0                   ; Is signed ax < 0?
        jge     @@10                    ; Jump if ax >= 0
        neg     ax                      ; Form twos complement of ax
        mov     [byte di], '-'          ; Insert '-' in string
        inc     di                      ; Advance string pointer
@@10:
        mov     bx, 10                  ; Set base = 10 (decimal)
        call    NumToAscii              ; Convert ax to ASCII
        pop     di                      ; Restore bx and di
        pop     bx
        ret                             ; Return to caller
ENDP    SBinToAscDec
%NEWPAGE
;---------------------------------------------------------------
; BinToAscBin   Convert binary values to ASCII binary strings
;---------------------------------------------------------------
; Input:
;       Same as BinToAscHex
; Output:
;       none
; Registers:
;       ax, cx (indirectly)
;---------------------------------------------------------------
PROC    BinToAscBin
        push    bx              ; Save bx on stack
        mov     bx, 2           ; Set base = 2 (binary)
        call    NumToAscii      ; Convert ax to ASCII
        pop     bx              ; Restore bx
        ret                     ; Return to caller
ENDP    BinToAscBin
%NEWPAGE
;---------------------------------------------------------------
; ChToBase      Return number base for string
;---------------------------------------------------------------
; Note:
;       Private subroutine for AscToBin. Don't call directly.
; Input:
;       si = pointer to null terminator at end of string
;       Note: assumes length of string >= 1
; Output:
;       bx = 2(binary), 10(decimal/default), 16(hexadecimal)
;       si = address of last probable digit character in string
; Registers:
;       bx, dl, si      
;---------------------------------------------------------------
PROC    ChToBase
        mov     dl, [byte si-1]   ; Get last char of string
        mov     bx, 16          ; Preset base to 16 (hexadecimal)
        cmp     dl, 'H'         ; Is it a hex string?
        je      @@10            ; Jump if hex
        mov     bx, 2           ; Preset base to 2 (binary)
        cmp     dl, 'B'         ; Is it a binary string?
        je      @@10            ; Jump if binary
        mov     bx, 10          ; Preset base to 10 (decimal)
        cmp     dl, 'D'         ; Is it a decimal string?
        jne     @@20            ; Jump if NOT decimal
@@10:
        dec     si              ; Adjust si to last probable digit
@@20:
        ret                     ; Return to caller
ENDP    ChToBase
%NEWPAGE
;---------------------------------------------------------------
; AscToNum      Convert ASCII characters to binary
;---------------------------------------------------------------
; Note:
;       Private subroutine for AscToBin. Don't call directly.
; Input:
;       ax = initial value (0)
;       bx = number base (2=binary, 10=decimal, 16=hexadecimal)
;       di = address of unsigned string (any format)
;       si = address of last probable digit char in string
; Output:
;       cf = 0 : ax = unsigned value
;       cf = 1 : bad character in string (ax is meaningless)
; Registers:
;       ax, cx, dx, si
;---------------------------------------------------------------
PROC    AscToNum
        mov     cx, 1           ; Initialize multiplier
@@10:
        cmp     si, di          ; At front of string?
        je      @@99            ; Exit if at front (cf=0)
        dec     si              ; Do next char to left
        mov     dl, [byte si]   ; Load char into dl
        call    ValCh           ; Convert dl to value in dx
        jc      @@99            ; Exit if error (bad char)
        push    cx              ; Save cx on stack
        xchg    ax, cx          ; ax=multiplier; cx=partial value
        mul     dx              ; dxax <- digit value * multiplier
        add     cx, ax          ; cx <- cx + ax (new partial value)
        pop     ax              ; Restore multiplier to ax
        mul     bx              ; dxax <- multiplier * base
        xchg    ax, cx          ; ax=partial value; cx=new multiplier
        jmp     @@10            ; do next digit
@@99:
        ret                     ; Return to caller
ENDP    AscToNum
%NEWPAGE
;---------------------------------------------------------------
; AscToBin      Convert ASCII strings to binary values
;---------------------------------------------------------------
; Input:
;       di = ASCIIZ string to convert to binary
;            'H' at end of string = hexadecimal
;            'B' at end of string = binary
;            'D' or digit at end of string = decimal
;            '-' at s[0] indicates negative number
;       Note: no blanks allowed in string
; Output:
;       cf = 1 : bad character in string (ax undefined)
;       cf = 0 : ax = value of string
;       Note: chars in string converted to uppercase
;       Note: null strings set ax to zero
; Registers:
;       ax
;---------------------------------------------------------------
PROC    AscToBin
        push    bx              ; Save modified registers
        push    cx              ; (some of these are changed
        push    dx              ;  in subroutines called by
        push    si              ;  this procedure)

        call    StrUpper        ; Convert string to uppercase
        call    StrLength       ; Set cx to Length of string at di
        xor     ax, ax          ; Initialize result to zero (cf=0)
        jcxz    @@99            ; Exit if length = 0.  ax=0, cf=0
        mov     si, di          ; Address string at di with si
        add     si, cx          ; Advance si to null at end of string
        cmp     [byte di], '-'  ; Check for minus sign
        pushf                   ; Save result of compare
        jne     @@10            ; Jump if minus sign not found
        inc     di              ; Advance di past minus sign
@@10:
        call    ChToBase        ; Set bx=number base; si to last digit
        call    AscToNum        ; Convert ASCII (base bx) to number
        rcl     bx, 1           ; Preserve cf by shifting into bx
        popf                    ; Restore flags from minus-sign check
        jne     @@20            ; Jump if minus sign was not found
        neg     ax              ;  else form twos complement of ax
        dec     di              ;  and restore di to head of string
@@20:
        rcr     bx, 1           ; Restore cf result from AscToNum
@@99:
        pop     si              ; Restore registers
        pop     dx
        pop     cx
        pop     bx
        ret                     ; Return to caller
ENDP    AscToBin

        END start                    ; End of module
