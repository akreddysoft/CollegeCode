;###################################################
;	Description:	File Header Program 	
;	Version:  	1.0             
; 	Author:		Madhur               
;	Start Date: 	03/08/03,14:47:10                     
;	Name:  		HEADER.ASM
;	Assembler:  	MASM 6.14.8444
;	Linker:  	Link.exe 5.12.8078
;###################################################
.386
.model	flat,stdcall
option 	casemap:none
.nolist
include	windows.inc
include	kernel32.inc
include user32.inc
include masm32.inc
.listall
includelib masm32.lib
includelib user32.lib
includelib kernel32.lib
;##########################################################
.data
prog	db	100 dup(0)
buff	db	20 dup(0)

zero		dd	115
first		dd	126
second		dd	122
third		dd	124	


OFFSETS struct		;structure containing offsets to various structures
dosmz	dd	0
dosstub	dd	0
pehead	dd	0
pesign	dd	0
ifh	dd	0
oh	dd	0
sect	dd	0
impt	dd	0
expt	dd	0
OFFSETS ENDS
offsets OFFSETS <0>

HEAD struct		;structure for dos mz header
sig	dw	0
lblksz	dw	0
sizefile dw	0
reloct	dw	0
sizhead	dw	0
cpara	dw	0
switch	dw	0
ofstak	dw	0
ofsp	dw	0
cheksum	dw	0
offst	dw	0
offcs	dw	0
offrel	dw	0
overlay	dw	0
HEAD	ends
head	HEAD	<0>

ifh	IMAGE_FILE_HEADER <0>
ioh	IMAGE_OPTIONAL_HEADER <>
ish	IMAGE_SECTION_HEADER <>

sections	dw		0
offpesig	dd		0
pesig		dd		0
;##########################################################
.data?
hinst	HINSTANCE	?
cmdline	dd		?
rdhwnd	dd		?
;##########################################################
.const
dlgproc		proto	hwnd:HWND,umsg:DWORD,wparam:WPARAM,lparam:LPARAM
dlgprocabt 	proto 	hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
hexit		proto	:dword,:dword,:dword
pedlgproc	proto	hwnd:HWND,umsg:DWORD,wparam:WPARAM,lparam:LPARAM
optdlgproc	proto	hwnd:HWND,umsg:DWORD,wparam:WPARAM,lparam:LPARAM
secdlgproc	proto 	hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
gendlgproc	proto 	hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
;##########################################################
msgtitle	db	'File Header',0
title1		db	' - File Header',0
dialog		db	'DIALOG',0,0
pedialog	db	'IDD_PEVIEW',0
optdialog	db	'IDD_OPTHEADER',0
secdialog	db	'IDD_SECTION',0
gendialog	db	'IDD_GENERAL',0
err1		db	'header.exe doesnt run directly,run installer to add it to right click menu',0
err2		db	'Fatal Error: Cannot Open File',0
abtdialog	db	'IDD_ABTDIALOG',0	
notap		db	'----',0
offifh		db	2,2,4,4,4,2,2		;offset to increment
offioh		db	2,1,1,4,4,4,4,4,4,4,4,4,2,2,2,2,2,2,4,4,4,4,2,2,4,4,4,4,4,4
offish		db	4,4,4,4,4,4,2,2,4
imagedata	db	"Export Symbols",0,6 dup(0)
		db	"Import Symbols",0,6 dup(0)
		db	"Resources",0,11 dup(0)
		db	"Exception",0,10 dup(0)
		db	"Security",0,11 dup(0)
		db	"Base Relocation",0,5 dup(0)
		db	"Debug",0,15 dup(0)
		db	"Copyright String",0,4 dup(0)
		db	"Unknown",0,12 dup(0)
		db	"Thread Local storage",0
		db	"Load Configuration",0,2 dup(0)
		db	"Bound Import",0,8 dup(0)
		db	"Import Address Table",0
		db	"Delay Import",0,8 dup(0)
		db	"COM Descriptor",0,6 dup(0)

