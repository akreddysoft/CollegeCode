;32BIT EXE                       
.386                             
.model	flat,stdcall             
option 	casemap:none             
.NOLIST
include	e:\masm32\include\windows.inc              
include	e:\masm32\include\kernel32.inc             
include e:\masm32\include\user32.inc               
include e:\masm32\include\masm32.inc
.LISTALL
includelib e:\masm32\lib\masm32.lib
includelib e:\masm32\lib\user32.lib            
includelib e:\masm32\lib\kernel32.lib          
.data                            
name1	db	'madhur',20 dup(0)
regcode	db	20 dup(0)                                 
.data?                           
hinst	HINSTANCE	?
.const
dialog	db	'DIALOG_1',0
abtdlg	db	'DIALOG_2',0
err1	db	'Check, something is missing',0
title1	db	'Winzip key generator by Madhur',0
err2	db	'enter name',0
IDCNAME	EQU	101
IDCREG	EQU	102
IDABOUT	EQU	1
IDEXIT	EQU	2
IDOK1	EQU	103                                 
IDCSTAT	EQU	10
dlgproc	proto hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
abtdlgproc proto hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
.code                            
start:                           
	invoke	GetModuleHandle,0
	mov	[hinst],eax
	invoke	DialogBoxParam,hinst,addr dialog,0,addr dlgproc,0
	invoke	ExitProcess,0
	
dlgproc	proc hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
;local	hicon:HWND
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
			invoke	EndDialog,hwnd,0
		.endif
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
		                                 
getit	proc	USES ebx esi edi
local	len:word
local	serial1[3]:byte
local	serial2[8]:byte
local	final:dword
	invoke	lstrlen,addr name1
	mov	len,ax
	xor	edx,edx
	xor	esi,esi
	lea 	edx,name1

loop_name:                              ; COD
                mov     al, [edx]       ; get
                test    al, al
                jz      short end_parse
                cmp     al, 20h
                jz      short skip_space
                xor     bl, al          ; xor

skip_space:                             ; COD
                inc     edx
                jmp     short loop_name


end_parse:
	                          ; CODE X
	  movzx   ecx, bl         ; get fi
	  mov     eax, ecx        ; save m
	  shr     eax, 2          ; shr th
	  and     eax, 0Fh        ; maths
	  add     eax, 46h
	  mov	  [serial1+esi],al
	  inc 	  esi  
	  
	  mov     edx, ecx
  	  and     edx, 0Fh
  	  add     edx, 4Bh
  	  mov     [serial1+esi],dl
  	  inc     esi

	  mov     edx, ecx
  	  shr     edx, 4
  	  add     edx, 41h
  	  mov     [serial1+esi],dl
  	  inc	  esi
getit endp
end	start	                 
