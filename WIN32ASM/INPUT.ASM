;32BIT EXE
.386
.model	flat,stdcall
option 	casemap:none
include	e:\masm32\include\windows.inc
include	e:\masm32\include\kernel32.inc
include e:\masm32\include\user32.inc
includelib e:\masm32\lib\user32.lib
includelib e:\masm32\lib\kernel32.lib
dlgproc		proto hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
.data
hfile		HANDLE	0
memp		dd	0
memh		dd	0
.data?
hinst	HINSTANCE	?
read1	dd		?
.const
mymenu		db	'MENU1',0
dialog1		db	'DIALOG1',0
IDC_EDIT1	EQU	101
IDOK		EQU	1
IDCANCEL	EQU	2
filn		db	'c:\scandisk.log',0
.code
start:
	invoke	GetModuleHandle,NULL
	mov	[hinst],eax
	invoke	DialogBoxParam,hinst,addr dialog1,0,addr dlgproc,0
	invoke	ExitProcess,0

dlgproc	proc	hwnd:HWND,umsg:DWORD,wparam:WPARAM,lparam:LPARAM
local	filez:dword
	.if	umsg==WM_INITDIALOG
		invoke	LoadMenu,[hinst],addr mymenu
	.elseif	umsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==1
			invoke	EndDialog,hwnd,0
		.elseif	ax==2
			invoke	CreateFile,offset filn,GENERIC_READ,FILE_SHARE_READ,0,OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL,0
			mov	hfile,eax
			invoke	GetFileSize,hfile,0
			mov	filez,eax
			invoke	GlobalAlloc,GMEM_MOVEABLE,65535
			mov	memh,eax
			invoke	GlobalLock,memh
			mov	memp,eax
			invoke	ReadFile,hfile,memp,65535,addr read1,0
			invoke	SetDlgItemText,hwnd,IDC_EDIT1,memp
			
			invoke	CloseHandle,hfile
			invoke	GlobalUnlock,memp
			invoke	GlobalFree,memh
		.endif
	.else
		mov	eax,FALSE
		RET
	.endif
	mov	eax,TRUE
	RET
dlgproc	endp
		
end	start	