;###################################################
;	Description:	Transparent Icon
;	Version:  	1.0             
; 	Author:		Madhur           
;	Start Date: 	17/12/03,09:02:03                     
;	Name:  		trans.asm 
;	Assembler:  	MASM 6.14.8444
;	Linker:  	Link.exe 5.12.8078
;###################################################
;user specifies color in form of 00rrggbb
.386
.model	flat,stdcall
option 	casemap:none
.nolist
include	windows.inc
include	kernel32.inc
include user32.inc
include gdi32.inc
include masm32.inc
include ..\macro.inc
.listall
includelib gdi32.lib
includelib user32.lib
includelib kernel32.lib
includelib masm32.lib
tproc	proto hwnd11:HWND,D:UINT,S:UINT,H:DWORD
.data?
rgb	dd	?
event	dd	?
listhwnd	dd	?
;hwnd		dd	?
;hwnd1		dd	?
color		dd	?
msg	MSG	<?>
pnt		dd	?
buff		db	9 dup(?)
.const
running		db	"Program Already Running",10,13
		db	"Close Already Running",0
eventn		db	"event1",0
logo		db	"TransIcon",0
progclass	db	"Progman",0
progcap		db	"Program Manager",0
shellclass	db	"SHELLDLL_DefView",0
listclass	db	"SysListView32",0
.code
start:

	invoke	CreateEvent,0,0,0,offset eventn		;if event already exists it will be opened
	mov	event,eax		
	invoke	GetLastError				
	.if	eax==0b7h					
		invoke	MessageBox,0,offset running,offset logo,MB_ICONQUESTION or MB_YESNO
		.if	eax==IDYES
			invoke	SetEvent,event		;send the signal to other process to terminate itself
		.endif
		invoke	ExitProcess,0
	
	.endif
	
	invoke  GetCL, 1, offset buff
	mov	eax,offset buff
	invoke	htodw,eax
	mov	ecx,eax
	mov	edx,ecx
	shr	edx,16
	RGB	dl,ch,cl
	mov	color,eax
	
	invoke	FindWindow,offset progclass,offset progcap
	;mov	hwnd,eax
	invoke	FindWindowEx,eax,0,offset shellclass,0
	;mov	hwnd1,eax
	invoke	FindWindowEx,eax,0,offset listclass,0
	mov	listhwnd,eax
	
	invoke	SetTimer,0,0,1000,offset tproc
	
	.while	1
		invoke	GetMessage,offset msg,0,0,0
		invoke	DispatchMessage,offset msg
		invoke	WaitForSingleObject,event,0
		.if	eax==WAIT_OBJECT_0		;the other process has signalled, exit now
				invoke	InvalidateRect,listhwnd,0,1
				invoke	ExitProcess,0
		.endif
	.endw
	
tproc	proc hwnd11:HWND,D:UINT,S:UINT,H:DWORD
	invoke	SendMessage,listhwnd,LVM_GETTEXTCOLOR ,0,0
	.if	eax!=color
		invoke	SendMessage,listhwnd,LVM_SETTEXTCOLOR ,0,color
		invoke	InvalidateRect,listhwnd,0,1
	.endif
	invoke	SendMessage,listhwnd,LVM_GETTEXTBKCOLOR ,0,0
	.if	eax!=0ffffffffh
		invoke	SendMessage,listhwnd,LVM_SETTEXTBKCOLOR ,0,0ffffffffh
		invoke	InvalidateRect,listhwnd,0,1
	.endif
	ret
tproc	endp
end	start	