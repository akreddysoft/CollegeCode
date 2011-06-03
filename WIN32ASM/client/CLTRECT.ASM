.386
.model	flat,stdcall
.nolist
option 	casemap:none
include	windows.inc
include kernel32.inc
include user32.inc
include ..\macro.inc
.listall
includelib user32.lib
includelib kernel32.lib
.data
hInstance	dd	0
class		db	20 dup(0)
.data?
lav db	 10 dup(?)  ;for searching in softice
hWnd	HWND	?
hhook	dd	?
.const
.code
DllEntry proc hinst:HINSTANCE,reason:dword,reserved1:dword
	mov	eax,TRUE
	.if 	reason==DLL_PROCESS_ATTACH
		
		m2m	hInstance,hinst
	.endif
	ret
DllEntry endp

installhook	proc	hwnd:HWND
	mov	lav,'s'
	mov	lav+1,'e'
	mov	lav+2,'x'
	
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
	;push	edx
	;invoke	WindowFromPoint,[edx].pt.x,[edx].pt.y
	;pop	edx
	;mov	handle,eax
	;invoke  PostMessage,hWnd,WM_USER,[edx].pt.x,handle
	invoke	PostMessage,hWnd,WM_USER,[edx].pt.x,[edx].pt.y
	xor	eax,eax
	ret
mouseproc endp
end	DllEntry