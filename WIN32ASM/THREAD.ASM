;32BIT EXE
.386
.model	flat,stdcall
option 	casemap:none
.nolist
include	windows.inc
include	kernel32.inc
include user32.inc
.listall
includelib user32.lib
includelib kernel32.lib
include masm32.inc
includelib masm32.lib
.data
dlgproc		proto hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
tid		dd	0
hwnd1		HWND	0
.data?
hinst	HINSTANCE	?
ht	HANDLE	?
.const
btclass		db	'button',0
dialog1		db	'DIALOG1',0
IDC_EDIT1	EQU	101
IDOK		EQU	1
IDCANCEL	EQU	2
path		db	'c:\windows\sol.exe',0
msg		db	'thread completed',0
.code
start:
	invoke	GetModuleHandle,NULL
	mov	[hinst],eax
	invoke	DialogBoxParam,hinst,offset dialog1,0,offset dlgproc,0
	invoke	ExitProcess,0

dlgproc	proc	hwnd:HWND,umsg:DWORD,wparam:WPARAM,lparam:LPARAM
local	ttid[10]:byte
	.if	umsg==WM_INITDIALOG
		invoke	CreateWindowEx,WS_EX_WINDOWEDGE,offset btclass,offset btclass,WS_VISIBLE or WS_CHILD,10,10,20,20,hwnd,22,hinst,0
		.if	eax==0
			invoke	MessageBox,0,addr btclass,addr btclass,0
		.endif
	.elseif	umsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==1
			push	hwnd
			pop	hwnd1
			mov	eax,offset tproc
			invoke	CreateThread,0,0,eax,1,0,offset tid
			mov	ht,eax
			invoke	dw2hex,tid,addr ttid
			invoke	MessageBox,0,addr ttid,addr ttid,0
		.elseif	ax==2
			invoke	CloseHandle,ht
			invoke	EndDialog,hwnd,0
		.endif
	.elseif	umsg==WM_USER
		invoke	MessageBox,0,offset msg,offset msg,0
	.else
		mov	eax,FALSE
		RET
	.endif
	mov	eax,TRUE
	RET
dlgproc	endp



tproc proc uses ecx 
	mov	ecx,60000000h
loop1:
	add	eax,eax
	dec	ecx
	jz	out1
	jmp	loop1
out1:
	invoke	SendMessage,hwnd1,WM_USER,0,0
	;invoke	PostMessage,hwnd1,WM_USER,0,0
	ret		;this statement means the ending of thread	
tproc	endp	
end	start	