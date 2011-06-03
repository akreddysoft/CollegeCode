szText MACRO Name, Text:VARARG
LOCAL lbl
	jmp	lbl
	Name	db	Text, 0
lbl:
ENDM
m2m MACRO M1, M2
	push	M2
	pop	M1
ENDM
m2mx MACRO M1, M2
	mov	eax, M2
	mov	M1, eax
ENDM
return MACRO RETVALUE
	mov	eax, RETVALUE
	ret
ENDM
iif MACRO condition, if_true, if_false, return
	.if condition
		mov	return, if_true
	.else
		mov	return, if_false
	.endif
ENDM
iifs MACRO condition, if_true, if_false, return
	mov	return, if_false
	.if condition
		mov	return, if_true
	.endif
ENDM


HIWORD macro dwordval
mov	eax,dwordval
shr	eax,16
endm

LOWORD macro dwordval
mov	eax,dwordval
and 	eax,0ffffh
endm

MKWORD macro dwordval
mov	eax,dwordval

shr	eax,16
mov	edx,eax		;HIWORD IN EDX

mov	eax,dwordval
and	eax,0ffffh
mov	ecx,eax		;LOWORD IN ECX	
endm


RGB MACRO red, green, blue
        xor eax, eax
        mov al, blue    ; blue
        rol eax, 8
        mov al, green   ; green
        rol eax, 8
        mov al, red     ; red
      ENDM
      
      
WS_EX_LAYERED equ 80000h ; I guess you won't find these equates in your includes 
LMA_COLORKEY  equ 1
LMA_ALPHA     equ 2
