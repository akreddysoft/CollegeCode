;PE EXE
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

.data

a1	db	10 dup(0)
.const

.code
start:
	invoke	GetModuleHandle,NULL
	jmp	here
here:
	mov	[hinst],eax
	;mov	eax,[401000]       ;this desnt work
	mov	ebx,401000h
	mov	eax,[ebx]
	invoke	dw2hex,eax,offset a1
	invoke	MessageBox,0,offset a1,offset a1,0
	
	
	
	invoke	ExitProcess,0
end	start	