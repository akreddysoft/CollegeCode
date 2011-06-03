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
.data?                           
hinst	HINSTANCE	?
buff	dw		?
.const
title1	db	'VrmlPad v1.3 Crack',13,10
	db	'===================================',13,10,13,10
	db	'Protection: Execution Limit',13,10
	db	'File to Patch: micro3.exe',13,10
	db	'Filesize: 623,616 bytes',13,10,13,10
	db	'Run this patch in the same directory where the .exe file is located.',13,10,13,10
	db	'Apply the crack, only after the expiration of software!',0
dialog	db	'DIALOG_3',0
abtdlg	db	'DIALOG_2',0
dlgclass db	'#32770',0
icn	db	'ICON1',0
file	db	'vrmlpad.exe',0
bfile	db	'vrmlpad.bak',0
err1	db	"Cannot Open File micro3.exe",0
err2	db	'ERROR: File Size Mismatch',0
err3	db	'ERROR: File already patched or different',0
success	db	'SUCCESS: File Patch Successful :)',0
size1	dd	623616d
offs	dd	31FFch
data	dw	84h
data1	db	85h
IDEXIT		equ	2
IDABOUT		equ	102
IDSTAT		equ	103
IDEDIT		equ	105
IDCRACK		equ	1
IDOK1		equ	103
dlgproc		proto hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
abtdlgproc 	proto hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
.code                            
start:                           
	invoke	GetModuleHandle,0
	mov	[hinst],eax
	invoke	DialogBoxParam,hinst,addr dialog,0,addr dlgproc,0
	invoke	ExitProcess,0
	
dlgproc	proc hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
local	hicon:HWND
local	hfile:HWND		
local	buthwnd:HWND
	.if	uMsg==WM_INITDIALOG
		invoke	LoadIcon,hinst,addr icn
		mov	hicon,eax
		invoke	SendMessage,hwnd,WM_SETICON,ICON_SMALL,hicon
		invoke	SetDlgItemText,hwnd,IDEDIT,addr title1
	.elseif	uMsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDCRACK
			invoke	_lopen,offset file,OF_READWRITE
			.if	eax==-1
				invoke	SetDlgItemText,hwnd,IDSTAT,addr err1
			.else
				mov	hfile,eax			
				invoke	GetDlgItem,hwnd,IDCRACK
				mov	buthwnd,eax
				invoke	GetFileSize,hfile,0
				.if	eax!=size1
					invoke	SetDlgItemText,hwnd,IDSTAT,addr err2
				.else
					invoke	_llseek,hfile,offs,FILE_BEGIN
					invoke	_lread,hfile,offset buff,1
					mov	ax,data
					.if	buff!=ax
						invoke	SetDlgItemText,hwnd,IDSTAT,addr err3
					.else
						invoke	_llseek,hfile,offs,FILE_BEGIN
						invoke	CopyFile,offset file,offset bfile,FALSE
						invoke	_lwrite,hfile,offset data1,1
						invoke	_lclose,hfile
						invoke	SetDlgItemText,hwnd,IDSTAT,addr success
						invoke	EnableWindow,buthwnd,FALSE
					.endif
				.endif																								
			.endif
		.elseif	ax==IDABOUT
			invoke	DialogBoxParam,hinst,addr abtdlg,hwnd,addr abtdlgproc,0
		.elseif	ax==IDEXIT
			invoke	EndDialog,hwnd,0
		.endif
	.else
		mov	eax,FALSE
		ret
	.endif
	mov	eax,TRUE
	ret
dlgproc	endp			                                 

abtdlgproc	proc hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
	.if	uMsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDOK1
			invoke	EndDialog,hwnd,0
		.endif
	.else
		mov	eax,FALSE
		ret
	.endif
	mov	eax,TRUE
	ret
abtdlgproc	endp								
end	start	                 
