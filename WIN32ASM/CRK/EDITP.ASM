.386                             
.model	flat,stdcall             
option 	casemap:none             
.nolist
include	e:\masm32\include\windows.inc              
include	e:\masm32\include\kernel32.inc             
include e:\masm32\include\user32.inc               
include advapi32.inc
.listall
includelib advapi32.lib
includelib e:\masm32\lib\user32.lib            
includelib e:\masm32\lib\kernel32.lib          
;##########################################################
.data?                           ;dfdsfsdffd
hinst	HINSTANCE	?
buff	db		?
oh	dd	?
fh	dd	?
sh	dd	?
th	dd	?
;##########################################################
.const
title1	db	'EditPlus 2.10C Crack',13,10
	db	'=====================',13,10,13,10
	db	'Protection: Time Limit',13,10
	db	'File to Patch: editplus.exe',13,10
	db	'Filesize: 1207808 Bytes',13,10,13,10
	db	'Run this patch in the same directory where the .exe file is located.',0
dialog	db	'DIALOG_3',0
abtdlg	db	'DIALOG_2',0
dlgclass db	'#32770',0
icn	db	'ICON1',0
file	db	'editplus.exe',0
bfile	db	'editplus.bak',0
err1	db	"Cannot Open File editplus.exe",0
err2	db	'ERROR: File Size Mismatch',0
err3	db	'ERROR: File already patched',0
success	db	'SUCCESS: File Patch Successful :)',0
size1	dd	1207808d
offs	dd	00029ad7h,0006a964h

data	db	75h,75h
data1	db	74h,74h

okey	db	'SOFTWARE',0
fkey	db	'ES-Computing',0
skey	db	'EditPlus 2',0
thkey	db	'Install',0
tkey	db	'SOFTWARE\ES-Computing\EditPlus 2\Install',0
null	db	' ',0
valdata	db	0dbh,89h,29h,18h,0e5h,5dh,0f0h,5dh,78h,9ch,63h,0cbh,4dh,4ch,0c9h,28h,2dh,62h,31h,30h,34h,72h,06h,00h,17h,7eh,03h,62h
val	db	"License",0
;##########################################################
IDEXIT		equ	2
IDABOUT		equ	102
IDSTAT		equ	103
IDEDIT		equ	105
IDCRACK		equ	1
IDOK1		equ	103
dlgproc		proto hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
abtdlgproc 	proto hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
;##########################################################
.code                            
start:                           
	invoke	GetModuleHandle,0
	mov	[hinst],eax
	invoke	DialogBoxParam,hinst,addr dialog,0,addr dlgproc,0
	invoke	ExitProcess,0
;##########################################################	
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
					mov	al,data
					.if	buff!=al
						invoke	SetDlgItemText,hwnd,IDSTAT,addr err3
					.else
						invoke	_llseek,hfile,offs,FILE_BEGIN
						invoke	CopyFile,offset file,offset bfile,FALSE
						invoke	_lwrite,hfile,offset data1,1
						
						invoke	_llseek,hfile,offs+4,FILE_BEGIN
						invoke	_lwrite,hfile,offset data1+1,1
						
						invoke	RegOpenKeyEx,HKEY_LOCAL_MACHINE,offset tkey,0,KEY_ALL_ACCESS,offset oh
						.if	eax!=ERROR_SUCCESS
							invoke	RegOpenKeyEx,HKEY_LOCAL_MACHINE,offset okey,0,KEY_ALL_ACCESS,offset oh
							invoke	RegCreateKeyEx,oh,offset fkey,0,offset null,REG_OPTION_NON_VOLATILE,KEY_ALL_ACCESS,0,offset fh,0
							invoke	RegCreateKeyEx,fh,offset skey,0,offset null,REG_OPTION_NON_VOLATILE,KEY_ALL_ACCESS,0,offset sh,0
							invoke	RegCreateKeyEx,sh,offset thkey,0,offset null,REG_OPTION_NON_VOLATILE,KEY_ALL_ACCESS,0,offset th,0
							invoke	RegSetValueEx,th,offset val,0,REG_BINARY,offset valdata,28
						.else
							invoke	RegSetValueEx,oh,offset val,0,REG_BINARY,offset valdata,29
						.endif
						invoke	RegCloseKey,fh
						invoke	RegCloseKey,sh
						invoke	RegCloseKey,oh
						invoke	RegCloseKey,th
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
;##########################################################
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
;##########################################################