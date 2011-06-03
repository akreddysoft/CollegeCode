;32BIT EXE

.386
.model	flat,stdcall
option 	casemap:none
.NOLIST
include	e:\masm32\include\windows.inc
include	e:\masm32\include\kernel32.inc
include e:\masm32\include\user32.inc
.listall
includelib e:\masm32\lib\user32.lib
includelib e:\masm32\lib\kernel32.lib

.data
hlib	HANDLE	0
add1	dd	0
.data?
hinst	HINSTANCE	?
.const
err1	db	'cannot load dll',0
err2	db	'func add cannot found',0
libname	db	'dynamic.dll',0
procname	db	'madhur',0
.code
start:
	invoke	GetModuleHandle,NULL
	mov	[hinst],eax
	invoke	LoadLibrary,offset libname
	.if	eax==0
		invoke	MessageBox,0,addr err1,addr err1,0
		invoke	ExitProcess,0
	.endif
	mov	hlib,eax
	invoke	GetProcAddress,hlib,addr procname
	.if	eax==0
		invoke	MessageBox,0,addr err2,addr err2,0
		invoke	ExitProcess,0
	.endif
	mov	add1,eax	;why call eax doesnt work
	call	[add1]
	invoke	FreeLibrary,hlib
	invoke	ExitProcess,0
end	start	