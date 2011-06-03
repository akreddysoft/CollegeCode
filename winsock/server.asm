;WIN32 CONSOLE PROGRAM
;31-12-03 1:35AM
.586
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
main proto stdcall :dword, :dword
rot13 proto pBuffer:dword, len:dword
.data
buff	db	128 dup(0)
.data?
socket1	dd	?
clientsocket	dd	?
wsadata	WSADATA <?>
sockad	sockaddr_in<?>
clientsockad sockaddr_in<?>
.const
ver	dd	0002h		;higher byte=minor,lower byte=majorA
err0	db	"Not suitable winsock version",0
err1	db	"Error in creating socket",0
err3	db	"Error in sending data",0
conn	db	"Incoming connection accepted from %s",10,13
	db	"Dumping received data...",10,13,10,13,0
err5	db	"Cannot bind the socket",0
err6	db	"Listen error",0
waitmsg	db	"A simple server - written by Madhur",10,13,10,13
	db	"Waiting for client to connect on port %d [Press ^C to abort]",10,13,0
err7	db	"Unable to accept incoming connection",0
err8	db	"Unable to receive data",0
term	db	"Connection successfully terminated",0
dump	db	"Dumping received data...",10,13,10,13
err9	db	"Socket cleanup error",0
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
local	clientsocksize:dword
local	port:word
	invoke	WSAStartup,ver,addr wsadata
	.if	wsadata.wVersion<2
		invoke	StdOut,offset err0
		jmp	exit
	.endif
	
	mov	cx,4444
	xchg	ch,cl

        .if	argc==2
	        mov     ecx, [argv]     ; get argument vector
        	mov     eax, [ecx][1*4] ; get first argument
            	invoke  atoi, eax       ; convert string into an int
            	mov	ecx,eax
        	xchg	ch,cl
        .endif
        
        mov	port,cx
    	
    	mov     sockad.sin_family, AF_INET  
    	mov     sockad.sin_port, cx
    	mov     sockad.sin_addr.S_un.S_addr,INADDR_ANY

	invoke	socket,AF_INET,SOCK_STREAM, IPPROTO_TCP
	.if	eax==INVALID_SOCKET
		invoke	StdOut,offset err1
		jmp	exit
	.endif
	mov	socket1,eax
	
	invoke	bind,socket1,offset sockad,sizeof sockad
	.if	eax!=0
		invoke	StdOut,offset err5
		jmp	exit
	.endif
	
	invoke	listen,socket1,SOMAXCONN
	.if	eax==SOCKET_ERROR
		invoke	StdOut,offset err6
		jmp	done
	.endif
	
	xor	ecx,ecx
	mov	cx,port
	xchg	ch,cl
	invoke	printf,offset waitmsg,ecx
	
	mov	clientsocksize,sizeof clientsockad
	invoke	accept,socket1,offset clientsockad,addr clientsocksize

	.if	eax==INVALID_SOCKET
		invoke	StdOut,offset err7
		jmp	done
	.endif
	mov	clientsocket,eax
	
	invoke	inet_ntoa,clientsockad.sin_addr.S_un.S_addr
	invoke	printf,offset conn,eax
 read:
	invoke	recv,clientsocket,offset buff,sizeof buff,0
	test	eax,eax
	jz	done1
	
	mov	[buff+eax],0
	invoke	StdOut,offset buff
	mov	ebx,eax
	.if	eax==SOCKET_ERROR
		invoke	StdOut,offset err8
		jmp	done
	.endif
	invoke	rot13,offset buff,eax
	invoke	send,clientsocket,offset buff,ebx,0
	jmp	read


done1:
	invoke	StdOut,offset term
	
done:
	invoke	closesocket,clientsocket
	.if	eax==SOCKET_ERROR
		invoke	StdOut,offset err9
	.endif
		
	invoke	closesocket,socket1	;if this is reached,connection brokes
	.if	eax==SOCKET_ERROR
		invoke	StdOut,offset err9
	.endif
exit:
	invoke	WSACleanup
	ret
main endp



rot13 proc uses eax pBuffer:dword, len:dword
    push esi
    mov  esi, [pBuffer]
    mov  ecx, [len]
    test ecx, ecx
    jz   _done

    align 16
_char:
    movzx eax, byte ptr [esi]
    cmp   eax, 'A'
    jb    _next
    cmp   eax, 'N'
    jb    _p13
    cmp   eax, 'Z'
    jbe   _m13

    cmp   eax, 'a'
    jb    _next
    cmp   eax, 'n'
    jb    _p13
    cmp   eax, 'z'
    ja    _next
_m13:
    sub   eax, 13
    jmp   _write
_p13:
    add   eax, 13 
_write:
    mov   [esi], al
_next:
    inc esi
    dec ecx
    jnz _char
_done:
    pop  esi
ret
rot13 endp

end start
