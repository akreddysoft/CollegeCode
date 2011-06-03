.386
.model flat,stdcall
option casemap:none
include /masm32/include/user32.inc
include /masm32/include/kernel32.inc
includelib /masm32/lib/user32.lib
includelib /masm32/lib/kernel32.lib
.code
start:
jmp @F
testing db "Stack needs to be aligned to dword",0
@@:
sub esp,2 ;remove the dword align, the code would definitely crash on *NT* system
invoke MessageBox,0,OFFSET testing,0,0
invoke ExitProcess,0
end start
