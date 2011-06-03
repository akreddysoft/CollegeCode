;PE EXE
.386
.model	flat,stdcall
option 	casemap:none
.nolist
include	e:\masm32\include\windows.inc
include	e:\masm32\include\kernel32.inc
include e:\masm32\include\user32.inc
include macro.inc
.listall
includelib e:\masm32\lib\user32.lib
includelib e:\masm32\lib\kernel32.lib
.data

.data?
hinst	HINSTANCE	?
oldproc	dd		?
oldhinst	HINSTANCE	?
edhwnd1		HWND		?
edhwnd2		HWND		?

.const
myedit		db	'myedit',0
edclass		db	'edit',0
dialog		db	'IDD_DIALOG1',0
IDOK		EQU	1
IDC_EDIT	equ	101
IDEXIT		equ	2
dlgproc	proto	hwnd:HWND,umsg:DWORD,wparam:WPARAM,lparam:LPARAM
editproc	proto	hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM

.code
start:
	invoke	GetModuleHandle,NULL
	mov	[hinst],eax
	invoke	DialogBoxParam,[hinst],addr dialog,0,addr dlgproc,0
	invoke	ExitProcess,0

dlgproc	proc	hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
local	wc:WNDCLASSEX
	.if	uMsg==WM_INITDIALOG
		mov	wc.cbSize,sizeof WNDCLASSEX
		invoke	GetClassInfoEx,0,addr edclass,addr wc
		m2m	oldproc,wc.lpfnWndProc
		m2m	wc.hInstance,hinst
		mov	wc.lpszClassName,offset myedit
		mov	wc.lpfnWndProc,offset editproc
		invoke	RegisterClassEx,addr wc
		invoke	CreateWindowEx,WS_EX_CLIENTEDGE,offset myedit,offset edclass,WS_CHILD OR WS_VISIBLE,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,hwnd,22,hinst,0
		invoke	GetLastError
		mov	edhwnd1,eax
		;invoke	CreateWindowEx,0,offset myedit,offset edclass,WS_CHILD OR WS_VISIBLE,10,20,30,40,hwnd,10,hinst,0
		mov	edhwnd2,eax
	.elseif	uMsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==1
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
		.endif			
	.elseif	uMsg==WM_CLOSE
		invoke	EndDialog,hwnd,0
	.else
		mov	eax,FALSE
		ret
	.endif
	mov	eax,TRUE
	ret												                   		              
dlgproc	endp


editproc	proc	hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
	.if	uMsg==WM_CHAR
		mov	eax,wparam
		.if	eax>='a' && eax<='z'
			add	eax,20h
		.endif
		mov	wparam,eax

	.else
		invoke	CallWindowProc,oldproc,edhwnd1,uMsg,wparam,lparam
		ret
	.endif
	invoke	CallWindowProc,oldproc,edhwnd1,uMsg,wparam,lparam
	ret												                   		              
editproc	endp
end	start	