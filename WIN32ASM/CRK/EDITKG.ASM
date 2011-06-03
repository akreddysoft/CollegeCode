;EDITPLUS KEYGEN BY MADHUR
.386                             
.model	flat,stdcall             
option 	casemap:none             
.NOLIST
include	e:\masm32\include\windows.inc              
include	e:\masm32\include\kernel32.inc             
include e:\masm32\include\user32.inc               
;include e:\masm32\include\masm32.inc
.LISTALL
;includelib e:\masm32\lib\masm32.lib
includelib e:\masm32\lib\user32.lib            
includelib e:\masm32\lib\kernel32.lib          
.data                            
name1	db	'madhur',20 dup(0)
regcode	db	'madf',20 dup(0)                                 
magical_value	db	200h dup(0)
serial		db	'4545',10 dup(0)
calval		db	10 dup(0)
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
dw2hex proto :dword,:dword
.code                            
start:                           
	invoke	GetModuleHandle,0
	mov	[hinst],eax
	invoke	DialogBoxParam,hinst,addr dialog,0,addr dlgproc,0
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
					invoke	SetDlgItemText,hwnd,IDCREG,addr serial	
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
		                                 
getit	proc	
	call	cal1
	invoke	lstrlen,offset name1
	mov	esi,eax		
	mov	edi,offset name1
	
	push	esi		;push 	length	
	push	edi		;push	name
	push	0
	call	cal2		;get number
	
	add     esp, 0Ch
        and     eax, 0FFFFh
	mov	ebx,eax
	invoke	dw2hex,ebx,addr calval


	mov	al,calval		;get their first char
	mov	[serial+2],al		;move into out third

        mov     al, [calval+1]		;get	their second char
	mov	[serial+3],al		;move into our 4hth pos

        push    2
        push    offset [serial+2]			;push pointer to third char
        push    0        
       
       	call	cal2
       
        add     esp, 0Ch
   	and     eax, 0FFFFh

	mov	ebx,eax
	invoke	dw2hex,ebx,addr calval
	
	mov	al,[calval+1]
	mov	[serial+1],al   
	mov	dl,[calval]
	mov	[serial],dl        
        ret
getit	endp

;##########################################################

;##########################################################
cal1	proc
        xor     esi, esi
        mov     edx, offset magical_value

loc_0_46B617:
	mov	eax,0c0c1h
	mov	ecx,1
loc_0_46B621:
        test    esi, ecx
        jz      short loc_0_46B628
        xor     [edx], ax
      
loc_0_46B628:                                ; CODE XREF
        add     eax, eax
        shl     ecx, 1
        xor     eax, 4003h
        cmp     ecx, 100h
        jl      short loc_0_46B621
        add     edx, 2
        inc     esi
        cmp     edx, offset magical_value+200h
        jl      short loc_0_46B617
	ret
cal1	endp
;##########################################################

;##########################################################
cal2	proc

zero	equ	4
name2	equ	8
len	equ	0ch

        mov     ecx, [esp+name2]
        mov     eax, [esp+len]
        push    esi
        lea     esi, [ecx+eax]
        cmp     ecx, esi
        jnb     short loc_0_46B68A
        mov     eax, [esp+4+zero]
        push    ebx
loopcal:      
        mov     edx, eax
        xor     ebx, ebx
        mov     bl, [ecx]
        and     edx, 0FFh
        xor     edx, ebx
        xor     ebx, ebx
        mov     bl, ah
        mov     ax, word ptr [magical_value+edx*2]
        xor     ax, bx
        inc     ecx
        cmp     ecx, esi
        jb      short loopcal
        pop     ebx
        pop     esi
        retn

loc_0_46B68A:                           ; CODE XREF
        mov     ax, word ptr [esp+4+zero]
        pop     esi
        retn
cal2	endp  

dw2hex	proc    wd:dword,adr:dword
	push	eax
	push	ebx
	push	ecx
	push	edx
	push	esi
	push	edi

	xor	bx,bx
	xor	di,di
	mov	esi,adr
	mov	eax,wd
	mov	bl,10h
@@divide:
	xor	edx,edx
	div	bx
	push	edx
	inc	di
	cmp	ax,0
	jne	@@divide

@@store:
	pop	edx
	cmp	dx,9
	ja	@@char
	add	dx,30h
	jmp	@@cont
@@char:
	add	dx,37h
@@cont:
	mov	[esi],dl
	inc	si
	dec	di
	jnz	@@store

	pop	edi
	pop	esi
	pop	edx
	pop	ecx
	pop	ebx
	pop	eax
	ret
dw2hex	endp

end	start	                 
