;32BIT DLL
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

hInst	HINSTANCE	0

.data?
hhook	dd	?
hwnd	HWND	?
.code
DllEntry proc hinst:HINSTANCE,reason:dword,reserved1:dword
	mov	eax,TRUE
	.if 	reason==DLL_PROCESS_ATTACH
		m2m	hInst,hinst
	.elseif reason==DLL_PROCESS_DETACH

	.elseif reason==DLL_THREAD_ATTACH

	.else        ; DLL_THREAD_DETACH

	.endif
	ret
DllEntry endp


installhook	proc hWnd:HWND
	m2m	hwnd,hWnd
	mov	eax,offset keyproc
	invoke	SetWindowsHookEx,WH_KEYBOARD,eax,hInst,0
	mov	hhook,eax	
	ret
installhook	endp

removehook	proc
	invoke	UnhookWindowsHookEx,hhook
	ret
removehook	endp

keyproc	proc code:dword,wparam:WPARAM,lparam:LPARAM
	
	.if	wparam==VK_F5
		invoke	SendMessage,hwnd,WM_USER,wparam,lparam
	.endif
	invoke	CallNextHookEx,hhook,code,wparam,lparam	
	ret
keyproc	endp
end	DllEntry