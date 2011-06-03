;PE EXE
.386
.model	flat,stdcall
option 	casemap:none
.nolist
include	windows.inc
include	kernel32.inc
include user32.inc
include macro.inc
include masm32.inc
.listall
includelib user32.lib
includelib kernel32.lib
includelib masm32.lib
.data?
hinst	HINSTANCE	?

.data
buff	db	10 dup(0)
.const

.code
start:
	invoke	GetModuleHandle,NULL
	mov	[hinst],eax
;first method
; Do some stuff
  	call GetEIP
	eaxPointsToHere:
  ; Do other stuff
	invoke	dw2hex,eax,offset buff
	invoke	MessageBox,0,offset buff,offset buff,0
	;jmp 	exit

;;;;;second method
 	call      foo
	
	foo:  pop   eax
	invoke	dw2hex,eax,offset buff
	invoke	MessageBox,0,offset buff,offset buff,0



	GetEIP:
	  mov eax,[esp]
  	ret

  exit:

	invoke	ExitProcess,0
end	start	