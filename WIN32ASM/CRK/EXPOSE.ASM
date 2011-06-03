.386                             
.model	flat,stdcall             
option 	casemap:none             
.nolist
include	windows.inc              
include	kernel32.inc             
include user32.inc               
.listall
includelib user32.lib            
includelib kernel32.lib          
.data                            
about	db 	'Expose key generator by Madhur',0
AppName	db	'Expose key generator',0
cap	db	'Win-O-Expose key generator',13,10
	db	'Coded by Madhur in win32asm',0  
dialog	db	'DIALOG_1',0                      
serial	db	'madhur',0
regkey	db	20 dup(0)
len	db	0
dlgproc	proto :HWND,:UINT,:WPARAM,:LPARAM
.data?                           
hinst	HINSTANCE ?
hwnd	HWND 	?
;msg	MSG <?>
edhwnd	HWND	?
hicon	HWND	?
.CONST                           
IDC_EDIT1	equ	101
IDC_EDIT2	equ	102
.code                            
start:                           
	invoke	GetModuleHandle,0
	mov	hinst,eax
	invoke	DialogBoxParam,hinst,addr dialog,0,addr dlgproc,0
	mov	hwnd,eax
	invoke	ExitProcess,0            

dlgproc	proc hWnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
	.if	uMsg==WM_INITDIALOG                     
		invoke	SetDlgItemText,hWnd,IDC_EDIT1,addr serial
		call	getit
		invoke	SetDlgItemText,hWnd,IDC_EDIT2,addr regkey
	.elseif	uMsg==WM_SETICON
		invoke	LoadIcon,hinst,IDI_APPLICATION
		mov	hicon,eax
	.elseif	uMsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDC_EDIT1
			shr	eax,16
			.if	ax==EN_CHANGE
				invoke	GetDlgItemText,hWnd,IDC_EDIT1,addr serial,20
				invoke	lstrlen,addr serial
				.if	eax!=0
					call 	getit                               
					mov	eax,lparam
					mov	edhwnd,eax
					;invoke	SetWindowText,edhwnd,addr regkey
					invoke	SetDlgItemText,hWnd,IDC_EDIT2,addr regkey
				.endif
			.endif
		.elseif	ax==1
			invoke	MessageBox,hwnd,offset cap,offset AppName,MB_ICONINFORMATION or MB_SYSTEMMODAL
		.elseif	ax==2
			invoke	EndDialog,hWnd,0
		.endif
	.else
		mov	eax,FALSE
		ret
	.endif
	mov	eax,TRUE
	ret
dlgproc	endp			                                 
                                 

getit proc A
local	pass:DWORD
	mov	pass,0f422c070h	
	pusha
	invoke	lstrlen,addr serial
	mov	len,al
	mov	ecx,eax
	lea	esi,serial
caps:
	mov	al,[esi]
	cmp	al,61h
	jnae	cont3
	sub	al,20h              ;convert to uppercase
cont3:
	mov	[esi],al
	inc 	esi
	loop	caps

	xor	eax,eax
	xor	ecx,ecx
	xor	esi,esi
	xor	edx,edx 
	xor	ebx,ebx
	movzx	ebx,len
	mov	edi,0f422c070h  ;very imp

calc:
	movsx	eax,byte ptr [serial+esi]
	cmp	eax,20h
	je	space
	imul	eax,esi
	mov	ecx,eax
	lea	eax,dword ptr [eax+eax*2]
	shl	eax,3h
	lea	edx,dword ptr [ecx+eax*8]
	lea	eax,dword ptr [edx+edx*4]
	add	eax,ecx
	neg	eax
	add	pass,eax
space:
	inc	esi          
	cmp	esi,ebx
	jne	calc                ;conversion routine

	mov	bx,10h
	xor	si,si
loop0:
	mov	ax,word ptr [pass+esi]
	mov	cx,4h
loop1:
	xor	dx,dx
	idiv	bx
	push	dx        ;remainder in ah
	loop	loop1
	inc	si
	inc	si
	cmp	si,4h
	jne	loop0           ;each hex digit pushed on to the stack
	
	mov	cx,8h
	xor	si,si

loop2:
	pop	ax
	cmp	al,9h
	ja	char
	add	al,30h
	jmp	cont
char:
	add	al,37h
cont:
	mov	[regkey+si],al
	inc	si
	loop	loop2                 ;each item popped,converted and saved in array	
	mov	[regkey+si],0 
	popa
	ret
getit	endp                            
end	start	                 