;##########################################################
IDC_EDIT1	equ	115
IDC_ABOUT	equ	1
IDC_OK		EQU	102
IDC_STATUS	EQU	133
offlfanew	EQU	3ch	;offset where the offset of pe header signature is found
IDC_PEVIEW	EQU	2
IDC_DOSHEAD	EQU	111
IDC_SECTION	EQU	112
IDC_OPTION	EQU	113
IDC_IFH		EQU	125
IDC_NEXTSEC	EQU	106
FIRSTEDIT	EQU	115
LASTEDIT	EQU	FIRSTEDIT +9
IDC_IMAGEDATADIRECTORY EQU 106
;##########################################################
.code
start:
	invoke	GetModuleHandle,NULL
	mov	[hinst],eax
	invoke	GetCommandLine
	mov	cmdline,eax
	call	getprog
	.if	[prog+1]==0	
		invoke	MessageBox,0,addr err1,addr msgtitle,MB_ICONEXCLAMATION
		invoke	ExitProcess,0
	.endif
	
	invoke	_lopen,addr prog+1,OF_READ
	.if	eax==-1
		invoke	MessageBox,0,addr err2,addr msgtitle,MB_ICONSTOP
		invoke	ExitProcess,0
	.endif
	
	mov	rdhwnd,eax
	invoke	szCatStr,addr prog,addr title1
	invoke	DialogBoxParam,hinst,offset gendialog,0,addr gendlgproc,0
	invoke	_lclose,rdhwnd	
	invoke	ExitProcess,0
	
;##########################################################
;this dialog box displays dos mz header
;##########################################################	

dlgproc	proc uses esi edi ebx	hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
	.if	uMsg==WM_INITDIALOG
		invoke	_llseek,rdhwnd,offsets.dosmz,FILE_BEGIN
		invoke	_lread,rdhwnd,addr head,28
		
		invoke	SetWindowText,hwnd,offset prog
		xor	esi,esi
		mov	edi,IDC_EDIT1
		.while	edi!=129
			invoke	hexit,dword ptr [head+esi],addr buff,4
			invoke	SetDlgItemText,hwnd,edi,offset buff
			inc	esi
			inc	esi
			inc	edi
		.endw
		invoke	_llseek,rdhwnd,offsets.pesign,FILE_BEGIN
		invoke	_lread,rdhwnd,offset pesig,4
		invoke	dw2hex,offsets.pesign,offset buff
		
		.if	pesig==IMAGE_NT_SIGNATURE
			invoke	SetDlgItemText,hwnd,129,offset buff	;set address of pe header
			invoke	GetDlgItem,hwnd,IDC_PEVIEW
			invoke	EnableWindow,eax,TRUE
		.else
			invoke	SetDlgItemText,hwnd,129,offset notap	;file is not pe ,set blank
		.endif
		
	.elseif	uMsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDC_OK	
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
		
		.elseif	ax==IDC_ABOUT
			invoke	DialogBoxParam,hinst,addr abtdialog,hwnd,dlgprocabt,0
		.elseif	ax==IDC_PEVIEW
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
			invoke	DialogBoxParam,hinst,addr gendialog,hwnd,gendlgproc,0	;pass the handle so that disp it
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
;##########################################################

;##########################################################

pedlgproc	proc uses esi edi ebx	hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
	.if	uMsg==WM_INITDIALOG
		invoke	_llseek,rdhwnd,offlfanew,FILE_BEGIN
		invoke	_lread,rdhwnd,addr offpesig,4
		mov	eax,offpesig
		add	eax,4
		invoke	_llseek,rdhwnd,eax,FILE_BEGIN	;read the offset from last byte of signature
		invoke	_lread,rdhwnd,offset offset ifh,20	;ifh=20 bytes
		
		invoke	SetWindowText,hwnd,offset prog
		xor	esi,esi
		lea	esi,offifh
		xor	edx,edx
		mov	edi,115
		.while	edi!=122
			push	edx
			.if	edi>116 && edi<120
				invoke	hexit,dword ptr [ifh+edx],addr buff,8
			.else
				invoke	hexit,dword ptr [ifh+edx],addr buff,4
			.endif
			invoke	SetDlgItemText,hwnd,edi,offset buff
			pop	edx
			add	dl,byte ptr [esi]
			inc	esi
			inc	edi
		.endw
		
	.elseif	uMsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDC_OK	
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
		.elseif	ax==IDC_ABOUT
			invoke	DialogBoxParam,hinst,addr abtdialog,hwnd,dlgprocabt,0
		.elseif	ax==IDC_PEVIEW
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
			invoke	DialogBoxParam,hinst,offset gendialog,0,addr gendlgproc,0
		.endif			
	.elseif	uMsg==WM_CLOSE
		invoke	EndDialog,hwnd,0
	.else
		mov	eax,FALSE
		ret
	.endif
	mov	eax,TRUE
	ret												                   		              
