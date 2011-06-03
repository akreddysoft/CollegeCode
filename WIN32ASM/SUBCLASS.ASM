;32BIT EMPTY WINDOW                 
.386                             
.model	flat,stdcall             
option 	casemap:none
.nolist
include	e:\masm32\include\windows.inc
include	e:\masm32\include\kernel32.inc
include e:\masm32\include\user32.inc
.listall
includelib e:\masm32\lib\user32.lib
includelib e:\masm32\lib\kernel32.lib             
WinMain proto :DWORD,:DWORD,:DWORD,:DWORD
.const               
ClassName	db "SimpleWinClass",0
AppName 	db "Our First Window",0     
edclass		db	'Edit',0
.data?                           
hInstance 	HINSTANCE	?
CommandLine	LPSTR		?
edhwnd		HWND		?
preproc		dd		?
.code                            
start:                           
        invoke  GetModuleHandle, NULL
	mov     hInstance,eax
	invoke  WinMain, hInstance, NULL, CommandLine, SW_SHOWDEFAULT
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
	mov   	wc.hbrBackground, COLOR_APPWORKSPACE
	mov   	wc.lpszMenuName, NULL
	mov   	wc.lpszClassName, OFFSET ClassName
	invoke 	LoadIcon, NULL, IDI_APPLICATION
	mov   	wc.hIcon, eax
	mov   	wc.hIconSm, eax
	invoke 	LoadCursor, NULL, IDC_ARROW
	mov   	wc.hCursor, eax
	invoke 	RegisterClassEx, addr wc
	INVOKE 	CreateWindowEx,WS_EX_CLIENTEDGE,ADDR ClassName,ADDR AppName,\
           	WS_OVERLAPPEDWINDOW,CW_USEDEFAULT,\
          	CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,NULL,NULL,\
           	hInst,NULL
	mov   	hwnd, eax
	invoke 	ShowWindow, hwnd, SW_SHOWNORMAL
	invoke 	UpdateWindow, hwnd
	.WHILE TRUE
		invoke GetMessage, ADDR msg, NULL, 0, 0
		.BREAK .IF (!eax)
		invoke TranslateMessage, ADDR msg
		invoke DispatchMessage, ADDR msg
	.ENDW
	mov     eax,msg.wParam
	ret
WinMain	endp

WndProc proc hWnd:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM
local	wc:WNDCLASSEX	
	.if uMsg==WM_DESTROY
		invoke PostQuitMessage, NULL
	.elseif	uMsg==WM_CREATE
		invoke	CreateWindowEx,0,addr edclass,addr ClassName,WS_CHILD or WS_VISIBLE or ES_MULTILINE,10,20,30,40,hWnd,1,hInstance,0
		mov	edhwnd,eax
;		invoke	GetClassInfo,0,addr edclass,addr wc
;		mov	preproc,wc.lpfnWndProc
		mov	eax,offset newproc
		invoke	SetWindowLong,edhwnd,GWL_WNDPROC,eax
		mov	preproc,eax
	.else
		invoke DefWindowProc, hWnd, uMsg, wParam, lParam		
		ret
	.endif
	xor 	eax,eax
	ret
WndProc endp                                 

newproc	proc hwnd:HWND,umsg:UINT,wparam:WPARAM,lparam:LPARAM
	.if	umsg==WM_CHAR
		.if	wparam=='A'
			mov	eax,wparam
			invoke	MessageBox,0,addr AppName,addr AppName,0
			invoke	CallWindowProc,preproc,edhwnd,WM_CHAR,66h,lparam
			RET
		.endif
	.endif
	invoke	CallWindowProc,preproc,edhwnd,umsg,wparam,lparam
	ret
newproc	endp

end	start	                 
