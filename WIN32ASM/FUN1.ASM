;32BIT EMPTY WINDOW                 
.386                             
.model	flat,stdcall             
option 	casemap:none
include	d:\masm32\include\windows.inc
include	d:\masm32\include\kernel32.inc
include d:\masm32\include\user32.inc
includelib d:\masm32\lib\user32.lib
includelib d:\masm32\lib\kernel32.lib       
include gdi32.inc
includelib gdi32.lib      
WinMain proto :DWORD,:DWORD,:DWORD,:DWORD
.data             
ps	PAINTSTRUCT	<0>
hdc	HDC	0
a2	dd	0
.const               
ClassName	db "SimpleWinClass",0
AppName 	db "Our First Window",0  
appname	db	'madhur',0                               
.data?                           
hInstance 	HINSTANCE	?
CommandLine	LPSTR		?
.code                            
start:                           
        invoke  GetModuleHandle, NULL
	mov     hInstance,eax
	invoke  WinMain, hInstance, NULL, CommandLine, SW_SHOWDEFAULT
there:
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
	INVOKE 	CreateWindowEx,NULL,ADDR ClassName,ADDR AppName,\
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
	.elseif	uMsg==WM_PAINT
		invoke	GetDC,0
		.if	eax==0
			invoke	MessageBox,0,addr appname,addr appname,0
			jmp	there
		.endif
		mov	hdc,eax
	
		mov	a2,1
		.while	a2<500
			invoke	SetPixel,hdc,a2,a2,00123456h
			inc	a2
		.endw
	
		.if	eax==0
			invoke	MessageBox,0,addr appname,addr appname,0
			jmp	there
		.endif
		invoke	ReleaseDC,0,hdc
	.else
		invoke DefWindowProc, hWnd, uMsg, wParam, lParam		
		ret
	.endif
	xor 	eax,eax
	ret
WndProc endp                                 
end	start	                 
