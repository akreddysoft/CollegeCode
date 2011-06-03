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
includelib masm32.lib
includelib crtlib.lib
includelib wsock32.lib
gethostip	proto server:dword
printip proto :dword,:dword
main proto stdcall :dword, :dword
.data
wsadata	WSADATA	<0>
sockad	sockaddr_in <0>
buff	db	128 dup(0)

req1	db	"HEAD / HTTP/1.1",10,13
	db	"Host: "		;no newline,since hostname is to be send
len1	equ	$-offset req1


req2	db	"User-agent: HeadReqSample",10,13
	db	"Connection: close",10,13
	db	10,13
len2	equ	$-offset req2
.data?
socket1	dd	?


.const
ver	dd	0002h		;higher byte=minor,lower byte=majorA
err0	db	"Not suitable winsock version",0
logo	db	"Head Request - written by Madhur",10,13
	db	"Usage: hreq [hostname]",0
res	db	"Could not resolve host name",0
err1	db	"Error in creating socket",0
err2	db	"Connection to %s failed",10,13,0
err3	db	"Error in sending data",0
conn	db	"Connecting to %s %s...",10,13,0
dump    db  	"Dumping received data...",10,13,10,13,0
err4	db	"Error in receiving data",10,13,0
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
local	ipad:dword
local  	server:dword

	.if	argc==1
		invoke	StdOut,offset logo
		ret
	.endif
	
	invoke	WSAStartup,ver,addr wsadata
	.if	wsadata.wVersion<2
		invoke	StdOut,offset err0
		jmp	exit
	.endif
	
	mov	ecx,argv
	add	ecx,4
	mov	eax,[ecx]
	mov	server,eax
	
	invoke	gethostip,server
	.if	eax==0
		invoke	StdOut,offset res
		jmp	exit
	.endif
	mov	ipad,eax
	
	mov	cx,80
	xchg	ch,cl
    
    	mov     sockad.sin_family, AF_INET  
    	mov     sockad.sin_port, cx
    	mov     sockad.sin_addr.S_un.S_addr,eax

	invoke	socket,AF_INET,SOCK_STREAM, IPPROTO_TCP
	.if	eax==INVALID_SOCKET
		invoke	StdOut,offset err1
		jmp	exit
	.endif
	mov	socket1,eax
	
	invoke	printip,ipad,offset buff
	mov	eax,offset buff
	invoke	printf,offset conn,server,offset buff

	invoke	connect,socket1,offset sockad,sizeof sockad
	.if	eax==SOCKET_ERROR
		invoke	printf,offset err2,server
		jmp	exit
	.endif
	
	invoke	send,socket1,offset req1,len1,0
	.if	eax==SOCKET_ERROR
		invoke	StdOut,offset err3
		jmp	exit
	.endif
	
	invoke	lstrlen,server
	mov	ecx,server
	invoke	send,socket1,ecx,eax,0
	.if	eax==SOCKET_ERROR
		invoke	StdOut,offset err3
		jmp	exit
	.endif
	
	invoke	send,socket1,offset req2,len2,0
	.if	eax==SOCKET_ERROR
		invoke	StdOut,offset err3
		jmp	exit
	.endif
	invoke	StdOut,offset dump
	
	invoke	recv,socket1,offset buff,127,0
	test	eax,eax
	jz	done
	.if	eax==SOCKET_ERROR
		invoke	StdOut,offset err4
		jmp	exit
	.endif
	mov	[buff+eax],0
	invoke	StdOut,offset buff

done:
	
	invoke	closesocket,socket1
exit:
	invoke	WSACleanup
	ret
main endp


;лллллgethostipллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;input:  servername(www.df.com)
;output: ip address in nbo
;use printip to get the string of ip
;returns 0 if unsuccessful
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
gethostip	proc server:dword
	invoke	gethostbyname,eax
	test	eax,eax
	jz	ret1
	
	mov	edi,eax
	assume	edi:PTR hostent

	mov	eax,[edi].h_list
	mov	eax,[eax]
	mov	eax,[eax]	;eax contains the ip
ret1:
	ret
gethostip	endp
	
;лллллprintipлллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;input:ip address in nbo,offset of string
;output: ip address string in buff
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
printip	proc	nbo:dword,buff1:dword	;arg is in network byte order
	mov	ecx,nbo
	mov	edi,buff1
	
	mov	ebx,10
	xor	esi,esi
	
	.while	ecx!=0
		mov	eax,ecx
		and	eax,000000ffh
		.while	eax!=0
			xor	edx,edx
			div	ebx
			push	edx
			inc	esi
		.endw
		
		.while	esi!=0
			pop	edx
			.if	dl>9
				add	dl,37h
			.else
				add	dl,30h
			.endif
			mov	[edi],dl
			dec	esi
			inc	edi
		.endw
		mov	byte ptr [edi],"."
		inc	edi
		shr	ecx,8
	.endw
 	dec	edi
	mov	byte ptr [edi],0
	ret			
printip	endp
end start
