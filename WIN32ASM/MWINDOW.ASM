.386
.model	flat,stdcall
include windows.inc
include user32.inc
include	kernel32.inc
includelib kernel32.lib
includelib user32.lib
includelib kernel32.lib
.data
appname 	db 'madhur window',0
classname 	db 'madhur class',0
error		db 'cannot create window',0
error1		db 'cannot register class',0
error2		db 'cannot get module handle',0
text		db 'paint message sent',0
title1		db 'paint',0
.data?
wc WNDCLASSEX {?}
msg MSG {?}
hwnd HWND ?
hinstance HINSTANCE ?
cmdline LPSTR ?

.code
start:
invoke	GetModuleHandle,NULL
                                                               ; your program doesn't process the command line. 
.if	eax==0
call	qui3
.endif

mov	hinstance,eax

mov	wc.cbSize,SIZEOF WNDCLASSEX
mov	wc.style,CS_HREDRAW or CS_VREDRAW
mov	wc.lpfnWndProc,offset wndproc
mov	wc.cbClsExtra,0
mov	wc.cbWndExtra,0
push	hinstance
pop	wc.hInstance
mov     wc.hbrBackground,COLOR_WINDOW
mov	wc.lpszMenuName,0
mov	wc.lpszClassName,offset classname
invoke  LoadIcon,NULL,IDI_APPLICATION 
mov	wc.hIcon,eax
mov	wc.hIconSm,eax
invoke  LoadCursor,NULL,IDC_ARROW 
mov	wc.hCursor,eax

invoke 	RegisterClassEx,offset wc
.IF	eax==0
call	qui2
.endif
invoke	CreateWindowEx,0,offset classname,offset appname,WS_OVERLAPPEDWINDOW OR WS_VSCROLL ,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,0,0,hinstance,0
mov	hwnd,eax
.if	eax==0
call	qui1
.endif
invoke	ShowWindow,hwnd,SW_SHOWDEFAULT

.while	TRUE
invoke GetMessage,addr msg,NULL,0,0
.break .IF(!EAX)
invoke TranslateMessage,offset msg
invoke DispatchMessage,offset msg ;dispatches messages to wndproc procedure
.endw
mov	eax,msg.wParam
invoke	ExitProcess,0

wndproc proc hwnd1:HWND,uMsg:UINT,wParam:WPARAM,lParam:LPARAM
.if uMsg==WM_DESTROY       ;WM_DESLTROY ALSO WORKS
invoke PostQuitMessage,0
.else
invoke DefWindowProc,hwnd1,uMsg,wParam,lParam     
ret
.endif
xor	eax,eax
ret
wndproc endp

qui1:
invoke	MessageBox, 0,offset error,offset appname,MB_OK OR MB_ICONSTOP
invoke	ExitProcess,0
qui2:
invoke	MessageBox,0,offset error1,offset appname,MB_OK OR MB_ICONSTOP
invoke	ExitProcess,0
qui3:
invoke	MessageBox,0,offset error2,offset appname,MB_OK OR MB_ICONSTOP
invoke	ExitProcess,0

end	start
