;32BIT EXE
.386
.model	flat,stdcall
option 	casemap:none
.nolist
include	windows.inc
include	kernel32.inc
include user32.inc
include	comdlg32.inc
.listall
includelib comdlg32.lib
includelib user32.lib
includelib kernel32.lib
.data
dlgproc proto hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
dlgprocabt proto hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
ofn		OPENFILENAME <?>
maindialog	db 'IDD_MAINDIALOG',0
abtdialog	db 'IDD_ABTDIALOG',0
FilterString	db 'All Files(*.*)',0,'*.*',0,0
OurTitle	db 'Select FileName',0
buffer		db 80 dup(0)
.data?
hinst	HINSTANCE ?
.const
IDC_archive	EQU	104
IDC_RESET	EQU	110
IDC_MODIFY	EQU	109
IDC_FILEPATH	EQU	101
IDC_SYSTEMCHECK	EQU	106
IDC_HIDDENCHECK	EQU	105
IDC_READCHECK	EQU	103
IDC_ABOUT	EQU	108
IDC_BUTTON2	EQU	108
IDC_CHECKBOX4	EQU	106
IDC_CHECKBOX3	EQU	105
IDC_CHECKBOX2	EQU	104
IDC_CHECKBOX1	EQU	103
IDC_BROWSE	EQU	102
.code
start:
	invoke	GetModuleHandle,0
	mov	hinst,eax
	invoke	DialogBoxParam,hinst,addr maindialog,0,addr dlgproc,0
	invoke	ExitProcess,0

dlgproc proc hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
	.if	uMsg==WM_SETICON
		invoke	LoadIcon,0,IDI_APPLICATION
		mov	wparam,ICON_BIG
		mov	lparam,eax
	.elseif	uMsg==WM_COMMAND
		mov	eax,wparam
		mov	edx,wparam
		shr	edx,16
		.if	dx==BN_CLICKED
			.if	ax==IDC_BROWSE
				call	init
				invoke	GetOpenFileName,addr ofn
				.if	eax==1
					invoke	GetFileAttributes,addr buffer
					invoke	SetDlgItemText,hwnd,IDC_FILEPATH,addr buffer
				.endif
			.elseif ax==IDC_ABOUT
				invoke	DialogBoxParam,hinst,addr abtdialog,hwnd,dlgprocabt,0
			.elseif ax==2
				invoke	EndDialog,hwnd,0
			.endif
		.endif
	.elseif	 uMsg==WM_CLOSE
		invoke	EndDialog,hwnd,0
	.else
		mov	eax,FALSE
		ret
	.endif
	mov	eax,TRUE
	ret
dlgproc	endp

dlgprocabt proc hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
	.if uMsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==1
			invoke	EndDialog,hwnd,0
		.endif
	.elseif	uMsg==WM_CLOSE
		invoke	EndDialog,hwnd,0
	.else
		mov	eax,FALSE
		ret
	.endif
	mov	eax,TRUE
	ret
dlgprocabt	endp																																				

init	proc
	mov 	ofn.lStructSize,SIZEOF ofn
	push 	hinst
	pop  	ofn.hInstance
	mov	ofn.hwndOwner,0
	mov  	ofn.lpstrFilter, OFFSET FilterString
	mov  	ofn.lpstrFile, OFFSET buffer
	mov  	ofn.nMaxFile,256
	mov  	ofn.Flags, OFN_FILEMUSTEXIST or \
		OFN_PATHMUSTEXIST or OFN_LONGNAMES or\
		OFN_EXPLORER or OFN_HIDEREADONLY
	mov  	ofn.lpstrTitle, OFFSET OurTitle
	ret
init	endp
end	start
