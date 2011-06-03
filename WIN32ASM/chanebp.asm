;PE EXE
;program demonstrates how exception generates as a result of changing ebp
.386
.model	flat,stdcall
option 	casemap:none
.nolist
include	windows.inc
include	kernel32.inc
include user32.inc
include macro.inc
include masm32.inc
.listall
includelib user32.lib
includelib kernel32.lib
includelib masm32.lib
.data?
hinst	HINSTANCE	?
.code
start:
	invoke	GetModuleHandle,NULL
	mov	[hinst],eax
	call	changebp
	invoke	ExitProcess,0
	
	
changebp	proc
local 	madhur[10]:byte
local	dd1:dword

	mov	dd1,1234h
	push	eax
	mov	dd1,4567h
	push	ebx
	mov	ebp,3333h	
	mov	madhur,'f'	;now it will cause exception
	pop	ecx
	pop	ecx
	invoke	dw2hex,dd1,addr madhur
	invoke	MessageBox,0,addr madhur,addr madhur,0
	
	
	ret
changebp	endp
end	start	