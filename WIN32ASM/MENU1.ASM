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
ClassName	db "Madhur'sWindowClass",0
AppName 	db "Madhur's First Window",0                                 
mymenu		db "ourmenu",0
myothermenu	db 'yourmenu',0
press		db 'you changed menu',0
.data?                           
hInstance dd ?
CommandLine dd ?     
hmenu HMENU   ?                         
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
	mov   	wc.lpszMenuName,NULL
	mov   	wc.lpszClassName, OFFSET ClassName
	invoke 	LoadIcon, NULL, IDI_APPLICATION
	mov   	wc.hIcon, eax
	mov   	wc.hIconSm, eax
	invoke 	LoadCursor, NULL, IDC_ARROW
	mov   	wc.hCursor, eax
	invoke	LoadMenu,hInstance,offset mymenu
	mov	hmenu,eax
	invoke 	RegisterClassEx, addr wc
	INVOKE 	CreateWindowEx,NULL,ADDR ClassName,ADDR AppName,\
           	WS_OVERLAPPEDWINDOW,CW_USEDEFAULT,\
          	CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,NULL,hmenu,\
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
	.elseif uMsg==WM_COMMAND
		mov	eax,wParam
	.if ax==2
		invoke DestroyWindow,hWnd
	.elseif ax==1
		invoke MessageBox,hWnd,offset press,offset AppName,MB_OK  				
		invoke LoadMenu,hInstance,offset myothermenu
		mov    hmenu,eax
		invoke SetMenu,hWnd,hmenu
	.endif
	.else
		invoke DefWindowProc, hWnd, uMsg, wParam, lParam		
		ret
	.endif
	xor 	eax,eax
	ret
WndProc endp                                 
end	start	                 
