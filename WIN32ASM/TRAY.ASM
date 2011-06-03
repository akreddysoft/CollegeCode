;PE EXE
.386
.model	flat,stdcall
option 	casemap:none
.nolist
include	windows.inc
include	kernel32.inc
include user32.inc
include macro.inc
include shell32.inc
include masm32.inc
.listall
includelib masm32.lib
includelib shell32.lib
includelib user32.lib
includelib kernel32.lib
.data
nid	NOTIFYICONDATA	<0>
tip	db	'madhur"S tray icon',0
RestoreString db "&Restore",0 
ExitString   db "E&xit Program",0 
.data?
hinst	HINSTANCE	?
hmenu	dword		?
.const
dlgproc	proto	hwnd:HWND,umsg:DWORD,wparam:WPARAM,lparam:LPARAM
dialog	db	'IDD_DIALOG1',0
IDOK	EQU	1
icon	db	'ICON1',0
IDC_STATUS	EQU		101
IDC_STATUS1	EQU		102
IDM_RESTORE 	equ 		1000 
IDM_EXIT 	equ 		1010 

.code
start:
	invoke	GetModuleHandle,NULL
	mov	[hinst],eax
	invoke	DialogBoxParam,hinst,addr dialog,0,addr dlgproc,0
	invoke	ExitProcess,0


dlgproc	proc	uses ebx hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
local	hicon:dword
local	wbuf[12]:byte
local	lbuf[12]:byte
local	pi:POINT
	.if	uMsg==WM_INITDIALOG
		mov	nid.cbSize,sizeof NOTIFYICONDATA
		m2m	nid.hwnd,hwnd
		mov	nid.uID,25h
		mov	nid.uFlags,NIF_MESSAGE OR NIF_TIP or NIF_ICON
		mov	nid.uCallbackMessage,WM_USER
		invoke  lstrcpy,addr nid.szTip,addr tip 
            
		invoke	LoadIcon,hinst,offset icon
		mov	hicon,eax
		m2m	nid.hIcon,hicon
		
		invoke	CreatePopupMenu
		mov	hmenu,eax
		
		invoke	AppendMenu,hmenu,MF_STRING,IDM_RESTORE,addr RestoreString 
        	invoke 	AppendMenu,hmenu,MF_STRING,IDM_EXIT,addr ExitString 
    
		
	.elseif	uMsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDOK
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
		.elseif	ax==IDM_RESTORE
			invoke	ShowWindow,hwnd,SW_RESTORE
		.elseif	ax==IDM_EXIT
			invoke	EndDialog,hwnd,0	
		.endif
	.elseif	uMsg==WM_CLOSE
		invoke	EndDialog,hwnd,0
	.elseif	uMsg==WM_SIZE
		mov	eax,wparam
		.if	eax==SIZE_MINIMIZED
			invoke	Shell_NotifyIcon,NIM_ADD,offset nid
			invoke	ShowWindow,hwnd,SW_HIDE
		.elseif	eax==SIZE_RESTORED
			invoke	Shell_NotifyIcon,NIM_DELETE,offset nid
		.elseif	eax==SIZE_MAXIMIZED
			invoke	Shell_NotifyIcon,NIM_DELETE,offset nid
		.endif
			
	.elseif	uMsg==WM_USER
		invoke	FlashWindow,hwnd,TRUE
		mov	ebx,wparam
		invoke	dw2hex,ebx,addr wbuf
		mov	ebx,lparam
		invoke	dw2hex,ebx,addr lbuf
		invoke	SetDlgItemText,hwnd,IDC_STATUS,addr wbuf	
		invoke	SetDlgItemText,hwnd,IDC_STATUS1,addr lbuf
		.if	lparam==WM_RBUTTONDOWN
			invoke	GetCursorPos,addr pi
			invoke	SetForegroundWindow,hwnd	;imp corrects bug
			invoke	TrackPopupMenu,hmenu,TPM_RIGHTALIGN,pi.x,pi.y,0,hwnd,0	
			invoke  PostMessage,hwnd,WM_NULL,0,0	;imp corrects bug
		.elseif	lparam==WM_LBUTTONDBLCLK
			invoke	ShowWindow,hwnd,SW_RESTORE
		.endif
	.else
		mov	eax,FALSE
		ret
	.endif
	mov	eax,TRUE
	ret												                   		              
dlgproc	endp

end	start	