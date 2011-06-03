;PE EXE
.386
.model	flat,stdcall
option 	casemap:none
.nolist
include	e:\masm32\include\windows.inc
include	e:\masm32\include\kernel32.inc
include e:\masm32\include\user32.inc
include masm32.inc
.listall
includelib masm32.lib
includelib whook.lib
includelib e:\masm32\lib\user32.lib
includelib e:\masm32\lib\kernel32.lib

.data?
hinst	HINSTANCE	?
.data
installhook	proto hWnd:HWND
mouseit	proto	nCode:UINT,wparam:WPARAM,lparam:LPARAM
removehook	proto
.const
dlgproc	proto	hwnd:HWND,umsg:DWORD,wparam:WPARAM,lparam:LPARAM
IDOK	EQU	1
IDC_STATUS	EQU	101
dialog		db	'IDD_DIALOG1',0
.code
start:
	invoke	GetModuleHandle,NULL
	mov	[hinst],eax
	invoke	DialogBoxParam,hinst,addr dialog,0,addr dlgproc,0
	invoke	ExitProcess,0

dlgproc	proc	hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
local 	buff[12]:byte
	.if	uMsg==WM_INITDIALOG
		invoke	installhook,hwnd
	.elseif	uMsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDOK
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
		.endif
	.elseif uMsg==WM_USER
		invoke	dw2hex,wparam,addr buff
		invoke	SetDlgItemText,hwnd,IDC_STATUS,addr buff
	.elseif	uMsg==WM_CLOSE
		invoke	EndDialog,hwnd,0
		invoke	removehook
	.else
		mov	eax,FALSE
		ret
	.endif
	mov	eax,TRUE
	ret												                   		              
dlgproc	endp
	
end	start	