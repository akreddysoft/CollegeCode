;###################################################
;	Description:	VA to Offset 	
;	Version:  	1.0             
; 	Author:		Madhur              
;	Start Date: 	05/10/03,01:24:27                     
;	Name:  		
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
include comdlg32.inc
.listall
includelib comdlg32.lib
includelib masm32.lib
includelib user32.lib
includelib kernel32.lib
;##########################################################
.data?
hinst	HINSTANCE	?
memadd	dd	?
offhex	dd	?
offdec	dd	?
rdhwnd	dd	?
file	db	50 dup(?)
buffer	db	50 dup(?)
fmap	dd	?
map	dd	?
ofn	OPENFILENAME <?>
msg	MSGBOXPARAMS <?>
fopen	db	?	;flag whether file is opened
iconh	dd	?
;##########################################################
.const
filter	db	"Executable Files",0,"*.exe",0
	db	"Dynamic Link Libraries",0,"*.dll",0,0
caption	db	"VA2Offset",0
title1	db	"VA2offset Utility v 1.0",10,13
	db	"Coded By Madhur in win32asm",13,10,13,10
	db	"Homepage: www.geocities.com/madhur_ahuja",13,10
	db	"Report Any bugs to : madhur_ahuja@yahoo.com",13,10
	db	"Release: 6th Oct 03",0
cap	db	"VA to Offset Utility",0
icon	db	"IDI_ICON2",0
icon1	db	"IDI_WINLOGO",0
dialog	db	'IDD_VIRTUAL',0
err1	db	"Error Opening File",0
err2	db	"Unable to Map file into memory",0
err3	db	"Memory Map error",0
err4	db	"The file is not a valid Portable Executable File",0
err5	db	"The specified memory address is not a valid address",0
err6	db	"The specified address was not found in the file",13,10
	db	"Most likely,it falls in the section gaps",0
null	db	"0",0
;##########################################################
dlgproc	proto  	hwnd:HWND,umsg:DWORD,wparam:WPARAM,lparam:LPARAM
hexit	proto   num:dword,pntr:dword,flag:dword
rva2offset proto :dword,:dword
;##########################################################
closfile	macro
	invoke 	UnmapViewOfFile,map 
	invoke	CloseHandle,fmap
	invoke	CloseHandle,rdhwnd
	invoke	SetDlgItemText,hwnd,IDC_FILE,0
endm

offlfanew	EQU	3ch	;offset where the offset of pe header signature is found
IDOPEN		EQU	1
IDC_ABOUT	equ	109
IDC_EXIT	equ	2
IDC_MEMADD	equ	600
IDC_OFFDEC	equ	108
IDC_OFFHEX	equ	103
IDC_CVA		equ	114
IDC_CRVA	equ	113
IDC_GET		EQU	500
IDC_FILE	EQU	101
;##########################################################
.code
start:
	invoke	GetModuleHandle,NULL
	mov	[hinst],eax
	invoke	DialogBoxParam,hinst,addr dialog,0,addr dlgproc,0
	invoke	ExitProcess,0