pedlgproc	endp	

;##########################################################

;##########################################################
optdlgproc	proc uses esi edi ebx	hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
local	cbohwnd:HWND
	.if	uMsg==WM_INITDIALOG
		invoke	_llseek,rdhwnd,offsets.oh,FILE_BEGIN	
		invoke	_lread,rdhwnd,offset ioh,0e0h	
		
		invoke	GetDlgItem,hwnd,IDC_IMAGEDATADIRECTORY
		mov	cbohwnd,eax
		
		xor	ecx,ecx
		mov	edx,offset imagedata
		.while	ecx!=15
			push	edx
			push	ecx
			invoke	SendMessage,cbohwnd,CB_ADDSTRING,0,edx
			pop	ecx
			pop	edx
			add	edx,21
			inc	ecx
		.endw
		
		invoke	SetWindowText,hwnd,offset prog
		xor	esi,esi
		lea	esi,offioh
		xor	edx,edx
		mov	edi,115
		.while	edi!=145
			push	edx
			.if	edi>117 && edi<127 || edi>132 && edi<137 || edi>138
				invoke	hexit,dword ptr [ioh+edx],addr buff,8
			.elseif	edi==115 || edi>126 && edi<133 || edi>136 && edi<139 
				invoke	hexit,dword ptr [ioh+edx],addr buff,4
			.else
				invoke	hexit,dword ptr [ioh+edx],addr buff,2
			.endif
			invoke	SetDlgItemText,hwnd,edi,offset buff
			pop	edx
			add	dl,byte ptr [esi]
			inc	esi
			inc	edi
		.endw
		
	.elseif	uMsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDC_OK	
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
		.elseif	ax==IDC_ABOUT
			invoke	DialogBoxParam,hinst,addr abtdialog,hwnd,dlgprocabt,0
		.elseif	ax==IDC_PEVIEW
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
			invoke	DialogBoxParam,hinst,addr gendialog,hwnd,gendlgproc,0
		.endif			
	.elseif	uMsg==WM_CLOSE
		invoke	EndDialog,hwnd,0
	.else
		mov	eax,FALSE
		ret
	.endif
	mov	eax,TRUE
	ret												                   		              
optdlgproc	endp	
;##########################################################
;this is the first dialog shown if the file is really pe
;##########################################################
gendlgproc	proc uses esi edi ebx	hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
	.if	uMsg==WM_INITDIALOG
		invoke	SetWindowText,hwnd,offset prog
		invoke	_llseek,rdhwnd,offlfanew,FILE_BEGIN
		invoke	_lread,rdhwnd,addr offsets.pesign,4


;####################if the file is not pe############
		invoke	_llseek,rdhwnd,offsets.pesign,FILE_BEGIN
		invoke	_lread,rdhwnd,offset pesig,4
		.if	pesig!=IMAGE_NT_SIGNATURE
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
			invoke	DialogBoxParam,hinst,offset dialog,0,addr dlgproc,0
		.endif
;##########################################################	
;		set offsets in offset structure
;###########################################################

		mov	eax,offsets.pesign
		mov	offsets.pehead,eax
		add	eax,4			;size of pesign
		mov	offsets.ifh,eax		;store offset of if header
		add	eax,20			;size of if header
		mov	offsets.oh,eax		;store offset of io header
		add	eax,0e0h		;size of io header
		mov	offsets.sect,eax	;store off of section table

