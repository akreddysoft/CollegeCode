
.386
.model flat ,stdcall
option casemap:none
.nolist
include windows.inc
include kernel32.inc
include user32.inc
.listall
includelib kernel32.lib
includelib user32.lib
.data
szCaption     db 'SEH in Assembly', 0
szException     db  'Exception has been handled !!', 0dh, 0ah
		db	'Press OK to terminate gracefully', 0
szNoException db 'No Exception occured', 0 
.code
start:
	
	xor	ebx,ebx
	mov	eax,[ebx]
	
	invoke	ExitProcess,0
end	start








