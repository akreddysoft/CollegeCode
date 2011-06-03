;32BIT EXE
.386
.model	flat,stdcall
option 	casemap:none
include	e:\masm32\include\windows.inc
include	e:\masm32\include\kernel32.inc
include e:\masm32\include\user32.inc
includelib e:\masm32\lib\user32.lib
includelib e:\masm32\lib\kernel32.lib
includelib f:\programming\win32asm\dynamic.lib
;extern madhur:proc
madhur proto
.data
hlib	HANDLE	0
add1	dd	0
.data?
hinst	HINSTANCE	?
tid	dd	?
.code
start:
	invoke	GetModuleHandle,NULL
	mov	[hinst],eax
	;invoke 	madhur
	call 	madhur
	mov	eax,offset thread
	invoke	CreateThread,0,	0,eax,1,0,addr tid
	invoke	CloseHandle,eax
	
	invoke	ExitProcess,0

thread proc uses ecx
	call madhur
	ret
thread endp
end	start	