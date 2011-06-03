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
ClassName	db "madhurclass",0
AppName 	db "Madhur's First Window",0                                 
dialogname	db 'MYDIALOGS',0
buffer		db 80 dup(0)
textof		db 'if dialog shows appname,then it proves that wm_command:lparam contains handle',0
edhwnd		LPARAM 0
.data?                           
hInstance dd ?
CommandLine dd ?                                 
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
	mov   	wc.cbWndExtra, DLGWINDOWEXTRA
	push  	hInst
	pop   	wc.hInstance
	mov   	wc.hbrBackground, COLOR_WINDOW-1
	mov   	wc.lpszMenuName, NULL
	mov   	wc.lpszClassName, OFFSET ClassName
	invoke 	LoadIcon, NULL, IDI_APPLICATION
	mov   	wc.hIcon, eax
	mov   	wc.hIconSm, eax
	invoke 	LoadCursor, NULL, IDC_ARROW
	mov   	wc.hCursor, eax
	invoke	RegisterClassEx,addr wc
	invoke	CreateDialogParam,hInstance,addr dialogname,NULL,NULL,NULL
	mov   	hwnd, eax
	invoke 	ShowWindow, hwnd, SW_SHOWNORMAL
	invoke 	UpdateWindow, hwnd
	.WHILE TRUE
		invoke GetMessage, ADDR msg, NULL, 0, 0
		.BREAK .IF (!eax)
		invoke	IsDialogMessage,hwnd,addr msg
		.if eax==FALSE
			invoke TranslateMessage, ADDR msg
			invoke DispatchMessage, ADDR msg
		.endif
	.ENDW
	mov     eax,msg.wParam
	ret
WinMain	endp

WndProc proc hWnd:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM
	.if uMsg==WM_DESTROY
		invoke PostQuitMessage, NULL
	.elseif uMsg==WM_COMMAND
		mov	eax,wParam
		.if	ax==105
			invoke	DestroyWindow,hWnd
		.elseif	ax==104
			invoke	MessageBox,0,addr AppName,addr ClassName,MB_OK
			invoke	GetDlgItem,hWnd,103
			mov	edhwnd,eax
			invoke	SetWindowText,edhwnd,addr ClassName
		.elseif	ax==106
			push	lParam
			pop	edhwnd
			invoke	SetWindowText,edhwnd,addr AppName
			invoke	MessageBox,0,addr textof,addr AppName,MB_OK
		
		.elseif	ax==101
			mov	edx,wParam
			shr	edx,16
			.if	dx==EN_CHANGE
				invoke	GetDlgItemText,hWnd,101,addr buffer,50
				invoke	SetDlgItemText,hWnd,102,addr buffer
			.endif				
					
		.endif				
		.else
			invoke DefWindowProc, hWnd, uMsg, wParam, lParam		
			ret
		.endif
	xor 	eax,eax
	ret
WndProc endp                                 
end	start	                 
