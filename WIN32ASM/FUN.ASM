;32BIT EXE                       
.386                             
.model	flat,stdcall             
option 	casemap:none             
include	windows.inc              
include	kernel32.inc             
include gdi32.inc
includelib gdi32.lib
include user32.inc               
includelib user32.lib            
includelib kernel32.lib          
.data                            
ps	PAINTSTRUCT	<0>
hdc	HDC	0
a2	dd	0
.data?                           
hinst	HINSTANCE	?
.const
appname	db	'madhur',0
                                 
.code                            
start:                           
	invoke	GetModuleHandle,0
	mov	[hinst],eax
	invoke	GetDC,0
	.if	eax==0
		invoke	MessageBox,0,addr appname,addr appname,0
		jmp	there
	.endif
	mov	hdc,eax
	
	mov	a2,1
	.while	a2<500
		invoke	SetPixel,hdc,a2,a2,00123456h
		inc	a2
	.endw
	
	.if	eax==0
	invoke	MessageBox,0,addr appname,addr appname,0
		jmp	there
	.endif
	invoke	ReleaseDC,0,hdc
there:
	invoke	ExitProcess,0		
end	start	                 