;###########################################################		
		;invoke	SetWindowText,hwnd,offset prog
		xor	edx,edx
		mov	edi,FIRSTEDIT
		.while	edi!=LASTEDIT
			push	edx
			invoke	hexit,dword ptr [offsets+edx],addr buff,8	;8 signifies digits to convert
			invoke	SetDlgItemText,hwnd,edi,offset buff
			pop	edx
			add	dl,4
			inc	edi
		.endw
		
	.elseif	uMsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDC_OK	
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
		.elseif	ax==IDC_ABOUT
			invoke	DialogBoxParam,hinst,addr abtdialog,hwnd,dlgprocabt,0
		.elseif	ax==IDC_DOSHEAD
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
			invoke	DialogBoxParam,hinst,offset dialog,0,addr dlgproc,0
		.elseif	ax==IDC_SECTION
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
			invoke	DialogBoxParam,hinst,offset secdialog,0,addr secdlgproc,0
		.elseif	ax==IDC_IFH
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
			invoke	DialogBoxParam,hinst,offset pedialog,0,addr pedlgproc,0
		.elseif	ax==IDC_OPTION
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
			invoke	DialogBoxParam,hinst,offset optdialog,0,addr optdlgproc,0
		.endif			
	
	.elseif	uMsg==WM_CLOSE
		invoke	EndDialog,hwnd,0
	.else
		mov	eax,FALSE
		ret
	.endif
	mov	eax,TRUE
	ret												                   		              
gendlgproc	endp	
;##########################################################

;##########################################################
secdlgproc	proc uses esi edi ebx	hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
	.if	uMsg==WM_INITDIALOG
		invoke	SetWindowText,hwnd,offset prog
		mov	eax,offsets.ifh
		add	eax,2
		invoke	_llseek,rdhwnd,eax,FILE_BEGIN
		invoke	_lread,rdhwnd,offset sections,2		;read no of sections
		
		invoke	_llseek,rdhwnd,offsets.sect,FILE_BEGIN
		mov	edi,116
		mov	zero,115
		mov	first,126
		mov	second,122
		mov	third,124
		
		.while	sections!=0
			invoke	_lread,rdhwnd,offset ish,28h	;ish=40bytes
			invoke	SetDlgItemText,hwnd,zero,offset ish
	
			lea	esi,offish
			xor	edx,edx	
			.while	edi!=first
				push	edx
				.if	edi<second || edi==third
					invoke	hexit,dword ptr [ish+edx+8],addr buff,8
				.else
					invoke	hexit,dword ptr [ish+edx+8],addr buff,4
				.endif
				invoke	SetDlgItemText,hwnd,edi,offset buff
				pop	edx
				add	dl,byte ptr [esi]
				inc	esi
				inc	edi
			.endw
			dec	sections
			add	zero,10
			add	first,10
			add	second,10
			add	third,10
		.endw
	
	.elseif	uMsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDC_OK	
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
		.elseif	ax==IDC_ABOUT
			invoke	DialogBoxParam,hinst,addr abtdialog,hwnd,dlgprocabt,0
		.elseif	ax==IDC_PEVIEW
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
			invoke	DialogBoxParam,hinst,offset gendialog,0,addr gendlgproc,0
		.endif			
	.elseif	uMsg==WM_CLOSE
		invoke	EndDialog,hwnd,0
	.else
		mov	eax,FALSE
		ret
	.endif
	mov	eax,TRUE
	ret												                   		              
secdlgproc	endp	
;##########################################################

;##########################################################
	
dlgprocabt proc hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
	.if uMsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDC_OK
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
;##########################################################

;##########################################################	
		
getprog	proc uses ebx esi edi
	xor	edi,edi
	mov	eax,cmdline
	.while	byte ptr [eax]!=20h
		.break .if edi==200h
		inc	eax
		inc	edi
	.endw
	
	xor	esi,esi
	xor	edi,edi
	.while	byte ptr [eax]!=0
		.break  .if edi==200h
		inc	edi
		mov	cl,byte ptr [eax]
		mov	[prog+esi],cl
		inc	esi
		inc	eax
	.endw
		
	ret
getprog	endp		
	
;##########################################################

;##########################################################
hexit	proc uses ebx esi edi num:dword,pntr:dword,count:dword
	mov	eax,num
	xor	bx,bx
	xor	edx,edx
	xor	ebx,ebx
	mov	bl,10h
	xor	esi,esi
	mov	ecx,pntr
	.while	esi!=count
		xor	edx,edx
		div	ebx
		inc	esi
		push	edx
	.endw	
	
	xor	edi,edi
	
	.while	esi!=0
		pop	edx
		dec	esi
		.if	dx>9
			add	dx,37h
		.else
			add	dx,30h
		.endif
;		mov	byte ptr [pntr+edi],dl	;imp this wont work, herre pntr is not treated as pointer
		mov	[ecx+edi],dl
		inc	edi
	.endw
	mov	byte ptr [ecx+edi],0
	ret	
hexit	endp	
end	start
;##########################################################