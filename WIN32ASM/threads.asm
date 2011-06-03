;PE EXE
.386
.model	flat,stdcall
option 	casemap:none
.nolist
include	windows.inc
include	kernel32.inc
include user32.inc
include macro.inc
.listall
includelib user32.lib
includelib kernel32.lib
tproc proto msg:DWORD
.data?
hinst	HINSTANCE	?
tid1	dd	?
tid2	dd	?
tid3	dd	?
.const
msg11	db	"thread 1 created",0
msg12	db	"thread 2 created",0
msg13	db	"thread 3 created",0
msg21	db	"thread 1 closed",0
msg22	db	"thread 2 closed",0
msg23	db	"thread 3 closed",0
msg1	db	"This is a multiple thread program",0

.code
start:
	invoke	CreateThread,0,0,offset tproc,offset msg1,0,offset tid1
	push	eax
	
	invoke	CreateThread,0,0,offset tproc,offset msg1,0,offset tid2
	push	eax	
	
	invoke	CreateThread,0,0,offset tproc,offset msg1,0,offset tid3
	push	eax
		
	mov	ecx,ebp
	sub	ecx,38h
	
	invoke	WaitForMultipleObjects,3,ecx,TRUE,INFINITE	; os will put process on sleep until all 3 thread returns
	
	call 	CloseHandle
	invoke	MessageBox,0,offset msg21,offset msg21,0
	
	call	CloseHandle
	invoke	MessageBox,0,offset msg22,offset msg22,0
	
	call	CloseHandle
	invoke	MessageBox,0,offset msg23,offset msg23,0
	
	invoke	ExitProcess,0
		
	
tproc proc msg:DWORD
	invoke	MessageBox,0,msg,msg,0
	ret
tproc	endp

	
end	start	