;##########################################################
dlgproc	proc	hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
local rawoff:dword
local imagebase:dword
local virtoff:dword
local sizeofimage:dword
local noofsec:dword
local rawsize:dword
local offsec:dword
local pehead:dword

	.if	uMsg==WM_INITDIALOG
		invoke	LoadIcon,hinst,offset icon
		mov	iconh,eax
		invoke	SendMessage,hwnd,WM_SETICON,ICON_SMALL,iconh
		
		invoke	CheckDlgButton,hwnd,IDC_CVA,BST_CHECKED
		mov	ofn.lStructSize,sizeof ofn
		push	hwnd
		pop	ofn.hwndOwner
		push	[hinst]
		pop	ofn.hInstance
		mov	ofn.lpstrFilter,offset filter
		mov	ofn.Flags,OFN_EXPLORER or OFN_FILEMUSTEXIST or OFN_HIDEREADONLY or OFN_PATHMUSTEXIST
		mov  	ofn.lpstrFile, OFFSET file
        	mov 	ofn.nMaxFile,255
        	
        	mov	msg.cbSize,sizeof msg
        	push	hwnd
        	pop	msg.hwndOwner
        	push	hinst
        	pop	msg.hInstance
        	mov	msg.lpszText,offset title1
        	mov	msg.lpszCaption,offset cap
        	mov	msg.dwStyle,MB_USERICON
        	mov	msg.lpszIcon ,offset icon
        	
	.elseif	uMsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDOPEN
			invoke	GetOpenFileName,offset ofn
			.if	eax==TRUE
				.if	fopen==1
					closfile
					mov	fopen,0
				.endif
				invoke	CreateFile,offset file,GENERIC_READ,FILE_SHARE_READ,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
				.if	eax==INVALID_HANDLE_VALUE
					invoke	MessageBox,hwnd,offset err1,offset caption,MB_ICONSTOP
				.else
					mov	rdhwnd,eax
					
					invoke	CreateFileMapping,rdhwnd,0,PAGE_READONLY,0,0,0
					.if	eax==0
						closfile
						invoke	MessageBox,hwnd,offset err2,offset caption,MB_ICONSTOP
					.else
						mov	fmap,eax
						invoke	MapViewOfFile,fmap,FILE_MAP_READ,0,0,0
						.if	eax==0
							invoke	MessageBox,hwnd,offset err2,offset caption,MB_ICONSTOP
							closfile
						.else
							mov	map,eax
							
							mov	edi,map
							assume edi:ptr IMAGE_DOS_HEADER 
					               .if [edi].e_magic==IMAGE_DOS_SIGNATURE 
                  						xor	eax,eax
                  						mov	ax,word ptr [edi].e_lfanew
                  						add 	edi,eax
                  						assume edi:ptr IMAGE_NT_HEADERS 
                  						.if [edi].Signature==IMAGE_NT_SIGNATURE 
                     							;mov ValidPE, TRUE 
                     							mov	fopen,1
                  							invoke	SetDlgItemText,hwnd,IDC_FILE,offset file
                  						.else 
                     							invoke	MessageBox,hwnd,offset err4,offset caption,MB_ICONSTOP
                     							;mov ValidPE, FALSE 
                  							closfile
                  						.endif 
               						.else 
                  						invoke	MessageBox,hwnd,offset err4,offset caption,MB_ICONSTOP
                  						;mov ValidPE,FALSE 
                  						closfile
               						.endif 
	
						
						
						.endif
					.endif
				.endif
			.endif	
		
		.elseif	ax==IDC_MEMADD
			mov	eax,wparam
			shr	eax,16
			.if	ax==EN_CHANGE
				invoke	GetDlgItemText,hwnd,IDC_MEMADD,offset buffer,10
				invoke	lstrlen,offset buffer
				.if	eax!=0 && fopen==1
					invoke	GetDlgItem,hwnd,IDC_GET
					invoke	EnableWindow,eax,1
				.else
					invoke	GetDlgItem,hwnd,IDC_GET
					invoke	EnableWindow,eax,0
				.endif
			.endif
				
					
		.elseif	ax==IDC_GET
			
			invoke	GetDlgItemText,hwnd,IDC_MEMADD,offset buffer,8	
			invoke	htodw,offset buffer
			mov	memadd,eax

			mov	edi,map
			assume 	edi:ptr IMAGE_DOS_HEADER 
			add 	edi, [edi].e_lfanew 	;edi points to image_nt_headers
			mov	pehead,edi
			add	edi,4
			assume	edi:ptr IMAGE_FILE_HEADER
			xor	eax,eax
			mov	ax,word ptr [edi].NumberOfSections
			push	eax
			pop	noofsec
			
			add	edi,20	;point to optional header
			
			assume  edi:ptr IMAGE_OPTIONAL_HEADER
			push	[edi].ImageBase
			pop	imagebase
			push	[edi].SizeOfImage
			pop	sizeofimage
			
			invoke	IsDlgButtonChecked,hwnd,IDC_CRVA
			.if	eax==1
				mov	eax,imagebase	;the specified add is relative address,make it va
				add	memadd,eax
			.endif
	
			mov	eax,memadd
			mov	ecx,sizeofimage
			add	ecx,imagebase
			.if	eax<imagebase || eax>=ecx
				invoke	MessageBox,hwnd,addr err5,offset caption,MB_OK or MB_ICONSTOP
				ret
			.endif
			
			add	edi,0e0h	;point to section table
			mov	offsec,edi	;save offset to section table for future
			mov	ecx,noofsec
