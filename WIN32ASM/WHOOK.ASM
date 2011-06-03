;32BIT DLL
.386
.model	flat,stdcall
.nolist
option 	casemap:none
include	e:\masm32\include\windows.inc
include e:\masm32\include\kernel32.inc
include e:\masm32\include\user32.inc
include macro.inc
.listall
includelib e:\masm32\lib\user32.lib
includelib kernel32.lib
.data
hwnd	HWND	0 
hhook	dd	0

.data?


hInstance	HINSTANCE	?
.code
DllEntry proc hinst:HINSTANCE,reason:dword,reserved1:dword
	mov	eax,TRUE
	.if 	reason==DLL_PROCESS_ATTACH
		m2m	hInstance,hinst
	.elseif reason==DLL_PROCESS_DETACH

	.elseif reason==DLL_THREAD_ATTACH

	.else        ; DLL_THREAD_DETACH

	.endif
	ret
DllEntry endp

installhook	proc hWnd:HWND
	m2m	hwnd,hWnd
	mov	eax,offset mouseit
	invoke	SetWindowsHookEx,WH_MOUSE,eax,hInstance,0
	mov	hhook,eax
	ret
installhook	endp

mouseit	proc	nCode:UINT,wparam:WPARAM,lparam:LPARAM
local	handle:HWND

		invoke	CallNextHookEx,hhook,nCode,wparam,lparam
		mov	edx,lparam
		assume	edx:PTR MOUSEHOOKSTRUCT
		invoke	WindowFromPoint,[edx].pt.x,[edx].pt.y
		mov	handle,eax
		invoke	PostMessage,hwnd,WM_USER,handle,0
		xor	eax,eax
		ret
mouseit	endp

removehook	proc
	invoke	UnhookWindowsHookEx,hhook
	ret
removehook	endp
end	DllEntry