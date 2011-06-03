;PE EXE
.386
.model	flat,stdcall
option 	casemap:none
.nolist
include	windows.inc
include	kernel32.inc
include user32.inc
include ..\macro.inc
include masm32.inc
include about.inc
include gdi32.inc
include shell32.inc
.listall
includelib shell32.lib
includelib gdi32.lib
includelib masm32.lib
includelib user32.lib
includelib kernel32.lib

.data?
hinst	HINSTANCE	?

.data
abtproc	proto	hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
flag	db	0
flag1	db	0
pt	POINT<0>

pt1	POINT<0>
pt2	POINT<0>
pt3	POINT<0>
hbm	HBITMAP	0
hbm1	HBITMAP	0
hbm2	HBITMAP	0
hbm3	HBITMAP	0
rect	RECT<0>
	
.const
dlgproc	proto  	hwnd:HWND,umsg:DWORD,wparam:WPARAM,lparam:LPARAM
dialog		db	'IDD_MAIN',0
abtdlg		db	"IDD_ABOUT",0
IDOK		EQU	1
IDC_ABOUT	equ	101
IDEXIT		equ	9
action		db	"open",0
ad1		db	"www.geocities.com/madhur_ahuja",0
ad2		db	"mailto:madhur_ahuja@yahoo.com",0
.code
start:
	invoke	GetModuleHandle,NULL
	mov	[hinst],eax
	invoke	DialogBoxParam,hinst,addr dialog,0,addr dlgproc,0
	invoke	ExitProcess,0


dlgproc	proc	hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM
	.if	uMsg==WM_INITDIALOG

	.elseif	uMsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDOK
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
		.else
		.endif              
	.elseif	uMsg==WM_CLOSE
		invoke	EndDialog,hwnd,0
	.else
		mov	eax,FALSE
		ret
	.endif
	mov	eax,TRUE
	ret												                   		              
dlgproc	endp


abtproc proc  hwnd:HWND,msg:UINT,wparam:WPARAM,lparam:LPARAM
local ps:PAINTSTRUCT
local hdc,mhdc,mhdc1


	.if	msg== WM_INITDIALOG
		invoke	LoadBitmap,hinst,IDCHOUSE
		mov	hbm,eax
		invoke	LoadBitmap,hinst,IDHOUSE
		mov	hbm1,eax
		invoke	LoadBitmap,hinst,IDCMAIL
		mov	hbm2,eax
		invoke	LoadBitmap,hinst,IDMAIL
		mov	hbm3,eax
		
		mov	pt1.x,0fh
		mov	pt1.y,60h
		
		mov	ecx,pt1.x
		mov	edx,pt1.y
		
		mov	pt2.x,ecx
		mov	pt2.y,edx
		add	pt2.x,25
		add	pt2.y,3

		m2m	rect.top,pt1.y
		m2m	rect.bottom,pt1.y
		add	rect.bottom,14
		m2m	rect.left,pt1.x
		m2m	rect.right,pt2.x

	.elseif	msg== WM_CLOSE
		invoke	DeleteObject,hbm
		invoke	DeleteObject,hbm1
		invoke	DeleteObject,hbm2
		invoke	DeleteObject,hbm3
		invoke	EndDialog,hwnd,0

	.elseif	msg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDOK
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
		.endif

	.elseif	msg==WM_MOUSEMOVE
		mov	eax,lparam
		m2m	pt.x,ax
		shr	eax,16
		m2m	pt.y,ax
	
		.if pt.x >=pt1.x && pt.x <pt1.x+14 && pt.y >=pt1.y && pt.y<pt1.y +14
			.if flag==0
				mov	flag,1
				invoke	InvalidateRect,hwnd,addr rect,1
			.endif
		.else
		
			.if flag==1
				mov	flag,0
				invoke	InvalidateRect,hwnd,addr rect,1
			.endif
		.endif
		

		.if pt.x >=pt2.x && pt.x <pt2.x+14 && pt.y >=pt2.y && pt.y<pt2.y +14
			.if flag1==0
				mov	flag1,1
				invoke	InvalidateRect,hwnd,0,1
			.endif
		.else

			.if flag1==1
				mov	flag1,0
				invoke	InvalidateRect,hwnd,0,1
			.endif
		.endif

	.elseif	msg==WM_PAINT
		invoke	BeginPaint,hwnd,addr ps
		mov	hdc,eax
		invoke	CreateCompatibleDC,hdc
		mov	mhdc,eax
		invoke	CreateCompatibleDC,hdc
		mov	mhdc1,eax
		
		.if flag==1
			invoke	SelectObject,mhdc,hbm
		.else
			invoke	SelectObject,mhdc,hbm1
		.endif
		
		.if flag1==1
			invoke	SelectObject,mhdc1,hbm2
		.else
			invoke	SelectObject,mhdc1,hbm3
		.endif

		invoke	TransparentBlt,hdc,pt1.x,pt1.y ,14,14,mhdc,0,0,14,14,0ff00ffh
		invoke	TransparentBlt,hdc,pt2.x ,pt2.y ,11,11,mhdc1,0,0,11,11,0ff00ffh

		invoke	DeleteDC,hdc
		invoke	DeleteDC,mhdc
		invoke	DeleteDC,mhdc1
		invoke	EndPaint,hwnd,addr ps

	.elseif	msg==WM_LBUTTONDOWN
		mov	eax,wparam
		mov	pt.x,ax
		shl	eax,16
		mov	pt.y,ax
		.if pt.x >=pt1.x && pt.x <pt1.x+14 && pt.y >=pt1.y && pt.y<pt1.y +14
			invoke	ShellExecute,hwnd,offset action,offset ad1,0,0,0
		.endif
		.if pt.x >=pt2.x && pt.x <pt2.x+14 && pt.y >=pt2.y && pt.y<pt2.y +14
			invoke	ShellExecute,hwnd,offset action,offset ad2,0,0,0
		.endif
	
	
	.else
		mov	eax,0
		ret
	.endif
	mov	eax,1
	ret
abtproc	endp
end	start	