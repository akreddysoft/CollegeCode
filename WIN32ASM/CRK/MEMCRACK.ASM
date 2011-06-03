;PE EXE
.386
.model	flat,stdcall
option 	casemap:none
.nolist
include	windows.inc
include	kernel32.inc
include user32.inc
include macro.inc
.listall
includelib user32.lib
includelib kernel32.lib

.data?
hinst	HINSTANCE	?

.data
name1	db	'madhur',20 dup(0)
regcode	db	"MA",20 dup(0)           

err1	db	'Check, something is missing',0
title1	db	'Memory Analyst key generator by Madhur',0
err2	db	'enter name',0

dialog	db	"IDD_DIALOG1",0
abtdlg	db	"DIALOG_2",0
.const
dlgproc	proto hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
abtdlgproc	proto hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
IDD_DIALOG1	equ	1
IDCNAME		equ	104
IDCREG		equ	103
IDOK1		equ	103
IDCSTAT		equ	105
IDABOUT		equ	2
IDEXIT		equ	1
.code
start:
	invoke	GetModuleHandle,NULL
	mov	[hinst],eax
	invoke	DialogBoxParam,hinst,offset dialog,0,addr dlgproc,0
	invoke	ExitProcess,0


dlgproc	proc hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
	.if	uMsg==WM_INITDIALOG
		invoke	SetDlgItemText,hwnd,IDCNAME,addr name1
		call	getit
		invoke	SetDlgItemText,hwnd,IDCREG,addr regcode	
	.elseif	uMsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDCNAME                                 
			shr	eax,16
			.if	ax==EN_CHANGE
				invoke	GetDlgItemText,hwnd,IDCNAME,addr name1,20
				invoke	lstrlen,addr name1
				.if	eax==0
					invoke	SetDlgItemText,hwnd,IDCREG,addr err2
					invoke	SetDlgItemText,hwnd,IDCSTAT,addr err1
				.else					
					call	getit
					invoke	SetDlgItemText,hwnd,IDCREG,addr regcode	
					invoke	SetDlgItemText,hwnd,IDCSTAT,addr title1
				.endif
			.endif				
		.elseif	ax==IDABOUT
			invoke	DialogBoxParam,hinst,addr abtdlg,hwnd,addr abtdlgproc,0
		.elseif	ax==IDEXIT
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

abtdlgproc	proc hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
	.if	uMsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDOK1
			invoke	EndDialog,hwnd,0
		.endif
	.else
		mov	eax,FALSE
		ret
	.endif
	mov	eax,TRUE
	ret
abtdlgproc	endp				                                 

getit	proc uses ebx esi edi
	invoke	lstrlen,addr name1
	mov	edx,eax
	xor	ecx,ecx
	xor	edi,edi
	lea	eax,name1
	
	
here:
	cmp	ecx,edx
	jge	domaths
	movsx	ebx, byte ptr [eax+ecx]
	add	edi,ebx
	inc	ecx
	jmp	here
	
domaths:
	lea	edi,[edi+edi*2]
	call	hex2bcd
	ret
getit	endp
	
	
hex2bcd 	proc
	mov	eax,edi
	mov	esi,2	;point to 3rd character
	xor	bx,bx
loop5:			;main conversion
	mov	cx,10
	xor	edx,edx
	div	ecx
	push	dx
	inc	ebx        ;c
	cmp	eax,0
	jne	loop5
	
	xor	ax,ax
	
disp2:
	pop	dx
	dec	bx
	add	dl,30h
	mov	[regcode+si],dl
	inc	esi
	inc	cl
	cmp	bx,0
	jne	disp2
	mov	[regcode+si],0
	
	ret
hex2bcd	endp
end	start	