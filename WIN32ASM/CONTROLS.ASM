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
buttonid	equ 1
editid		equ 2
.data                            
ClassName	db "Madhur'sWindowClass",0
AppName 	db "Madhur's First Window",0                                 
buttonclass	db 'button',0
editclass	db 'edit',0
buttontext	db 'madhurs button',0
.data?                           
hInstance dd ?
CommandLine dd ?  
hwndbutton HWND ?
hwndedit HWND ?                               
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
	push  	hInstance
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
	invoke 	CreateWindowEx,NULL,ADDR ClassName,ADDR AppName,\
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
WinMain	ENDP

WndProc proc hWnd:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM
	;local	hwndbutton:HWND         doesnt work here
	;local	hwndedit:HWND
	.if uMsg==WM_DESTROY
		invoke 	PostQuitMessage, NULL
	.elseif uMsg==WM_COMMAND
		mov	eax,wParam
		.if ax==25
			invoke	SetWindowText,hwndedit,addr AppName
               	.elseif ax==buttonid
			shr eax,16
			.if ax==BN_CLICKED
				invoke 	SendMessage,hWnd,WM_COMMAND,25,0
			.endif
		.endif
	.elseif uMsg==WM_CREATE
		invoke	CreateWindowEx,WS_EX_CLIENTEDGE or WS_EX_APPWINDOW,addr buttonclass,offset buttontext,\
			WS_CHILD OR BS_DEFPUSHBUTTON or WS_VISIBLE,75,70,160,60,hWnd,buttonid,hInstance,NULL
		mov	hwndbutton,eax
		invoke	CreateWindowEx,WS_EX_CLIENTEDGE or WS_EX_APPWINDOW,addr editclass,offset buttontext,\
			WS_CHILD OR BS_DEFPUSHBUTTON or WS_VISIBLE,200,270,260,260,hWnd,editid,hInstance,NULL
		mov	hwndedit,eax			
	.else
		invoke DefWindowProc, hWnd, uMsg, wParam, lParam		
		ret
	.endif
	xor 	eax,eax
	ret
WndProc endp                                 
end	start	                 
