;WIN32 CONSOLE PROGRAM
;see the imports bug
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

main proto stdcall :dword, :dword
rva2offset PROto pFileMap:DWORD,RVA:DWORD 
printfunc proto 	map1:dword,lpitd:dword

.data
rdhwnd	dd	?
map	dd	?
fmap	dd	?
imagebase	dd	?
peoff	dd	?	
.data

.const

err1	db	"Error Opening File",0
err2	db	"Unable to Map file into memory",0
err3	db	"Memory Map error",0
err4	db	"The file is not a valid Portable Executable File",0
logo	db	"DumpIMPEXP - written by Madhur",10,13
	db	"Usage:	DLLDump <filename>",10,13,0
	
line1	db	"=============================================",10,13,0
	db	"Functions	Hint",10,13
	db	"=========	====",10,13,0
impstr	db	"%s\t%x",0


crlf	db	10,13,0
closfile	macro
	invoke 	UnmapViewOfFile,map 
	invoke	CloseHandle,fmap
	invoke	CloseHandle,rdhwnd
endm
.code
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
	.if	argc==1
		invoke	StdOut,offset logo
		ret
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
	
	mov	edi,map
	assume	edi:PTR IMAGE_DOS_HEADER
	add	edi,[edi].e_lfanew
	m2m	peoff,[edi].e_lfanew			
	assume	edi:ptr IMAGE_NT_HEADERS
	mov 	edi, [edi].OptionalHeader.DataDirectory[sizeof IMAGE_DATA_DIRECTORY].VirtualAddress 

	;push	edi	;save edi(pe header) for future
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл	
printdll:	
	invoke	rva2offset,map,edi
	add	eax,map
	mov	ecx,dword ptr [eax]
	test	ecx,ecx
	jz	done

	assume	eax:ptr IMAGE_IMPORT_DESCRIPTOR
	mov	esi,[eax].Name1		;get the name of dll
	invoke	rva2offset,map,esi
	add	eax,map
	call  	printinfo
   	
   	invoke	rva2offset,map,edi
	add	eax,map
	assume	eax:ptr IMAGE_IMPORT_DESCRIPTOR
	mov	esi,[eax].Characteristics	;esi contains offset ofIMAGE_THUNK_DATA
   	invoke	printfunc,map,esi	

	add	edi,sizeof IMAGE_IMPORT_DESCRIPTOR
	jmp	printdll

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл




done:
	
ret1:
	closfile
	
	ret
main endp

printinfo proc

	push	eax
	invoke	StdOut,offset crlf
	pop	eax
	invoke	StdOut,eax
   	invoke	StdOut,offset crlf
   	invoke	StdOut,offset line1
   	ret
printinfo endp
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
rva2offset endp 

printfunc proc uses esi eax ecx	map1:dword,lpitd:dword

	mov	esi,lpitd
print:
	invoke	rva2offset,map,esi
	add	eax,map			
	mov	ecx,dword ptr [eax]
	test	ecx,ecx
	jz	done
	
	invoke	rva2offset,map,ecx
	add	eax,map
	mov	ecx,eax
	
	assume	eax:ptr IMAGE_IMPORT_BY_NAME
	mov	cx,word ptr [eax]	;get hint in ecx
	movzx	ecx,cx
	add	eax,2
	invoke	printf,offset impstr,eax,ecx
	invoke	StdOut,offset crlf
	
	add	esi,sizeof IMAGE_THUNK_DATA
	jmp	print
done:
	ret
	
printfunc	endp

end start
