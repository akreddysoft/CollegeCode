;PE EXE
.386
.model	flat,stdcall
option 	casemap:none
.nolist
include	windows.inc
include	kernel32.inc
include user32.inc
include macro.inc
include masm32.inc
.listall
includelib masm32.lib
includelib user32.lib
includelib kernel32.lib

.data?
hinst	HINSTANCE	?

.data
hread		dd	0
hwrite		dd	0
sinfo	STARTUPINFO<0>
CommandLine     db "execom /c /coff /Cp test.asm",0 
buffer		db	1000 dup(0)
nread		dd	0
pinfo		PROCESS_INFORMATION <0>
.const
dlgproc	proto  	hwnd:HWND,umsg:DWORD,wparam:WPARAM,lparam:LPARAM
dialog		db	'IDD_DIALOG1',0
IDOK		EQU	1
IDC_ABOUT	equ	101
IDEXIT		equ	9


.code
start:
	invoke	GetModuleHandle,NULL
	mov	[hinst],eax
	invoke	DialogBoxParam,hinst,addr dialog,0,addr dlgproc,0
	invoke	ExitProcess,0


dlgproc	proc	hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
 LOCAL sat:SECURITY_ATTRIBUTES 

	.if	uMsg==WM_INITDIALOG
		
	.elseif	uMsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDOK
			invoke	GetDlgItemText,hwnd,101,offset CommandLine,100
			mov sat.nLength,sizeof SECURITY_ATTRIBUTES 
                	mov sat.lpSecurityDescriptor,NULL 
                	mov sat.bInheritHandle,TRUE 
			
			invoke 	CreatePipe,offset hread,offset hwrite,addr sat,0
		
		mov	sinfo.cb,sizeof sinfo
		invoke 	GetStartupInfo,addr sinfo

		
		mov	sinfo.dwFlags,STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES
		mov	sinfo.wShowWindow,SW_SHOWNORMAL
		mov	eax,hwrite
		mov	sinfo.hStdError,eax
		mov	sinfo.hStdOutput,eax
		invoke 	CreateProcess, NULL, addr CommandLine, NULL, NULL, TRUE, NULL, NULL, NULL, addr sinfo, addr pinfo 
		invoke 	CloseHandle,hwrite
		invoke	ReadFile,hread,offset buffer,1001,addr nread,0
		invoke	SetDlgItemText,hwnd,102,offset buffer
		invoke	CloseHandle,hread
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
	
end	start	