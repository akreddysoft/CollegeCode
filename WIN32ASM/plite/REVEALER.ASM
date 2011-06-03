;###################################################
;	Description:	Password Revealer By Madhur 	
;	Version:  	1.0             
; 	Author:		Madhur Ahuja               
;	Start Date: 	12/07/03,10:41:28                     
;	Name:  		REVEALER.ASM
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
include password.inc
include masm32.inc
.listall
includelib user32.lib
includelib kernel32.lib
includelib password.lib
includelib masm32.lib
.data?
hinst	HINSTANCE	?

.data
buff	db	100 dup(0)
.const
dlgproc	proto	hwnd:HWND,umsg:DWORD,wparam:WPARAM,lparam:LPARAM
abtproc	proto   hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
IDC_STATUS	equ	101
IDEXIT		equ	2
IDABOUT		equ	9
IDOK		equ	1
dialog		db	'IDD_DIALOG1',0
abtdlg		db	'IDD_DIALOG2',0
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
		.if	ax==IDEXIT
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
		.elseif	ax==IDABOUT
			invoke	DialogBoxParam,hinst,addr abtdlg,hwnd,addr abtproc,0
		.endif
	.elseif	uMsg==WM_CLOSE
		invoke	removehook
		invoke	EndDialog,hwnd,0
	.elseif	uMsg==WM_USER
		invoke	SendMessage,wparam,WM_GETTEXT,100,addr buff
		invoke	SetDlgItemText,hwnd,IDC_STATUS,addr buff
	.elseif	uMsg==WM_USER+1
		invoke	SetDlgItemText,hwnd,IDC_STATUS,0
	.else
		mov	eax,FALSE
		ret
	.endif
	mov	eax,TRUE
	ret												                   		              
dlgproc	endp
	
abtproc	proc hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
	.if	uMsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDOK
			invoke	EndDialog,hwnd,0
		.endif
	.else
		mov	eax,FALSE
		ret
	.endif
	mov	eax,TRUE
	ret
abtproc	endp							
end	start	