;PE EXE
.386
.model	flat,stdcall
option 	casemap:none
.nolist
include	windows.inc
include	kernel32.inc
include user32.inc
include ..\macro.inc
include masm32.inc
include ac.inc
.listall
includelib masm32.lib
includelib user32.lib
includelib kernel32.lib
includelib ac.lib
.data?
hinst	HINSTANCE	?

.data

.const
dlgproc	proto  	hwnd:HWND,umsg:DWORD,wparam:WPARAM,lparam:LPARAM
dialog		db	'IDD_MAIN',0
IDOK		EQU	1
IDC_ABOUT	equ	101
IDEXIT		equ	9
.code
start:
	invoke	GetModuleHandle,NULL
	mov	[hinst],eax
	invoke	DialogBoxParam,hinst,addr dialog,0,addr dlgproc,0
	invoke	ExitProcess,0


dlgproc	proc	hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
	.if	uMsg==WM_INITDIALOG
		invoke	installhook,hwnd
	.elseif	uMsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDOK
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
		.else
		.endif
	.elseif	uMsg==WM_CLOSE
		invoke	removehook
		invoke	EndDialog,hwnd,0
	.elseif uMsg==WM_USER
		invoke	MessageBox,hwnd,offset dialog,offset dialog,0
		
	.else
		mov	eax,FALSE
		ret
	.endif
	mov	eax,TRUE
	ret												                   		              
dlgproc	endp
	
end	start	