;CLEARS DOUBT ABOUT OFFSET ON STACK
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
fact proto num:dword
anyproc proto	p:dword

.data?
hinst	HINSTANCE	?
.data
a1	db	"this is madhur",0
.code
start proc
local 	a:dword		;this is can be written as a equ	[ebp-4]   note the brackets
	mov	a,offset a1
	mov	edx,a
	
	invoke	anyproc,addr a
	invoke	anyproc,a
	
	
	mov	ecx,a		;this is same as offset of a1
	lea	ecx,a		;ecx now contains the address of a ,this is not same as offset of a2
				;this is equal to stack address which points to offset of a1 i.e. ebp-4
	
	mov	ecx,[ebp-4]	;ebp-4 is dereferenced an val is moved
	lea	ecx,[ebp-4]	;this is exactly same as above

	invoke	ExitProcess,0
start	endp



anyproc	proc p:dword
	mov	eax,p
	ret
anyproc	endp
end	start	