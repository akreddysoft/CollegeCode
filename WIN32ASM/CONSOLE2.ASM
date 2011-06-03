;A graphical user interface (GUI) or console process that is not currently attached to a console can use the AllocConsole function to create a new console. 
;A GUI or console process can use the CreateProcess function to create a new console process and specify a flag to tell the system to create a new console.
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
sio	STARTUPINFO		<0>
sai	PROCESS_INFORMATION	<0>
rdhwnd	HWND	0
dialog	db	'IDD_DIALOG1',0
wrhwnd	HWND	0
buffer	db	1024 dup(0)
prdhwnd	HWND	0
pwrhwnd	HWND	0
.data?
hinst	HINSTANCE	?
.const
cmdline	db	'ml.exe kj',0
dlgproc	proto	hwnd:HWND,umsg:DWORD,wparam:WPARAM,lparam:LPARAM
IDD_DIALOG1	equ	1
IDC_EDIT	equ	101
IDEXIT		equ	2
IDOK		EQU	1
.code
start:
	invoke	GetModuleHandle,NULL
	mov	[hinst],eax
	invoke	DialogBoxParam,hinst,addr dialog,0,addr dlgproc,0
	invoke	ExitProcess,0
	
dlgproc	proc	hwnd:HWND,umsg:DWORD,wparam:WPARAM,lparam:LPARAM
local bread:dword
;local	sai:STARTUPINFO
local   pi:PROCESS_INFORMATION
	.if	umsg==WM_INITDIALOG
		invoke	AllocConsole
		invoke	CreatePipe,addr rdhwnd,addr wrhwnd,0,0
		;invoke	SetStdHandle,rdhwnd,STD_INPUT_HANDLE		;no need
		mov	eax,rdhwnd
		mov	sio.hStdInput,eax
		mov 	sio.dwFlags, STARTF_USESHOWWINDOW+ STARTF_USESTDHANDLES
		mov	eax,wrhwnd
    		mov	sio.hStdOutput,eax 
    		mov	sio.hStdError,eax
		invoke	CreateProcess,0,addr cmdline,0,0,0,0,0,0,addr sio,addr pi			
		
		
		invoke	ReadFile,rdhwnd,addr buffer,1023,addr bread,0
		invoke	SetDlgItemText,hwnd,IDC_EDIT,addr buffer
		
		invoke	CloseHandle,wrhwnd
		
		invoke	CloseHandle,rdhwnd
		
		invoke	FreeConsole
	.ELSEif	umsg==WM_CLOSE
		invoke	EndDialog,hwnd,0
	.else	
		mov	eax,0
		ret
	.endif
	mov	eax,1
	ret

dlgproc 	endp	

end	start	