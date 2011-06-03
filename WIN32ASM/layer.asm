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

.const
dlgproc	proto  	hwnd:HWND,umsg:DWORD,wparam:WPARAM,lparam:LPARAM
dialog		db	'IDD_MAIN',0
IDOK		EQU	1
IDC_ABOUT	equ	101
IDEXIT		equ	9
user32		db	"user32.dll",0
SLWA         	 db 'SetLayeredWindowAttributes',0
IDC_SCROLL	EQU	102
.code
start:
	invoke	GetModuleHandle,NULL
	mov	[hinst],eax
	invoke	DialogBoxParam,hinst,addr dialog,0,addr dlgproc,0
	invoke	ExitProcess,0


dlgproc	proc	hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
local pSLWA:dword
local pos:dword
local schwnd:dword
	.if	uMsg==WM_INITDIALOG
		invoke GetModuleHandleA,addr user32
    		invoke GetProcAddress,eax,addr SLWA
    		mov pSLWA,eax

		
		invoke	GetWindowLong,hwnd,GWL_EXSTYLE
		or 	eax,WS_EX_LAYERED
		invoke	SetWindowLong,hwnd, GWL_EXSTYLE, eax

		; Make this window 70% alpha
		invoke	SetLayeredWindowAttributes,hwnd, 0,(255 * 70 / 100), LMA_ALPHA
		
		invoke	GetDlgItem,hwnd,IDC_SCROLL
		mov	schwnd,eax
		invoke	SetScrollRange,eax,SB_CTL,0,255,1
	.elseif	uMsg==WM_HSCROLL
		invoke	GetScrollPos,hwnd,IDC_SCROLL
		mov	pos,eax
		.if	wparam==SB_LINERIGHT
			inc	pos
		.endif
		invoke	SetScrollPos,schwnd,SB_CTL,pos,1

	.elseif	uMsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDOK
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
		.else
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