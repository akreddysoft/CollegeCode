;PE EXE
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
.data
dialog	db	'DIALOG1',0
rdhwnd	DW	0
wrhwnd	dw	0
buffer	db	1024 dup(0)

.data?
hinst	HINSTANCE	?
.const
dlgproc	proto	hwnd:HWND,umsg:DWORD,wparam:WPARAM,lparam:LPARAM
IDD_DIALOG1	equ	1
IDC_EDIT	equ	101
IDEXIT		equ	2
cmdline		db	'ml /?',0

.code
start:
	invoke	GetModuleHandle,NULL
	mov	[hinst],eax
	invoke	DialogBoxParam,hinst,addr dialog,0,addr dlgproc,0
	invoke	ExitProcess,0


dlgproc	proc	hwnd:HWND,umsg:DWORD,wparam:WPARAM,lparam:LPARAM
local	sa:SECURITY_ATTRIBUTES
local	sio:STARTUPINFO
LOCAL	pi:PROCESS_INFORMATION
	.if	umsg==WM_CREATE
		mov	sa.lpSecurityDescriptor,0
		mov	sa.bInheritHandle,1
		mov	sa.nLength,sizeof SECURITY_ATTRIBUTES
		invoke	CreatePipe,offset rdhwnd,offset wrhwnd,addr sa,0
		
		invoke	GetStartupInfo,addr sio
		mov	sio.cb,sizeof STARTUPINFO
		mov	sio.hStdInput,eax
		mov	sio.hStdOutput,eax
		mov	sio.hStdError,eax
		mov 	sio.wShowWindow,SW_HIDE 
		invoke	CreateProcess,0,addr cmdline,0,0,1,CREATE_NEW_CONSOLE,NORMAL_PRIORITY_CLASS,0,0,ADDR sio,addr pio
		
		invoke	ReadFile,rdhwnd,addr buffer,1024,0,0
		invoke	SendMessage
		
	.else	umsg==WM_CLOSE
		invoke	EndDialog,hwnd,0
	.endif
dlgproc	endp
		


end	start	