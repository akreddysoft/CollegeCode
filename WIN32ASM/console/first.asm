.386
.model flat, stdcall
option casemap:none

;includes-------------------------
.nolist
include windows.inc                    ;change if in different
include kernel32.inc                    ;directory
include user32.inc
.listall
includelib kernel32.lib
includelib user32.lib

;---------data--------------------

.data
msg db "Hello world!", 0ah  ;doesn't have to be zero-
                                         ;terminated...you'll find out
                                         ;why

;--uninitialized------------------
.data?
stdout  dd ?
cWritten dd ?

;--------------code--------------
.code
start:

 invoke GetStdHandle, STD_OUTPUT_HANDLE
 mov stdout, eax

 invoke WriteConsole, stdout, ADDR msg, sizeof msg, \
    ADDR cWritten, NULL
 invoke WriteConsole, stdout, ADDR msg, sizeof msg,  \
    ADDR cWritten, NULL
invoke	StdOut,f
 ret
end start