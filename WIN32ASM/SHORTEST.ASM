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
button		db 'button',0
buthwnd		HWND 0
message		db 'the wm_command with ax=1 sent',0
message1	db 'this shows that in wm_command, lparam contains handle of control',0
handle		HWND ?
edit		db 'edit',0
edhwnd		HWND ?
buffer		db 10 dup(0)
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
	mov   	wc.cbWndExtra, NULL
	push  	hInst
	pop   	wc.hInstance
	mov   	wc.hbrBackground, COLOR_WINDOW
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
	.elseif uMsg==WM_CREATE
		invoke	CreateWindowEx,WS_VISIBLE or WS_CHILD,offset button,\
			offset button,BS_PUSHBUTTON or WS_CHILD or WS_VISIBLE,20,90,90,100,hWnd,1,\
			hInstance,NULL
		mov	buthwnd,eax
		invoke	CreateWindowEx,ES_MULTILINE,offset edit,offset edit,WS_CHILD or WS_VISIBLE,100,180,200,250,\
			hWnd,2,hInstance,NULL
		mov	edhwnd,eax				
	.elseif uMsg==WM_COMMAND
		mov	eax,wParam
		.if	ax==1
			invoke	GetWindowText,edhwnd,addr buffer,10
			invoke	SetWindowText,buthwnd,addr buffer
			call	convert
;			mov	handle,0000005ech
			;invoke	DestroyWindow,handle
			invoke	SendMessage,handle,WM_DESTROY,0,0
			invoke  MessageBox,0,addr message,addr AppName,MB_OK 
			mov	eax,lParam
			.if	eax==buthwnd
			;invoke  MessageBox,0,addr message1,addr AppName,MB_OK or MB_SYSTEMMODAL
			.endif				
		.endif
	.else
		invoke DefWindowProc, hWnd, uMsg, wParam, lParam		
		ret
	.endif
	xor 	eax,eax
	ret
WndProc endp                                 


convert proc
;local	len:dword
	
	push	esi
	push	ebx
	push	eax
	PUSH	ECX		
	;invoke	lstrlen,addr buffer
	;mov	len,eax
	mov	esi,8
	mov	bx,10h
	mov	cx,1h
	mov	handle,0
convit:
	xor	eax,eax
	mov	al,[buffer+si-1]
	cmp	al,0
	je	here
	and	ax,000fh
	mul	cx
	add	handle,eax
	mov	ax,cx
	mul	bx
	mov	cx,ax
	dec	si
	cmp	si,0
	jne	convit
	
here:
	pop	esi
	pop	ebx
	pop	eax
	pop	ecx
	ret

convert	endp
	
end	start	                 
