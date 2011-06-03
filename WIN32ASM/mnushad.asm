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
include gdi32.inc
.listall
includelib gdi32.lib
includelib masm32.lib
includelib user32.lib
includelib kernel32.lib

.data?
hinst	HINSTANCE	?
hbmp	HBITMAP		?
mhdc	HANDLE	?
hdc	HDC	?
hdchwnd	HDC	?
mhwnd	HANDLE	?
hfont	dd	?
.data

.const
dlgproc	proto  	hwnd:HWND,umsg:DWORD,wparam:WPARAM,lparam:LPARAM
dialog		db	'IDD_MAIN',0
IDOK		EQU	1
IDEXIT		equ	9
menu	db	"IDM_MENU1",0
a1	db	"drawitem",0
a2	db	"measureitem",0
bmp	db	"MYBITMAP",0
szMnuFont	db	"Arial",0
.code
start:
	invoke	GetModuleHandle,NULL
	mov	[hinst],eax
	invoke	DialogBoxParam,hinst,addr dialog,0,addr dlgproc,0
	invoke	ExitProcess,0


dlgproc	proc	hwnd:HWND,uMsg:UINT,wparam:WPARAM,lparam:LPARAM

;local	mhwnd:HDC
local pt:POINT
	.if	uMsg==WM_INITDIALOG
		;invoke	LoadMenu,hinst,offset menu
		invoke	CreatePopupMenu
		mov	mhwnd,eax
		invoke	AppendMenu,mhwnd,MF_OWNERDRAW or MF_STRING,10,offset bmp
		invoke	AppendMenu,mhwnd,MF_OWNERDRAW or MF_STRING,10,offset bmp
		invoke	AppendMenu,mhwnd,MF_OWNERDRAW or MF_STRING,10,offset bmp
		invoke	AppendMenu,mhwnd,MF_OWNERDRAW or MF_STRING,10,offset bmp
		invoke	AppendMenu,mhwnd,MF_OWNERDRAW or MF_STRING,10,offset bmp
		;invoke	SetMenu,hwnd,mhwnd
		
		invoke	GetDC,hwnd
		mov	hdchwnd,eax
		invoke	CreateCompatibleDC,hdchwnd
		mov	mhdc,eax
		invoke	LoadBitmap,hinst,offset bmp
		mov	hbmp,eax
		invoke	SelectObject,mhdc,hbmp
		
		 invoke CreateFont,15,0,0,0,FW_NORMAL,0,0,0,ANSI_CHARSET,\
                   OUT_DEFAULT_PRECIS,CLIP_DEFAULT_PRECIS,\
                   DEFAULT_QUALITY,DEFAULT_PITCH ,\
                   ADDR szMnuFont  
                   
                   mov	hfont,eax
		
	.elseif uMsg==WM_DRAWITEM
		.if	wparam==0
			;invoke	MessageBox,0,offset a1,0,0
			mov	edi,lparam
			assume	edi:ptr DRAWITEMSTRUCT
			m2m	hdc,[edi].hdc
			invoke 	SetBkMode, [edi].hdc, TRANSPARENT
			invoke	SelectObject,[edi].hdc,hfont
			
			.if [edi].itemState & ODS_SELECTED

           .if [edi].itemState & ODS_DISABLED
            invoke GetSysColor, COLOR_MENU
            invoke SetTextColor,[edi].hdc, eax
	    .else
           invoke GetSysColor, COLOR_HIGHLIGHTTEXT
           invoke SetTextColor,[edi].hdc, eax
          .endif

           mov eax, [edi].rcItem.left
           add eax, 22

	invoke	BitBlt,hdc,0,0,100,100,mhdc,0,0,SRCCOPY
;           invoke BitBlt, [edi].hdc, eax, [edi].rcItem.top, 129, 20, hMem_Hilite_DC, 0, 0, SRCCOPY
          .else
                            
          .if [edi].itemState & ODS_DISABLED
           invoke GetSysColor, COLOR_GRAYTEXT
           invoke SetTextColor,[edi].hdc, eax
	    .else
           invoke GetSysColor, COLOR_MENUTEXT
           invoke SetTextColor,[edi].hdc, eax
          .endif
  						
           invoke GetSysColorBrush, COLOR_MENU    
           invoke SelectObject, [edi].hdc, eax
  							
           mov eax, [edi].rcItem.bottom
           sub eax, [edi].rcItem.top

           invoke PatBlt, [edi].hdc, [edi].rcItem.left, [edi].rcItem.top, [edi].rcItem.right, eax, PATCOPY
  	    .endif	
			
			
		
			
		.endif
	.elseif	uMsg==WM_RBUTTONDOWN
		mov	eax,lparam
		mov	edx,lparam
		and	edx,0000ffffh
		mov	pt.x,edx
		mov	edx,lparam
		and	edx,0ffff0000h
		mov	pt.y,edx
		invoke 	GetCursorPos,addr pt 

		invoke	TrackPopupMenu,mhwnd,TPM_RIGHTALIGN,pt.x,pt.y,0,hwnd,0	
		
		
	.elseif	uMsg==WM_MEASUREITEM
		.if	wparam==0
			mov	edi,lparam
			assume	edi:ptr MEASUREITEMSTRUCT
			;mov	[edi].itemWidth,100
			;mov	[edi].itemHeight,100
			;invoke	MessageBox,0,offset a1,0,0
		.endif
		

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
	
end	start	