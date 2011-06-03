;###################################################
;	Description:	Folder Guard Nag Cracker
;	Version:  	1.0             
; 	Author:		Madhur Ahuja               
;	Start Date: 	28/11/03,01:59:03                     
;	Name:  		FGUARD.ASM
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
include gdi32.inc
include crtlib.inc
.listall
includelib gdi32.lib
includelib user32.lib
includelib kernel32.lib
includelib crtlib.lib

.data?
;hwnd	HWND 	3 dup (?)
flag	db	?
mut	dd	?
event	dd	?
hdc	dd	?
rc	RECT	<?>
hwnd	HWND	?
index	dd	?
buffer	db	255 dup(?)
buffer1	db	10 dup(?)
.const
logo 	db	"Folder Guard Nag Cracker- By Madhur",0
title1	db	"Folder Guard [ Evaluation Mode ]",0
class	db	"#32770",0
title2	db	"Confirm File Delete",0
title3	db	"Confirm Folder Delete",0
title4	db	"Confirm Multiple File Delete",0
msg	db	"click to destroy",0
mut1	db	"madhur",0
running	db	"Program Already Running",10,13
	db	"Close Already Running",0
eventn	db	"event",0
sec1	db	"madhur",0
inidata	db	"0=0",0
	db	"index=1",0,0
inifile	db	"fguard.ini",0
key1	db	"index",0
.code
start:

	invoke	GetPrivateProfileSection,offset sec1,offset buffer,255,offset inifile
	.if	eax==0
		invoke	WritePrivateProfileSection,offset sec1,offset inidata,offset inifile
	.endif
	
	invoke	CreateEvent,0,0,0,offset eventn		;if event already exists it will be opened
	mov	event,eax		;we cannot get whether createevent returned new handle or existing
	;invoke	GetLastError				;so andle, we must call getlasterror and check the error code
	;.if	eax==0b7h					;instead i create a mutex to check whether the process is running
	invoke	OpenMutex,MUTANT_ALL_ACCESS,0,offset mut1
	.if	eax!=0		; mutex exists , this is second copy of the program
		invoke	ExitProcess,0
	.endif
	
	invoke	CreateMutex,0,1,offset mut1
	;invoke	GetScreenRect,offset rc
	invoke	GetSystemMetrics,SM_CXFULLSCREEN
	mov	rc.right,eax
	invoke	GetSystemMetrics,SM_CYFULLSCREEN
	mov	rc.bottom,eax
	
	
	.while  1
	
		
		
		
		
		invoke	GetForegroundWindow
		mov	hwnd,eax
		
		invoke	GetWindowDC,0
		mov	hdc,eax
		
		;linvoke	TextOut,hdc,0,0,offset logo,6
		;invoke	DrawText,hdc,offset logo,-1,offset rc,DT_CENTER	
		invoke	ReleaseDC,0,hdc
		
		invoke	FindWindow,addr class,addr title1
		.if	eax!=0
			invoke	SendMessage,eax,WM_CLOSE,0,0

			invoke	GetPrivateProfileInt,offset sec1,offset key1,1,offset inifile
			mov	index,eax
			invoke	_itoa,index,offset buffer1,10
			invoke	GetForegroundWindow
			invoke	GetWindowText,eax,offset buffer,255
			invoke	WritePrivateProfileString,offset sec1,offset buffer1,offset buffer,offset inifile
			inc	index
			invoke	_itoa,index,offset buffer1,10
			invoke	WritePrivateProfileString,offset sec1,offset key1,offset buffer1,offset inifile
		.endif
		invoke	FindWindow,addr class,addr title2
		.if	eax!=0
			invoke	SendMessage,eax,WM_CLOSE,0,0
			
			invoke	GetPrivateProfileInt,offset sec1,offset key1,1,offset inifile
			mov	index,eax
			invoke	_itoa,index,offset buffer1,10
			invoke	GetForegroundWindow
			invoke	GetWindowText,eax,offset buffer,255
			invoke	WritePrivateProfileString,offset sec1,offset buffer1,offset buffer,offset inifile
			inc	index
			invoke	_itoa,index,offset buffer1,10
			invoke	WritePrivateProfileString,offset sec1,offset key1,offset buffer1,offset inifile
			
			
			
		.endif
		invoke	FindWindow,addr class,addr title3
		.if	eax!=0
			invoke	SendMessage,eax,WM_CLOSE,0,0
			
			invoke	GetPrivateProfileInt,offset sec1,offset key1,1,offset inifile
			mov	index,eax
			invoke	_itoa,index,offset buffer1,10
			invoke	GetForegroundWindow
			invoke	GetWindowText,eax,offset buffer,255
			invoke	WritePrivateProfileString,offset sec1,offset buffer1,offset buffer,offset inifile
			inc	index
			invoke	_itoa,index,offset buffer1,10
			invoke	WritePrivateProfileString,offset sec1,offset key1,offset buffer1,offset inifile
		.endif
		
		invoke	FindWindow,addr class,addr title4
		.if	eax!=0
			invoke	SendMessage,eax,WM_CLOSE,0,0
			
			invoke	GetPrivateProfileInt,offset sec1,offset key1,1,offset inifile
			mov	index,eax
			invoke	_itoa,index,offset buffer1,10
			invoke	GetForegroundWindow
			invoke	GetWindowText,eax,offset buffer,255
			invoke	WritePrivateProfileString,offset sec1,offset buffer1,offset buffer,offset inifile
			inc	index
			invoke	_itoa,index,offset buffer1,10
			invoke	WritePrivateProfileString,offset sec1,offset key1,offset buffer1,offset inifile
		.endif
		
		
		invoke	SetForegroundWindow,hwnd
		
		invoke	WaitForSingleObject,event,50h
		.if	eax==WAIT_OBJECT_0		;the other process has signalled, exit now
			invoke	ExitProcess,0
		.endif
		;linvoke	Sleep,50h
		;now this is the real advantage, with waitforsingleobject waiting for exit event for 50h ms
		;we do not need sleep, the os simply puts the process to sleep during wait time,
		;so as to reduce busy waiting
	.endw		
end	start	