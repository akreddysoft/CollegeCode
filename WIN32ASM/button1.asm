;TITLE BUTTON PRESSING APPLICATION BY MADHUR AHUJA
;************************************************
.386
.model flat,stdcall
option casemap:none
.list
;#########################################################################
.nolist
include 	windows.inc
include 	kernel32.inc
include 	user32.inc
.listall
includelib 	user32.lib
includelib 	kernel32.lib
;#########################################################################
dlgproc	proto hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
tproc proto msg:dword
;##########################################################################
.data
buffpass	db	10 dup(0)
.data?
hinst		HINSTANCE	?		
hwndapp		HWND		?
buthwnd		HWND		?
edhwnd		HWND		?
msghwnd		HWND		?
buthwndmsgok	HWND		?
hthread		dd		?
;#############################################################################
.const
app		db	'System Authentication',0
dlg		db	'IDD_DIALOG1',0
title0		db	'Folder Guard: Disabling Protection',0
title1		db	'Folder Guard: Enabling Protection',0
msgtitle	db	'Folder Guard',0
dlgclass	db	'#32770',0
butclass	db	'Button',0
edclass		db	'Edit',0
filename	db	'c:\program files\winability\folder guard\fgkey.exe',0
err1		db	'Serious error',0
pass		db	'gold',0
password	db	'goldi',0
butokcaption	db	'OK',0
cidok		equ	2
cidyes		equ	1
IDOK		EQU	1
IDCANCEL	EQU	2
EDPASS		EQU	101
;################################################################################
.code
start:	
	invoke	GetModuleHandle,0
	mov	[hinst],eax
	invoke	DialogBoxParam,hinst,addr dlg,0,addr dlgproc,0
	invoke	ExitProcess,0
	

dlgproc	proc hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
local	msg1:MSG
	.if	uMsg==WM_CLOSE
		invoke	EndDialog,hwnd,0
	.elseif	uMsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDOK
			invoke	CreateThread,0,0,offset tproc,hwnd,0,0
			mov	hthread,eax
			
			invoke	GetDlgItemText,hwnd,EDPASS,addr buffpass,10
			invoke	WaitForSingleObject,hthread,INFINITE
			invoke	FindWindow,addr dlgclass,addr msgtitle
			.if	eax==0
				invoke	MessageBox,hwnd,addr err1,addr err1,0
				invoke	ExitProcess,0
			.endif
			mov	[msghwnd],eax
			invoke	FindWindowEx,msghwnd,0,addr butclass,addr butokcaption
			mov	[buthwndmsgok],eax
			invoke	SendMessage,msghwnd,WM_COMMAND,cidok,buthwndmsgok
			invoke	ExitProcess,0
		
		.elseif	ax==IDCANCEL
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
		.endif
	
	.else
		mov	eax,FALSE
		ret
	.endif
	mov	eax,TRUE
	ret
dlgproc	endp

tproc proc hwnd1:dword
			invoke	lstrcmp,addr buffpass,addr pass
			.if	eax!=0
				invoke	ExitProcess,0
			.endif
			invoke	WinExec,addr filename,SW_SHOWDEFAULT
			invoke	FindWindow,addr dlgclass,addr title0
			.if	eax==0
				invoke	FindWindow,addr dlgclass,addr title1
				mov	[hwndapp],eax	
				invoke	FindWindowEx,hwndapp,0,addr butclass,0
				mov	[buthwnd],eax
				invoke	SendMessage,hwndapp,WM_COMMAND,1,buthwnd
				ret
			.endif
			mov	[hwndapp],eax
			invoke	FindWindowEx,hwndapp,0,addr butclass,addr butokcaption
			mov	[buthwnd],eax	
			invoke	FindWindowEx,hwndapp,0,addr edclass,0		
			mov	[edhwnd],eax
			invoke	SendMessage,edhwnd,WM_SETTEXT,0,addr password
			invoke	PostMessage,hwndapp,WM_COMMAND,1,buthwnd
			ret
			
tproc	endp
end	start