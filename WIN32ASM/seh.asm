
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
szException     db  'Exception has been handled !!', 10,13
		db	'Press OK to terminate gracefully', 0
szNoException db 'No Exception occured', 0 
.code
start:
;;;;;;;;;;;;;;INSTALL HANDLER;:write this before critical code;;;;;;;;
	assume fs:nothing
	pushad
	mov	esi,offset handler
	push	esi		;push	new handler address
	push	fs:[0]		;push	old  handler address
	mov	fs:[0],esp
;##############################################################
	xor	ebx,ebx
	mov	eax,[ebx]
	
;;;;;;;;;write this before handler;;;;;;;;;;;;;;;;;;;;;;	
	jmp	safe
handler:
	mov	esp,[esp+8]
	pop	fs:[0]		;restore old handler address
	add	esp,4
	popad
;####################################################
	
	invoke	MessageBox,0,offset szException,offset szCaption,0	;this is handler

;;;;;;;;;;;;;;write this after handler;;;;;;;;;;;;	
	jmp	cont	
safe:	
	pop	fs:[0]
	add	esp,32+4
	
cont:
;#############################################	
	invoke	ExitProcess,0
end	start