;##########################################################
			
			
			.while	ecx!=0
				assume	edi:ptr IMAGE_SECTION_HEADER
				push	[edi].PointerToRawData
				pop	rawoff
				push	[edi].VirtualAddress
				pop	virtoff
				push	[edi].SizeOfRawData
				pop	rawsize
				
				mov	edx,memadd
				sub	edx,imagebase
				.if	edx>=virtoff
					mov	eax,virtoff
					add	eax,rawsize
					.if	edx<=eax			;va<virtoff+rawsize
						sub	edx,virtoff
						add	edx,rawoff
						jmp	@@done
					.endif
				.endif
				
				dec	ecx
				add	edi,28h
			.endw
;if the specified address is not present in section table then search the headers for the address
			mov	edi,edx
			mov	eax,noofsec
			mov	ecx,28h
			mul	ecx
			add	eax,offsec
			sub	eax,map
			xor	edx,edx
			mov	esi,pehead
			mov	ecx,[esi+3ch]
			div	ecx
			or	edx,edx
			jz	remzero
			inc	eax
						

remzero:		xor	edx,edx
			mov	ecx,[esi+3ch]
			mul	ecx
			.if	edi>=eax
				invoke	MessageBox,hwnd,addr err6,offset caption,MB_OK or MB_ICONEXCLAMATION
				jmp	return
			.endif
			

@@done:			
			push	edx
			pop	offhex
			.if	offhex==0
				invoke	SetDlgItemText,hwnd,IDC_OFFHEX,offset null
				invoke	SetDlgItemText,hwnd,IDC_OFFDEC,offset null
			.else
				invoke	hexit,offhex,offset buffer,1
				invoke	SetDlgItemText,hwnd,IDC_OFFHEX,offset buffer
			
				invoke	hexit,offhex,offset buffer,0
				invoke	SetDlgItemText,hwnd,IDC_OFFDEC,offset buffer
			.endif

		.elseif	ax==IDC_EXIT
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
		.elseif	ax==IDC_ABOUT
			invoke	MessageBoxIndirect,offset msg
		.endif
	
	.elseif	uMsg==WM_CLOSE
		.if	fopen==1
			closfile
		.endif
		invoke	EndDialog,hwnd,0
	.else
		mov	eax,FALSE
		ret
	.endif
return:
	mov	eax,TRUE
	ret												                   		              
dlgproc	endp



rva2offset PROC uses edi esi edx ecx pFileMap:DWORD,RVA:DWORD 
   	mov 	esi,pFileMap 
   	assume 	esi:ptr IMAGE_DOS_HEADER 
   	add 	esi,[esi].e_lfanew 
   	assume 	esi:ptr IMAGE_NT_HEADERS 
   	mov 	edi,RVA ; edi == RVA 
   	mov 	edx,esi 
   	add 	edx,sizeof IMAGE_NT_HEADERS 
   	mov 	cx,[esi].FileHeader.NumberOfSections 
   	movzx 	ecx,cx 
   	assume 	edx:ptr IMAGE_SECTION_HEADER 
   	.while 	ecx>0 ; check all sections 
     		.if 	edi>=[edx].VirtualAddress 
       			mov 	eax,[edx].VirtualAddress 
       			add 	eax,[edx].SizeOfRawData 
       			.if 	edi<eax ; The address is in this section 
         			mov 	eax,[edx].VirtualAddress 
         			sub 	edi,eax
         			mov 	eax,[edx].PointerToRawData 
         			add 	eax,edi ; eax == file offset 
         			ret 
       			.endif 
     		.endif 
     		add	 edx,sizeof IMAGE_SECTION_HEADER 
     		dec 	ecx 
   	.endw 
   	assume 	edx:nothing 
   	assume 	esi:nothing 
   	mov 	eax,edi 
   	ret 
RVAToOffset endp 








hexit	proc uses ebx esi edi num:dword,pntr:dword,flag:dword
	mov	eax,num
	xor	bx,bx
	xor	edx,edx
	xor	ebx,ebx
	.if	flag==1
		mov	bl,10h
	.else
		mov	bl,10
	.endif
	xor	esi,esi
	mov	ecx,pntr
	.while	eax!=0
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
	
end	start	