;###################################################
;	Description:	Client Coordinates Revealer 	
;	Version:  	1.0             
; 	Author:		Madhur Ahuja               
;	Start Date: 	12/07/03,08:31:21                     
;	Name:  		CLIENT.ASM
;	Assembler:  	MASM 6.14.8444
;	Linker:  	Link.exe 5.12.8078
;###################################################


.386
.model	flat,stdcall
option 	casemap:none
.nolist
include	windows.inc
include	kernel32.inc
include user32.inc
include masm32.inc
include gdi32.inc
include macro.inc
.listall
includelib gdi32.lib
includelib user32.lib
includelib kernel32.lib
includelib masm32.lib
.data?
hinst	HINSTANCE	?
.data
caption		db 50 dup(0)
class		db 50 dup(0)
hand		db 50 dup(0)
curx		db 12 dup(0)
cury		db 12 dup(0)
;##########################################################
.const
dlgproc	proto	hwnd:HWND,umsg:DWORD,wparam:WPARAM,lparam:LPARAM
IDC_STATUS	equ	101
IDEXIT		equ	2
IDOK		equ	1
dialog		db	'IDD_DIALOG1',0
IDC_CLASS	equ	102
IDC_HANDLE	equ	105
IDC_CAPTION	equ	101
IDC_CURY	equ	115
IDC_CURX	equ	114
IDC_ABOUT	equ	104
.code
start:
	invoke	GetModuleHandle,NULL
	mov	[hinst],eax
	invoke	DialogBoxParam,hinst,addr dialog,0,addr dlgproc,0
	invoke	ExitProcess,0

dlgproc	proc	hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
local	buff[100]:byte
local 	pi:POINT
local   handle:HWND
	.if	uMsg==WM_INITDIALOG
		invoke	SetTimer,hwnd,25,50,0
	.elseif	uMsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDEXIT
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
		.endif
	.elseif	uMsg==WM_CLOSE
		invoke	EndDialog,hwnd,0
	.elseif	uMsg==WM_TIMER
		invoke	GetCursorPos,addr pi

		invoke	WindowFromPoint,pi.x,pi.y
		mov	handle,eax
		invoke	ScreenToClient,handle,addr pi
		invoke	dw2hex,pi.x,addr curx
		invoke	SetDlgItemText,hwnd,IDC_CURX,addr curx
		invoke	dw2hex,pi.y,addr cury
		invoke	SetDlgItemText,hwnd,IDC_CURY,addr cury

		invoke	SendMessage,handle,WM_GETTEXT,50,addr caption
		invoke	SetDlgItemText,hwnd,IDC_CAPTION,addr caption
		
		invoke	dw2hex,handle,addr hand
		invoke	SetDlgItemText,hwnd,IDC_HANDLE,addr hand

		invoke	GetClassName,handle,addr class,50
		invoke	SetDlgItemText,hwnd,IDC_CLASS,addr class
	.else
		mov	eax,FALSE
		ret
	.endif
	mov	eax,TRUE
	ret												                   		              
dlgproc	endp
end	start	