;WIN32 CONSOLE PROGRAM
.386
.model flat, stdcall

option casemap:none
.nolist
include windows.inc
include kernel32.inc
include user32.inc
include crtlib.inc
include masm32.inc
include ..\macro.inc
.listall
includelib kernel32.lib
includelib user32.lib
includelib crtlib.lib
includelib masm32.lib
hexit	proto  num:dword,pntr:dword,count:dword
printbyte proto base:dword, loc1:dword,loc2:dword

main proto stdcall :dword, :dword
.data
space	db	20h,0
crlf	db	10,13,0
len	equ	32
;header	IMAGE_NT_HEADER  <0>
.data?
buffer	db	50 dup(?)
fmap	dd	?
map	dd	?
fopen	db	?	;flag whether file is opened
rdhwnd	dd	?
closfile	macro
	invoke 	UnmapViewOfFile,map 
	invoke	CloseHandle,fmap
	invoke	CloseHandle,rdhwnd
endm
.const
logo	db	"PE Mapper - written by Madhur",10,13
	db	"Usage: pemap [filename]",0
	
err1	db	"Error Opening File",0
err2	db	"Unable to Map file into memory",0
err3	db	"Memory Map error",0
err4	db	"The file is not a valid Portable Executable File",0
err5	db	"The specified memory address is not a valid address",0
err6	db	"The specified address was not found in the file",13,10
	db	"Most likely,it falls in the section gaps",0
null	db	"0",0
printhex proto num:dword
.code
;   startup code
start:
    sub     esp, 12
    lea     eax, [esp+0]    ; &env
    lea     ecx, [esp+4]    ; &argc
    lea     edx, [esp+8]    ; &argv
    invoke  getmainargs, ecx, edx, eax, 0	;this call will put the env,argc,argv on stack,doesnt removes argument
    add     esp, 4          ; remove env (not used)
    call    main
    invoke  ExitProcess, eax

main proc argc:dword, argv:dword
local file:dword	
local imagebase:dword
local peoff:dword


;check whether structure of program is good	
	mov	eax,argc
	.if	eax==1
		invoke	StdOut,offset logo
		invoke	ExitProcess,0
	.endif
	mov	ecx,argv	;mov ecx,argv+4 won't work , discover why
	add	ecx,4
	
	invoke	CreateFile,[ecx],GENERIC_READ,FILE_SHARE_READ,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
	.if	eax==INVALID_HANDLE_VALUE
		invoke	StdOut,offset err1
		ret
	.endif
	mov	rdhwnd,eax
	invoke	CreateFileMapping,rdhwnd,0,PAGE_READONLY,0,0,0
	.if	eax==0
		invoke	StdOut,offset err2
		jmp	ret1
	.endif
	mov	fmap,eax
	invoke	MapViewOfFile,fmap,FILE_MAP_READ,0,0,0
	.if	eax==0
		invoke	StdOut,offset err2
		jmp	ret1
	.endif
					
	mov	map,eax
	mov	edi,map
	assume edi:ptr IMAGE_DOS_HEADER 
       .if [edi].e_magic==IMAGE_DOS_SIGNATURE 
       		xor	eax,eax
                mov	ax,word ptr [edi].e_lfanew
                add 	edi,eax
                assume edi:ptr IMAGE_NT_HEADERS 
                .if [edi].Signature==IMAGE_NT_SIGNATURE 
                .else 
                	invoke	StdOut,offset err4
                 	closfile
                .endif 
         .else 
         	invoke	StdOut,offset err4
         	closfile
         .endif 
	
	mov	ecx,map
	assume	ecx:PTR IMAGE_DOS_HEADER
	add	ecx,[ecx].e_lfanew
	m2m	peoff,[ecx].e_lfanew			
	assume	ecx:PTR IMAGE_NT_HEADERS
	m2m	imagebase,[ecx].OptionalHeader.ImageBase
	;invoke	printhex,imagebase
	
	mov	ecx,map
	add	ecx,400h
	mov	edx,ecx
	add	edx,400h
	invoke	printbyte,imagebase,ecx,edx

ret1:
	closfile
	ret
main endp


printhex proc uses eax ebx ecx edx esi edi num:dword
local buff[10]:byte
	invoke	dw2hex,num,addr buff
	invoke 	StdOut,addr buff
	ret
printhex endp


printbyte proc uses eax ebx ecx edx esi edi base:dword, loc1:dword,loc2:dword
local buff[10]:byte
	add	loc2,len
	mov	esi,loc1
	mov	ebx,base
	.while	esi!=loc2
		invoke	printhex,ebx
		invoke	StdOut,offset space
		xor	edi,edi
		xor	edx,edx
		.while	esi!=loc2 && edi!=len
			mov	dl,byte ptr [esi]
			invoke	hexit,edx,addr buff,2
			invoke	StdOut,addr buff
			invoke	StdOut,offset space
			inc	esi
			inc	edi
		.endw
		add	ebx,len
		invoke	StdOut,offset crlf
	.endw		
	ret
printbyte endp	
	

;##########################################################
hexit	proc uses eax ebx esi edi ecx num:dword,pntr:dword,count:dword
	mov	eax,num
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

