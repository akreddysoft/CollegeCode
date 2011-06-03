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
local	serial1:word
local	serial2:word
local	final:dword
	invoke	lstrlen,addr name1
	mov	len,ax
	xor	edx,edx
	lea 	ecx,name1
	mov	dl,[ecx]
	xor	ebx,ebx
	xor 	eax,eax
	mov 	esi,ecx
	xor 	edi,edi
	xor	ecx,ecx
	mov	cx,len        ;get length of name in cx(number of loop)

loop1:
	movzx 	dx,dl
	imul 	edx,edi
	add	ebx,edx
	mov 	dl, byte ptr [esi+01]
	inc 	edi
	inc 	esi
	loop	loop1
	mov	serial1,bx

	lea	esi,name1
	mov	ch,byte ptr [esi]
	mov	dx,len
loop2:
	cmp	ch,0           ;test for end of string i.e. enter char,13
	je	go	
	call	blah
	mov	ch,byte ptr [esi+1]
	inc	esi
	inc	edi
	jmp	loop2

go:
	add	eax,63h
	mov	serial2,ax

	mov	word ptr final+2,ax
	mov	ax,serial1
	mov	word ptr final,ax

	invoke	dw2hex,final,addr regcode
	ret
getit	endp

blah	proc
	mov	edx,8h
next5:
	mov	ebx,ecx
	xor	ebx,eax
	test	bx,8000h
	je	next3
	add	eax,eax
	xor	eax,00001021h
	jmp	next4
next3:
	shl	eax,1
next4:
	shl	ecx,1
	dec	edx
	jne	next5
	ret
blah	endp
end	start	                 
