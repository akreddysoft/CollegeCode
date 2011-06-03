;PROGRAM TO DISPLAY THE IP ADDRESS OF HOST
.386
.model flat, stdcall

option casemap:none
.nolist
include windows.inc
include kernel32.inc
include user32.inc
include crtlib.inc
include masm32.inc
include wsock32.inc
.listall
includelib kernel32.lib
includelib user32.lib
includelib crtlib.lib
includelib masm32.lib
includelib wsock32.lib
printip	proto	nbo:dword,buff1:dword	;arg is in network byte order
printlist proto  array:dword
main proto stdcall :dword, :dword

.data
logo	db	10,13,"Host2IP - written by Madhur",10,13
	db	"No hostname specified...Displaying localhost information",10,13,10,13,0
buff	db	128 dup(0)
wsadata WSADATA <0>

.const
name1	db	"Name: ......",0
alias1	db	"Aliases: ...",0
typad	db	"Type: ......",0
len	db	"Length: ....",0
adlist	db	"IP Address: ",0


ver	dd	0002h		;higher byte=minor,lower byte=majorA
err0	db	"not suitable winsock version",0
app	db	"Winsock",0
res	db	"Could not resolve hostname",0
crlf	db	10,13,0
space	db	20h,0
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
local localhost[128]:byte

	;invoke	printlist,argv
	
	invoke	WSAStartup,ver,addr wsadata
	.if	wsadata.wVersion<2
		invoke	MessageBox,0,offset err0,offset app,0
		jmp	exit
	.endif
	
	mov	ecx,argv
	add	ecx,4
	mov	eax,[ecx]
	
	.if	argc==1
		invoke	StdOut,offset logo
		invoke	gethostname,addr localhost,128
	.endif

	invoke	gethostbyname,eax
	.if	eax==0
		invoke	StdOut,offset res
		ret
	.endif
	
	mov	edi,eax
	assume	edi:PTR hostent

	invoke	StdOut,offset name1
	invoke	StdOut,[edi].h_name
	invoke	StdOut,offset crlf
	
	invoke	StdOut,offset alias1
	invoke	printlist,[edi].h_alias
	invoke	StdOut,offset crlf
	
	
	invoke	StdOut,offset typad
	xor	ecx,ecx
	mov	cx,[edi].h_addr
	invoke	dw2hex,ecx,offset buff
	invoke	StdOut,offset buff
	invoke	StdOut,offset crlf

	invoke	StdOut,offset len
	xor	ecx,ecx
	mov	cx,[edi].h_len
	invoke	dw2hex,ecx,offset buff
	invoke	StdOut,offset buff
	invoke	StdOut,offset crlf
	
	invoke	StdOut,offset adlist
	mov	eax,[edi].h_list
	mov	eax,[eax]
	mov	eax,[eax]	;eax contains the ip
	invoke	inet_ntoa,eax
	invoke	StdOut,eax
	
	invoke	StdOut,offset crlf		
exit:
	invoke	WSACleanup
	ret
main endp


printlist proc uses esi edi array:dword
	mov	edi,array
	mov	esi,dword ptr [edi]
	.while	esi!=0
		invoke	StdOut,esi
		invoke	StdOut,offset crlf
		add	edi,4			;point to next address
		mov	esi, dword ptr [edi]		;get offset of string
	.endw
	ret
printlist	endp

end start
