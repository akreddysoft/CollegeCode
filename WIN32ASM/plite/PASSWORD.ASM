.386
.model	flat,stdcall
.nolist
option 	casemap:none
include	windows.inc
include kernel32.inc
include user32.inc
include macro.inc
.listall
includelib user32.lib
includelib kernel32.lib
.data
hInstance	dd	0
class		db	20 dup(0)
.data?
hWnd	HWND	?
hhook	dd	?
.const
edclass	db	'Edit',0
.code
DllEntry proc hinst:HINSTANCE,reason:dword,reserved1:dword
	mov	eax,TRUE
	.if 	reason==DLL_PROCESS_ATTACH
		m2m	hInstance,hinst
	.endif
	ret
DllEntry endp

installhook	proc	hwnd:HWND
	m2m	hWnd,hwnd
	mov	eax,offset mouseproc
	invoke	SetWindowsHookEx,WH_MOUSE,eax,hInstance,0
	mov	hhook,eax
	ret
installhook	endp

removehook	proc
	invoke	UnhookWindowsHookEx,hhook
	ret
removehook	endp

mouseproc proc	nCode:UINT,wparam:WPARAM,lparam:LPARAM
local	handle:HWND	
	invoke	CallNextHookEx,hhook,nCode,wparam,lparam
	mov	edx,lparam
	assume	edx:ptr  MOUSEHOOKSTRUCT 
	invoke	WindowFromPoint,[edx].pt.x,[edx].pt.y
	mov	handle,eax
	invoke	GetClassName,handle,addr class,20
	invoke	lstrcmp,addr edclass,addr class
	.if	eax==0
		invoke	PostMessage,hWnd,WM_USER,handle,0
	.else
		invoke	PostMessage,hWnd,WM_USER+1,0,0
	.endif					;not a edit control
	xor	eax,eax
	ret
mouseproc endp
end	DllEntry