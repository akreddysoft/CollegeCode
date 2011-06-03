;32BIT EMPTY WINDOW                 
.386                             
.model	flat,stdcall             
option 	casemap:none             
include	windows.inc              
include	kernel32.inc             
include user32.inc               
includelib user32.lib            
includelib kernel32.lib          
WinMain proto :DWORD,:DWORD,:DWORD,:DWORD
.data                            
ClassName	db "Madhur's",0
AppName 	db "Madhur'sWindow",0                                 
button		db 'button',0
edit		db 'edit',0
text		db 'you pressed the button',0
mymenu		db 'MYMENU',0
buffer		db 80 dup(0)
.data?                           
hInstance dd ?
CommandLine dd ?                                 
bthwnd	HWND ?
edhwnd	HWND ?
edhwnd1	HWND ?
.code                            
start:                           
        invoke  GetModuleHandle, NULL
	mov     hInstance,eax
	invoke  GetCommandLine
	mov     CommandLine,eax
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
	push  	hInst
	pop   	wc.hInstance
	mov   	wc.hbrBackground, COLOR_WINDOW-1
	mov   	wc.lpszMenuName,offset mymenu
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
	
	.if uMsg==WM_DESTROY
		invoke PostQuitMessage, NULL
	.elseif uMsg==WM_CREATE
		invoke	CreateWindowEx,WS_EX_WINDOWEDGE,offset button,NULL,\
			BS_ICON or WS_CHILD or WS_VISIBLE,75,70,160,60,\
			hWnd,1,hInstance,NULL
		mov	bthwnd,eax			
		invoke	CreateWindowEx,WS_EX_WINDOWEDGE,offset edit,NULL,\
			ES_LOWERCASE or WS_CHILD or WS_THICKFRAME or ES_MULTILINE or  WS_VISIBLE,200,300,310,330,hWnd,2,\
			hInstance,NULL
		mov	edhwnd,eax
		invoke	CreateWindowEx,WS_EX_WINDOWEDGE,offset edit,NULL,\
			ES_LOWERCASE or WS_CHILD or WS_THICKFRAME or ES_MULTILINE or  WS_VISIBLE,10,20,30,50,hWnd,3,\
			hInstance,NULL
		mov	edhwnd1,eax			
	.elseif uMsg==WM_COMMAND
		mov	eax,wParam
		and	eax,0000ffffh
		.if	ax==1
		invoke	CreateWindowEx,WS_EX_WINDOWEDGE,offset button,NULL,\
			BS_ICON or WS_CHILD or WS_VISIBLE,90,170,200,250,\
			hWnd,4,hInstance,NULL
			invoke	GetWindowText,edhwnd1,addr buffer,10
			invoke	SetWindowText,edhwnd, addr buffer
		.elseIF	ax==101
			invoke	MessageBox,0,addr ClassName,addr AppName,MB_TASKMODAL
		.endif			
	.else
		invoke DefWindowProc, hWnd, uMsg, wParam, lParam		
		ret
	.endif
	xor 	eax,eax
	ret
WndProc endp                                 
end	start	                 
