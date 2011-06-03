;32BIT DLL
.386
.model	flat,stdcall
.nolist
option 	casemap:none
include	windows.inc
include kernel32.inc
include user32.inc
include macro.inc
include gdi32.inc
.listall
includelib gdi32.lib
includelib user32.lib
includelib kernel32.lib
.data
hbm	dd	0
bm	db	'bm',0
AppName	db	'Splash Screen',0
ClassName	db	'MADHUR',0
hInst	HINSTANCE	0
.data?


.code
DllEntry proc hinst:HINSTANCE,reason:dword,reserved1:dword
	mov	eax,TRUE
	.if 	reason==DLL_PROCESS_ATTACH
		m2m	hInst,hinst
		call	showbitmap
	.elseif reason==DLL_PROCESS_DETACH

	.elseif reason==DLL_THREAD_ATTACH

	.else        ; DLL_THREAD_DETACH

	.endif
	ret
DllEntry endp

showbitmap	proc
local	wc:WNDCLASSEX
local	msg:MSG
local	hWnd:HWND

	mov   	wc.cbSize, SIZEOF WNDCLASSEX
	mov   	wc.style, CS_HREDRAW or CS_VREDRAW
	mov   	wc.lpfnWndProc, OFFSET WndProc
	mov   	wc.cbClsExtra, NULL
	mov   	wc.cbWndExtra, NULL
	push  	hInst
	pop   	wc.hInstance
	mov   	wc.hbrBackground, COLOR_WINDOW+1
	mov   	wc.lpszMenuName, NULL
	mov   	wc.lpszClassName, OFFSET ClassName
	invoke 	LoadIcon, NULL, IDI_APPLICATION
	mov   	wc.hIcon, eax
	mov   	wc.hIconSm, eax
	invoke 	LoadCursor, NULL, IDC_ARROW
	mov   	wc.hCursor, eax
	invoke 	RegisterClassEx, addr wc
	INVOKE 	CreateWindowEx,NULL,ADDR ClassName,ADDR AppName,\
           	WS_POPUP,CW_USEDEFAULT,\
          	CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,NULL,NULL,\
           	hInst,NULL
	mov   	hWnd, eax
	invoke 	ShowWindow, hWnd, SW_SHOWNORMAL
	invoke 	UpdateWindow, hWnd
	.WHILE TRUE
		invoke GetMessage, ADDR msg, NULL, 0, 0
		.BREAK .IF (!eax)
		invoke TranslateMessage, ADDR msg
		invoke DispatchMessage, ADDR msg
	.ENDW
	mov     eax,msg.wParam
	ret
showbitmap	endp

WndProc proc hWnd:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM
local 	hdc:HDC
local	mhdc:HDC
local	rect:RECT
	.if uMsg==WM_DESTROY
		invoke  PostQuitMessage, NULL
	.elseif	uMsg==WM_CREATE
		invoke	LoadBitmap,hInst,addr bm
		mov	hbm,eax
		invoke	GetDC,hWnd
		mov	hdc,eax
		invoke	CreateCompatibleDC,hdc
		mov	mhdc,eax
		invoke	SelectObject,mhdc,hbm
		invoke	SetTimer,hWnd,10,5000,0
		invoke	GetDesktopWindow
		mov	edx,eax
		invoke	GetWindowRect,edx,addr rect
		invoke	BitBlt,hdc,0,0,rect.right,rect.bottom,mhdc,0,0,SRCCOPY
		invoke  DeleteDC,mhdc
		invoke	ReleaseDC,hWnd,hdc
	.elseif	uMsg==WM_TIMER
		invoke	KillTimer,hWnd,10
		;invoke	DeleteObject,hbm
		invoke	SendMessage,hWnd,WM_DESTROY,0,0	
	.elseif	uMsg==WM_LBUTTONDOWN
		invoke	KillTimer,hWnd,10
		invoke	SendMessage,hWnd,WM_DESTROY,0,0	
		;invoke	SendMessage,hWnd,WM_TIMER,10,0
	.else
		invoke DefWindowProc, hWnd, uMsg, wParam, lParam		
		ret
	.endif
	xor 	eax,eax
	ret
WndProc endp                                 


end	DllEntry