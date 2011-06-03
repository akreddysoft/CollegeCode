;32BIT EXE
.386
.model	flat,stdcall
option 	casemap:none
include	e:\masm32\include\windows.inc
include	e:\masm32\include\kernel32.inc
include e:\masm32\include\user32.inc
includelib e:\masm32\lib\user32.lib
includelib e:\masm32\lib\kernel32.lib
.data
dlgproc		proto hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
procinfo PROCESS_INFORMATION <> 
startinfo	STARTUPINFO <>
.data?
hinst	HINSTANCE	?

.const
btclass		db	'button',0
dialog1		db	'DIALOG1',0
IDC_EDIT1	EQU	101
IDOK		EQU	1
IDCANCEL	EQU	2
path		db	'c:\windows\sol.exe',0
.code
start:
	invoke	GetModuleHandle,NULL
	mov	[hinst],eax
	invoke	DialogBoxParam,hinst,offset dialog1,0,offset dlgproc,0
	invoke	ExitProcess,0

dlgproc	proc	hwnd:HWND,umsg:DWORD,wparam:WPARAM,lparam:LPARAM
	.if	umsg==WM_INITDIALOG
		invoke	CreateWindowEx,WS_EX_WINDOWEDGE,offset btclass,offset btclass,WS_VISIBLE or WS_CHILD,10,10,20,20,hwnd,22,hinst,0
		.if	eax==0
			invoke	MessageBox,0,addr btclass,addr btclass,0
		.endif
	.elseif	umsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==1
			invoke	GetStartupInfo,addr startinfo
			invoke	CreateProcess,0,addr path,0,0,0,NORMAL_PRIORITY_CLASS,0,0,ADDR startinfo,addr procinfo
		.elseif	ax==2
			invoke	EndDialog,hwnd,0
		.endif
	.else
		mov	eax,FALSE
		RET
	.endif
	mov	eax,TRUE
	RET
dlgproc	endp
end	start	