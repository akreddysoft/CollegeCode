;32BIT DLL
.386
.model	flat,stdcall
.nolist
option 	casemap:none
include	windows.inc
include kernel32.inc
include user32.inc
include ..\..\macro.inc
.listall
includelib user32.lib
includelib kernel32.lib
.data?

.code
DllEntry proc hinst:HINSTANCE,reason:dword,reserved1:dword
	mov	eax,TRUE
	.if 	reason==DLL_PROCESS_ATTACH

	.elseif reason==DLL_PROCESS_DETACH

	.elseif reason==DLL_THREAD_ATTACH

	.else        ; DLL_THREAD_DETACH

	.endif
	ret
DllEntry endp

end	DllEntry