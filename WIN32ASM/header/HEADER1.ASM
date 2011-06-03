.386
.model	flat,stdcall
option 	casemap:none
.nolist
include	windows.inc
include	kernel32.inc
include user32.inc
include advapi32.inc
include masm32.inc
.listall
includelib masm32.lib
includelib user32.lib
includelib kernel32.lib
includelib advapi32.lib
.data
valdata	db	100 dup(0)
ptrdir	db	100 dup(0)	;mainkey
.data?
ptrcmd	dd	?
khnd	dd	?
cmdhnd	dd	?
hdhnd	dd	?
chkhnd	dd	?
delhnd	dd	?
dispos	dd	?
hinst	HINSTANCE	?
inshwnd	HWND	?
uninshwnd	HWND	?
.const
IDC_STATUS	equ	105
IDC_UNINSTALL	equ	102
IDC_INSTALL	equ	101
;ptrdir		db	"d:\programming\win32asm\header.exe %1",0
app		db	" %1",0
subkey		db	'exefile\shell',0		;for creating
delkey		db	'exefile\shell\Header',0
chkey		db	'exefile\shell\Header\command',0	;for checking ptrdir
installed	db	"File Header is in Explorer's menu",0
ninstalled	db	"File Header is not in Explorer's menu",0
nullstr		db	' ',0
ckey		db	'Header',0
ckey1		db	'command',0
dialog		db	'DIALOG1',0	
file		db	'\header.exe',0
err1		db	'Error:Missing header.exe!',0
title1		db	'File Header',0
prob		db	'Location of header.exe has changed,press intall to reconfigure or uninstall to remove file header',0

dlgproc	proto	hwnd:HWND,umsg:DWORD,wparam:WPARAM,lparam:LPARAM
.code
start:
	invoke	GetModuleHandle,NULL
	mov	[hinst],eax
	invoke	GetCommandLine
	mov	ptrcmd,eax
	mov	dl,[eax]
	invoke	GetCurrentDirectory,50,addr ptrdir
	invoke	szCatStr,offset ptrdir,offset file
	invoke	exist,addr ptrdir
	.if	eax==0
		invoke	MessageBox,0,offset err1,offset title1,MB_ICONSTOP
		invoke	ExitProcess,0
	.endif
	
	invoke	szCatStr,offset ptrdir,offset app
	
	invoke	DialogBoxParam,hinst,addr dialog,0,addr dlgproc,0
	invoke	ExitProcess,0

dlgproc	proc	hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
local	typekey:dword
local	lbcbdata:dword
	.if	uMsg==WM_INITDIALOG
		
		invoke	GetDlgItem,hwnd,IDC_INSTALL
		mov	inshwnd,eax
		invoke	GetDlgItem,hwnd,IDC_UNINSTALL
		mov	uninshwnd,eax
		
		mov	lbcbdata,50h
		invoke	RegOpenKeyEx,HKEY_CLASSES_ROOT,addr chkey,0,KEY_ALL_ACCESS,addr chkhnd
		.if	eax==ERROR_SUCCESS
			invoke	RegQueryValueEx,chkhnd,0,0,0,offset valdata,addr lbcbdata
			invoke	lstrcmp,addr valdata,addr ptrdir
			.if	eax!=0
				invoke	SetDlgItemText,hwnd,IDC_STATUS,offset prob
			.else
				invoke	EnableWindow,inshwnd,FALSE
				invoke	EnableWindow,uninshwnd,TRUE
				invoke	SetDlgItemText,hwnd,IDC_STATUS,offset installed
			
			.endif
		.else				
			invoke	EnableWindow,inshwnd,TRUE
			invoke	EnableWindow,uninshwnd,FALSE
			invoke	SetDlgItemText,hwnd,IDC_STATUS,offset ninstalled
		.endif
	.elseif	uMsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDOK	
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
		.elseif	ax==IDC_INSTALL
			invoke	RegOpenKeyEx,HKEY_CLASSES_ROOT,addr subkey,0,KEY_ALL_ACCESS,addr khnd
			invoke	RegCreateKeyEx,khnd,addr ckey,0,addr nullstr,REG_OPTION_NON_VOLATILE,KEY_ALL_ACCESS,0,addr hdhnd,addr dispos					
			invoke	RegCreateKeyEx,hdhnd,addr ckey1,0,addr nullstr,REG_OPTION_NON_VOLATILE,KEY_ALL_ACCESS,0,addr cmdhnd,addr dispos	
			invoke	lstrlen,addr ptrdir
			invoke	RegSetValueEx,cmdhnd,0,0,REG_SZ,addr ptrdir,eax
			invoke	SetDlgItemText,hwnd,IDC_STATUS,offset installed

			invoke	EnableWindow,inshwnd,FALSE
			invoke	EnableWindow,uninshwnd,TRUE
			invoke	SetDlgItemText,hwnd,IDC_STATUS,offset installed
		
		.elseif	ax==IDC_UNINSTALL
			invoke	RegOpenKeyEx,HKEY_CLASSES_ROOT,addr delkey,0,KEY_ALL_ACCESS,addr delhnd
			invoke	RegDeleteKey,delhnd,addr ckey1
			invoke	RegOpenKeyEx,HKEY_CLASSES_ROOT,addr subkey,0,KEY_ALL_ACCESS,addr delhnd
			invoke	RegDeleteKey,delhnd,addr ckey

			invoke	EnableWindow,inshwnd,TRUE
			invoke	EnableWindow,uninshwnd,FALSE
			invoke	SetDlgItemText,hwnd,IDC_STATUS,offset ninstalled
		.endif			
	.elseif	uMsg==WM_CLOSE
		invoke	RegCloseKey,delhnd
		invoke	RegCloseKey,khnd
		invoke	RegCloseKey,hdhnd
		invoke	RegCloseKey,chkhnd
		invoke	RegCloseKey,cmdhnd
		invoke	EndDialog,hwnd,0
	.else
		mov	eax,FALSE
		ret
	.endif
	mov	eax,TRUE
	ret												                   		              
dlgproc	endp
end	start	