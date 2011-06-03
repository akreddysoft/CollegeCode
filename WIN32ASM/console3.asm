;PE EXE
.386
.model	flat,stdcall
option 	casemap:none
.nolist
include	windows.inc
include	kernel32.inc
include user32.inc
include macro.inc
.listall
includelib user32.lib
includelib kernel32.lib

.data?
hinst	HINSTANCE	?
hh	dd	?
hr	dd	?
.data
ddd	dd	0
.const
msg	db	"madhur",0
.code
start:
	invoke	GetModuleHandle,NULL
	mov	[hinst],eax
	invoke	GetStdHandle,STD_OUTPUT_HANDLE
	mov	hh,eax
	invoke	GetStdHandle,STD_INPUT_HANDLE
	mov	hr,eax
	
	invoke	WriteConsoleInput,hr,offset msg,6,offset ddd
	invoke	WriteConsole,hh,offset msg,6,offset ddd,0
	
	
	
	invoke	MessageBox,0,offset msg,offset msg,0
	invoke	ExitProcess,0
end	start	