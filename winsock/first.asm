;PE EXE
.386
.model	flat,stdcall
option 	casemap:none
.nolist
include	windows.inc
include	kernel32.inc
include user32.inc
include wsock32.inc
;include ..\macro.inc
.listall
includelib user32.lib
includelib kernel32.lib
includelib wsock32.lib
includelib ws2_32.lib

.data
wsadata	WSADATA	<0>
.data?
hinst	HINSTANCE	?
hsocket	SOCKET	?
sockaddr1   sockaddr_in     <?>
.const
ver	dd	0002h		;higher byte=minor,lower byte=majorA
err0	db	"not suitable winsock version",0
err1	db	"Cannot Create Socket",0
err2	db	"Cannot connect",0
app	db	"Socket",0
ipad	db	"127.0.0.1",0
.code
start:
;####################initialisation#############	
	invoke	WSAStartup,ver,addr wsadata
	.if	wsadata.wVersion<2
		invoke	MessageBox,0,offset err0,offset app,0
		jmp	exit
	.endif
	jne	exit
;##############################################

;####################creation of socket################	
	invoke	socket,AF_INET,SOCK_STREAM,IPPROTO_TCP
	.if	eax==INVALID_SOCKET
		invoke	MessageBox,0,offset err1,offset app,0
		jmp	exit
	.endif
	mov	hsocket,eax
;####################################################

;############set up struccture and connect##############	
	mov	sockaddr1.sin_family,AF_INET
	
	invoke  htons,80
	mov	sockaddr1.sin_port,ax
	
	invoke	inet_addr,offset  ipad			;convert to dotted address to in_addr
    	mov     sockaddr1.sin_addr.S_un.S_addr, eax
    	
	invoke	connect,hsocket,offset sockaddr1,sizeof sockaddr1
	.if	eax==SOCKET_ERROR
		invoke	MessageBox,0,offset err2,offset app,0
		jmp	exit1
	.endif
;#########################################################


exit1:
	invoke	closesocket,hsocket
exit:
	invoke	WSACleanup
	invoke	ExitProcess,0
end	start	