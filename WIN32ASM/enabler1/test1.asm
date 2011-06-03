;PE EXE
;SAMLE FILE FOR EXAMINING RESOURCES UNDER MEMORY

.386
.model	flat,stdcall
option 	casemap:none
.nolist
include	windows.inc
include	kernel32.inc
include user32.inc
;include macro.inc

includelib user32.lib
includelib kernel32.lib
.listall
dlgproc	proto  hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
.data?
hinst	HINSTANCE	?
.data
one	db	'This is the sample data',0
.const
const1	dw	1234h
two	db	'this is the constant data',0
msg	db	"you have unlocked the button",0
msg1	db	"you have unlocked the button",0
dlg	db	"IDD_DIALOG1",0
;msg1	equ	msg
.code
start:
	invoke	GetModuleHandle,NULL
	mov	[hinst],eax
	invoke	DialogBoxParam,hinst,addr dlg,0,addr dlgproc,0
	invoke	ExitProcess,0


dlgproc	proc hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
	.if	uMsg==WM_CLOSE
		invoke	EndDialog,hwnd,0
	.elseif	uMsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==101
			invoke	MessageBox,0,addr msg,addr msg1,0
		.endif
	
	.else
		xor	eax,eax
		ret
	.endif
	mov	eax,1
	ret
dlgproc	endp

end	start	