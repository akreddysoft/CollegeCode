;PE EXE
;SAMLE FILE FOR EXAMINING UNDER SOFTICE
.386
.model	flat,stdcall
option 	casemap:none
.nolist
include	windows.inc
include	kernel32.inc
include user32.inc
;include macro.inc
.listall
includelib user32.lib
includelib kernel32.lib

.data?
hinst	HINSTANCE	?
.data
one	db	'This is the sample data',0
.const
const1	dw	1234h
two	db	'this is the constant data',0
.code
start:
	invoke	GetModuleHandle,NULL
	mov	[hinst],eax

	invoke	ExitProcess,0
end	start	