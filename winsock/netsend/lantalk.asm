;remove the newline from the message we send and append it to end
.386
.model	flat,stdcall
option 	casemap:none
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
.nolist
include	windows.inc
include	kernel32.inc
include user32.inc
include wsock32.inc
include crtdll.inc
include comctl32.inc
include masm32.inc
include winmm.inc
include shell32.inc
include msvcrt.inc
include ..\macro.inc
.listall
includelib shell32.lib
includelib masm32.lib
includelib user32.lib
includelib kernel32.lib
includelib ws2_32.lib
includelib masm32.lib
includelib comctl32.lib
;includelib crtlib.lib
includelib crtdll.lib
includelib winmm.lib
includelib msvcrt.lib
;includelib lanchat.lib
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
.data
INIDATA struct
hosts	db	1000 dup(0)
hostindex	db	1
INIDATA ends

FLASHINFO struct 
 cbSize DWORD  0
 hwnd DWORD  0
 dwFlags  DWORD 0
 uCount DWORD  0
dwTimeout  DWORD 0 
FLASHINFO ENDS
;#############################################
inifile		db	"lantalk.ini",0
inidata 	INIDATA <>
inidata1 	INIDATA <>
inidata3	INIDATA	<>
indata		db	"0=sai",0
		db	"hostindex=1",0,0
		
sec1		db	"LANTalk",0
field1		db	"0",0
field2		db	"hostindex",0

fhost		db	"sai",0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cmdline		db	"net send /domain:"
hostmsg		db	150 dup(0)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
success		db	"The message was successfully sent to domain "
hostname	db	15 dup(0)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
trail		db	".",13,13,10,0
msg1		db	100 dup(0)

mainstream	EDITSTREAM <0>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
stat1		db	"The Message was successfully sent to "
host		db	15 dup(0)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
tip		db	"LANTalk by Madhur",0
silenceflag	db	0
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
.data?
nid	NOTIFYICONDATA	<?>
buff2		db	10 dup(?)
count		db	?
mainhwnd	dd	?
cbohwnd		dd	?	
maincbohwnd	dd	?
stathwnd	dd	?
wsadata		WSADATA	<?>
hinst		DD	?
dllhinst	dd	?
hRichEditDLL 	dd 	?
thwnd		dd	?
whwnd		dd	?
tclient		dd	?
tserver		dd	?
clientsockad	sockaddr_in<?>
sockad	sockaddr_in<?>
hwndrich	dd	?
buff1		db	200 dup(?)
hwndmainrich	dd	?
wc		WNDCLASSEX	<?>
msg		MSG	<?>
oldmainproc	dd	?

hostnam	db	15 dup(?)	; this keeps the hostname of machine
sendnam	db	15 dup(?)	;this keeps the hostname of senfer
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
.const
;dialog constants
maindlg		dd	1
abtdlg		dd	2
optdlg		dd	3
adddlg		dd	4
;string constants
crlf		db	10,13,0
msgstr		db	13,10,13,10,0
colon		db	": ",0
space		db	20h,0
;app constants
silence		db	"silence",0
landll		db	"lantalk.dll",0
ver		dd	0002h		;higher byte=minor,lower byte=majorA
app		db	"LANTalk",0
icon1		db	"ICON1",0
RichEditDLL 	db 	"RichEd20.dll",0
icons		db	"ICONS",0
iconl		db	"ICONL",0
wavefile	db	"chimeup",0
buzzfile	db	"doorbell",0
ClassName	db	"trayclass",0
;window constants
class		db	"#32770",0
wtitle		db	"Messenger Service ",0
wstatic		db	"static",0
butclass	db	"button",0
;errors
err0		db	"not suitable winsock version",0
err1		db	"Error in creating socket",0
err2		db	"Connection to %s failed",10,13,0
err3		db	"Error in sending data",0
err6		db	"Please specify the hostname",0
err10		db	"Cannot determine hostname",0
err11		db	"No hostname specified",0
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
mainrichproc	proto	hfile:dword,richbuff:dword,numbytes:dword,cb:dword
abtproc		proto	hwnd:HWND,umsg:UINT,wparam:WPARAM,lparam:LPARAM
optproc		proto	hwnd:HWND,umsg:UINT,wparam:WPARAM,lparam:LPARAM
copystruct 	proto 	dest:dword,src:dword
maindlgproc	proto	hwnd:HWND,umsg:UINT,wparam:WPARAM,lparam:LPARAM
adddlgproc	proto	hwnd:HWND,umsg:UINT,wparam:WPARAM,lparam:LPARAM
clientproc	proto 	a:dword
serverproc	proto 	a:dword
wproc		proto 	a:dword
tproc 		proto 	msg:DWORD
enumproc	proto	hwnd:HWND,lparam:LPARAM
bin 		proto	source:dword,dest:dword

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
WM_CHANGECOLOR	EQU	WM_USER+200
IDEXIT		EQU	2
IDM_MENU	EQU	1
IDSEND		EQU	1
IDC_EDIT	EQU	101
IDC_MSG		EQU	102
IDC_HOSTS	EQU	103
IDOK		EQU	1
IDM_ABOUT	EQU	11844
IDM_EXIT	EQU	11843
IDM_OPTIONS	EQU	11842
IDD_ADDHOST	EQU	4
IDC_HOST	EQU	500
IDC_ADDIP	EQU	501
IDC_CHECKCON	EQU	502
IDC_HOSTADD	EQU	104
IDC_HOSTDELETE	EQU	105
IDC_STATUS	EQU	104
IDM_BUZZ	EQU	11845
IDM_CLEAR	EQU	11846
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
.code
start:

	invoke	InitCommonControls
	
	;invoke	LoadLibrary,addr landll
	mov	dllhinst,eax
	invoke 	LoadLibrary,addr RichEditDLL
	mov 	hRichEditDLL,eax
	
	invoke	GetCL,1,addr buff1
	invoke	strcmp,addr buff1,addr silence
	.if	eax==0
		mov	silenceflag,1
	.endif
	
	
	invoke	GetPrivateProfileSection,offset app,offset buff1,200 ,offset inifile
	.if	eax==0
		invoke	strcpy,offset inidata.hosts,offset fhost
		invoke	WritePrivateProfileSection,offset app,offset indata,offset inifile
	.endif
	invoke	GetPrivateProfileInt,offset app,offset field2,1,offset inifile
	mov	inidata.hostindex,al
	
	xor	edx,edx
	mov	ecx,offset inidata.hosts
	.while	dl<inidata.hostindex
		push	edx
		push	ecx
		invoke	_itoa,edx,addr buff2,10	
		pop	ecx
		pop	edx
		
		push	edx
		push	ecx
		invoke	GetPrivateProfileString,offset app,addr buff2,0,ecx,100,offset inifile
		pop	ecx
		pop	edx
		
		add	ecx,100
		inc	dl
	.endw
	
	invoke	WSAStartup,ver,addr wsadata
	.if	wsadata.wVersion<2
		invoke	MessageBox,0,offset err0,offset app,0
		invoke	ExitProcess,0
	.endif
	
	invoke	gethostname,offset hostnam,15
	.if	eax!=0
		invoke	MessageBox,0,offset err10,offset app,0
		invoke	ExitProcess,0
	.endif
	invoke	_strupr,offset hostnam
	
	invoke	GetModuleHandle,0
	mov	hinst,eax
	
        invoke 	CreateDialogParam,hinst,maindlg,NULL,offset maindlgproc,NULL 
        mov   	mainhwnd,eax 
	
	.if	silenceflag==0        
        	invoke 	ShowWindow, mainhwnd,SW_SHOWNORMAL 
        .endif
        .WHILE TRUE 
        	invoke GetMessage, ADDR msg,NULL,0,0 
            	.BREAK .IF (!eax) 
           	invoke IsDialogMessage, mainhwnd, ADDR msg 
            	.IF eax ==FALSE 
                	invoke TranslateMessage, ADDR msg 
                	invoke DispatchMessage, ADDR msg 
            	.ENDIF 
        .ENDW 
        mov     eax,msg.wParam 

	invoke	ExitProcess,0

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл	
maindlgproc	proc	hwnd:HWND,umsg:UINT,wparam:WPARAM,lparam:LPARAM
local	hmenu:dword
local	buff[1024]:byte
LOCAL 	startupinfo:STARTUPINFO 
LOCAL 	pinfo:PROCESS_INFORMATION 
LOCAL 	sat:SECURITY_ATTRIBUTES 
local 	pos:dword
LOCAL 	rect:RECT 
LOCAL 	hRead:DWORD 
LOCAL 	hWrite:DWORD 
LOCAL 	bytesRead:DWORD 
local	buffer[1024]:byte
LOCAL 	intarray[3]:dword
local	hit:dword
local	wid:dword
local	savesel:dword
local 	len:dword
local	len1:dword
local	cf:CHARFORMAT
	.if	umsg==WM_INITDIALOG
		;set the small and big icon of dialog
		invoke	LoadIcon,hinst,offset icon1
		push	eax
		invoke	SendMessage,hwnd,WM_SETICON,ICON_SMALL,eax
		pop	eax
		MOV	nid.hIcon,eax
		
		invoke	LoadIcon,dllhinst,offset iconl
		invoke	SendMessage,hwnd,WM_SETICON,ICON_BIG,eax
		
		;prepare to sit in sytem tray
		mov	nid.cbSize,sizeof NOTIFYICONDATA
		m2m	nid.hwnd,hwnd
		mov	nid.uID,25h
		mov	nid.uFlags,NIF_MESSAGE OR NIF_TIP or NIF_ICON
		mov	nid.uCallbackMessage,WM_USER
		invoke  lstrcpy,addr nid.szTip,addr tip 
		
		;get the control handles
		invoke	GetDlgItem,hwnd,IDC_MSG
		mov	hwndrich,eax
		invoke	GetDlgItem,hwnd,IDC_EDIT
		mov	hwndmainrich,eax
		invoke	GetDlgItem,hwnd,IDC_HOSTS
		mov	maincbohwnd,eax
		invoke	SetFocus,hwndrich
		invoke	GetDlgItem,hwnd,IDC_STATUS
		mov	stathwnd,eax
		invoke	GetDlgItem,hwnd,IDSEND
                invoke	EnableWindow,eax,0
		
		;do some initialization and fill the combo box
		invoke 	SendMessage,hwndrich,EM_SETEVENTMASK,0,ENM_CHANGE
		invoke	CreateThread,0,0,offset tproc,0,0,0
		mov	whwnd,eax
		;invoke	GetLastError
		xor	esi,esi
		xor	dl,dl
		.while	dl<inidata.hostindex
			mov	ecx,offset inidata.hosts
			add	ecx,esi
			push	edx
			invoke	SendMessage,maincbohwnd,CB_ADDSTRING,0,ecx
			pop	edx
			add	esi,100
			inc	dl
		.endw
		
		;initialize combo and status bar
		invoke	SendMessage,maincbohwnd,CB_SETCURSEL,0,0	
		invoke	GetClientRect,hwnd,addr rect
		mov	intarray,-1
		mov	intarray+4,-1
		invoke	SendMessage,stathwnd,SB_SETPARTS,1,addr intarray
		
		
                ;dont show if silent flag
                .if	silenceflag==1
                	invoke	Shell_NotifyIcon,NIM_ADD,offset nid
                .endif
                
                ;subclass the richedit control
                invoke	SetWindowLong,hwndmainrich,GWL_WNDPROC,addr mainrichproc
                mov	oldmainproc,eax
		
		
		;mov	cf.cbSize,sizeof cf
                ;mov	cf.dwMask,CFM_COLOR
                ;mov	cf.dwEffects,CFE_BOLD
                ;mov	cf.crTextColor,110
                                
               ; invoke	SendMessage,hwndrich,EM_SETCHARFORMAT,SCF_ALL,addr cf
               ; invoke	SendMessage,hwndmainrich,EM_SETCHARFORMAT,SCF_SELECTION,addr cf

	.elseif umsg==WM_USER
		.if	lparam==WM_RBUTTONDOWN
;			invoke	GetCursorPos,addr pi
;			invoke	SetForegroundWindow,hwnd	;imp corrects bug
;			invoke	TrackPopupMenu,hmenu,TPM_RIGHTALIGN,pi.x,pi.y,0,hwnd,0	
;			invoke  PostMessage,hwnd,WM_NULL,0,0	;imp corrects bug
		.elseif	lparam==WM_LBUTTONDOWN
			invoke	ShowWindow,hwnd,SW_RESTORE
			invoke	SetForegroundWindow,hwnd
			invoke	Shell_NotifyIcon,NIM_DELETE,offset nid
		.endif
	.elseif	umsg==WM_SIZE
		mov	eax,wparam
		.if	eax==SIZE_MINIMIZED
			invoke	Shell_NotifyIcon,NIM_ADD,offset nid
			invoke	ShowWindow,hwnd,SW_HIDE
			
		.endif
		
	.elseif	umsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDEXIT
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
		.elseif	ax==IDM_ABOUT
			invoke	DialogBoxParam,hinst,abtdlg,0,offset abtproc,0
		.elseif	ax==IDM_EXIT
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
		.elseif	ax==IDM_OPTIONS
			invoke	DialogBoxParam,hinst,optdlg,0,offset optproc,0
			
			;since option dialog has been called, re fill the combo box with possibly changed values
			invoke	SendMessage,maincbohwnd,CB_RESETCONTENT,0,0
			xor	esi,esi
			mov	edx,offset inidata.hosts
			xor	ecx,ecx
			.while	cl<inidata.hostindex
				push	edx
				push	ecx
				invoke	SendMessage,maincbohwnd,CB_ADDSTRING,0,edx
				pop	ecx
				pop	edx
				add	edx,100
				inc	cl
			.endw
				
			invoke	SendMessage,maincbohwnd,CB_SETCURSEL,0,0
		.elseif	ax==IDM_CLEAR		;clear the main edit rich contrl
			invoke	SetDlgItemText,hwnd,IDC_EDIT,0
		.elseif	ax==IDM_BUZZ		;funstuff
			invoke	GetWindowRect,hwnd,addr rect
			mov	ecx,rect.right
			sub	ecx,rect.left
			mov	wid,ecx
			mov	edx,rect.bottom
			sub	edx,rect.top
			mov	hit,edx
			
			mov	ecx,0
			.while	ecx<50
				mov	eax,rect.left
				mov	edx,rect.top
				sub	eax,ecx
				add	edx,ecx
				
				
				push	ecx
				invoke	MoveWindow,hwnd,eax,edx,wid,hit,1
				invoke	MoveWindow,hwnd,rect.left,rect.top,wid,hit,1
				pop	ecx
				inc	ecx
			.endw
				
				
			invoke	PlaySound,addr buzzfile,dllhinst,SND_ASYNC or SND_NODEFAULT or SND_RESOURCE
			;;set message through winsock
			
		.elseif	ax==IDSEND	
			;initialize the lines
			mov	hostmsg,0
			mov	hostname,0
			
			
;лллллллллллллллллллллллprepare the command lineлллллллллллллллллллллллллллллллллл			
			
			;get the hostname of sender
			invoke	SendMessage,maincbohwnd,WM_GETTEXT,1024,addr buff
			;display error if empty
			invoke	strlen,addr buff
			.if	eax==0
				invoke	MessageBox,hwnd,offset err6,offset app,0
				ret
			.endif
			;convert to ucase
			invoke	_strupr,addr buff
			
			invoke	strcat,offset cmdline,addr buff
			;attach the host name to command line
			invoke	strcpy,offset hostname,addr buff
			;append the last . to cmdline
			invoke	strcat,offset hostname,offset trail
			
			;get the msg in buff
			invoke	GetDlgItemText,hwnd,IDC_MSG,addr buff,1024
			
			;add a space to the cmdline
			invoke	strcat,offset cmdline,offset space
			;add the message to the commandline
			invoke	strcat,offset cmdline,addr buff

;лллллллллллллллллллллллprepare the messageлллллллллллллллллллллллллллллллллллллл
			
			;prepare the message;;;;;;;;
			;initialize msg with newline
			;invoke	strcpy,offset msg1,offset crlf
			;append the hostname
			invoke	strcpy,offset msg1,offset hostnam	;append hostname
			invoke	strcat,offset msg1,offset colon		;append colon to hostname
			invoke	strcat,offset msg1,addr buff	
			invoke	strcat,offset msg1,offset msgstr	;append 2 newlines at the end
			;;;;;;;;;;;;;;;;;;;
			
			mov 	sat.nLength,sizeof SECURITY_ATTRIBUTES 
	                mov 	sat.lpSecurityDescriptor,NULL 
         	        mov 	sat.bInheritHandle,TRUE 
         	        
         	        invoke 	CreatePipe,addr hRead,addr hWrite,addr sat,NULL 
         	        mov 	startupinfo.cb,sizeof STARTUPINFO 
                    	invoke 	GetStartupInfo,addr startupinfo 
                    	mov 	eax, hWrite 
                   	
                   	mov 	startupinfo.hStdOutput,eax 
                    	mov 	startupinfo.hStdError,eax 
                    	mov 	startupinfo.dwFlags, STARTF_USESHOWWINDOW+ STARTF_USESTDHANDLES 
                    	mov 	startupinfo.wShowWindow,SW_HIDE 
                    	invoke  CreateProcess, NULL, addr cmdline, NULL, NULL, TRUE, NULL, NULL, NULL, addr startupinfo, addr pinfo 

			
         	        invoke 	CloseHandle,hWrite 
                            	invoke RtlZeroMemory,addr buff,1024 
                            	invoke ReadFile,hRead,addr buff,1023,addr bytesRead,NULL 
                            	invoke	strcmp,addr buff,offset success
                            	.if	eax!=0
                            		invoke	MessageBox,hwnd,addr buff,offset app,MB_ICONSTOP
	                        .else
	                        	
					;append msg to the main control
					invoke	SendMessage,hwndmainrich,WM_GETTEXTLENGTH,0,0
					mov	len,eax
					inc	eax
					invoke	SendMessage,hwndmainrich,EM_SETSEL,len,eax
					invoke	SendMessage,hwndmainrich,EM_REPLACESEL,0,offset msg1
					

	                        	;scroll the page automatically
	                        	invoke	SendMessage,hwndmainrich,EM_SCROLL,SB_PAGEDOWN,0
	                        	
	                        	
					;last message selection code
					invoke	SendMessage,hwndmainrich,WM_GETTEXTLENGTH,0,0
					mov	len,eax			;get length of whole
					invoke	strlen,addr msg1	;get length of last
					mov	len1,eax		
					mov	eax,len
					sub	eax,len1		;subtract the length of last msg
					invoke	SendMessage,hwndmainrich,EM_SETSEL,len,eax

;if it selects ,then calculate the msg length and select from len to len-length of message
;amd change the color , no need of subclassing
	                        	
	                        	;clear the msg text field
	                        	invoke	SetDlgItemText,hwnd,IDC_MSG,0
	                        	mov	host,0
	                    		
	                    		;get the hostname and append it to status text and show it in sbar
	                        	invoke	GetDlgItemText,hwnd,IDC_HOSTS,addr buff,1024
	                        	invoke	strcat,offset stat1,addr buff
	                        	invoke	SendMessage,stathwnd,SB_SETTEXT,0,offset stat1
	                        .endif
                .elseif	ax==IDC_MSG
                	shr	eax,16
                	.if	ax==EN_CHANGE
                		invoke	GetDlgItemText,hwnd,IDC_MSG,addr buff,1024
                		invoke	strlen,addr buff
                		.if	eax==0
                			invoke	GetDlgItem,hwnd,IDSEND
                			invoke	EnableWindow,eax,0
                		.else
	                		invoke	GetDlgItem,hwnd,IDSEND
                			invoke	EnableWindow,eax,1
                		.endif
                	.endif
                
		
		.elseif	ax==IDC_EDIT
			shr	eax,16
			.if	ax==EN_SETFOCUS
				invoke	DestroyCaret
			.endif
		.endif
			
				
	.elseif	umsg==WM_CLOSE
		invoke	Shell_NotifyIcon,NIM_DELETE,offset nid
		invoke	TerminateThread,thwnd,0
		invoke	DestroyWindow,hwnd
	.elseif	umsg==WM_USER+100	;notification that message has arrived
		;get the whole text of main edit
		invoke	GetDlgItemText,hwnd,IDC_EDIT,addr buff,1024
		;get the strlen
		lea	esi, buff1
		;point to sender hostname
		add	esi,13
		;search for a space - end of hostname
		push	esi
		invoke	bin,esi,offset space
		pop	esi
		
		mov	pos,eax
		
		mov	eax,esi
		add	eax,pos
		dec	eax
		mov	byte ptr [eax],0
		invoke	strcpy,offset sendnam,esi
		invoke	strcat,offset sendnam,offset colon
		
		lea	esi,buff1
		add	esi,13
		
		invoke	strlen,esi
		
		;search where the first line ends- search for the new line
		invoke	BinSearch,13,offset buff1,eax,offset msgstr,4
		mov	pos,eax
		add	pos,4	;skip the msgstr too
		;append the string following newline to the buff
		mov	ecx,offset buff1
		add	ecx,pos
		;append the sender hostname 
		push	ecx
		invoke	strcat,addr buff,offset sendnam
		pop	ecx
		;append the message and 2 newlines
		invoke	strcat,addr buff,ecx
		invoke	strcat,addr buff,offset msgstr
		
		;set the new text
		invoke	SetDlgItemText,hwnd,IDC_EDIT,addr buff
		;automatically scroll
		invoke	SendMessage,hwndmainrich,EM_SCROLL,SB_PAGEDOWN,0

	.elseif	umsg==WM_DESTROY
		invoke	PostQuitMessage,0
	.else
		mov	eax,0
		ret
	
	.endif
	mov	eax,1
	ret
maindlgproc	endp

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
mainrichproc	proc	hEdit:DWORD,umsg:DWORD,wparam:DWORD,lparam:DWORD 
local	len:dword
		.if	umsg==WM_SETFOCUS
			;invoke	SendMessage,hwndmainrich,WM_GETTEXTLENGTH,0,0
			;mov	len,eax
			;invoke	SendMessage,hwndmainrich,EM_SETSEL,0,len 
			invoke CallWindowProc,oldmainproc,hEdit,umsg,wparam,lparam 
		.elseif	umsg==WM_CHANGECOLOR
			invoke	SendMessage,hwndmainrich,WM_GETTEXTLENGTH,0,0
			mov	len,eax
			sub	eax,2
			invoke	SendMessage,hwndmainrich,EM_SETSEL,0,eax
			;invoke	MessageBox,0,offset app,0,0
		.else
			invoke CallWindowProc,oldmainproc,hEdit,umsg,wparam,lparam 
			ret
		.endif
		xor	eax,eax
		ret
mainrichproc 	endp


;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
enumproc	proc	hwnd:HWND,lparam:LPARAM
local idchild:dword
local rect:RECT
 		invoke	GetWindowLong,hwnd,GWL_ID
 		mov	idchild,eax
 		
 		.if	idchild==IDC_EDIT
 			mov	esi,lparam
 			assume	esi:PTR RECT
 			mov	ecx,[esi].bottom
 			sub	ecx,90h
 			;invoke	GetWin
 			invoke	MoveWindow,hwnd,0,0,[esi].right,ecx,1
	
 		.elseif	idchild==IDC_MSG
 			mov	esi,lparam
 			assume	esi:PTR RECT
 			invoke	GetWindowRect,hwnd,addr rect
 			;invoke	ScreenToClient,mainhwnd,addr rect
 			mov	edx,rect.bottom
 			sub	edx,rect.top	;edx contains the height
 			
 			mov	ecx,[esi].bottom
 			sub	ecx,edx
 			sub	ecx,20
 			
 			mov	eax,[esi].right
 			sub	eax,20
 			;sub	ecx,
 			;sub	[esi].right,20
 			;sub	[esi].bottom,20
 			invoke	MoveWindow,hwnd,rect.left,ecx,eax,edx,1
 
 		
 		.elseif idchild==IDC_STATUS
 			;mov	ecx,[esi].bottom
 			;sub	ecx,20h
 			invoke	GetWindowRect,hwnd,addr rect
 			invoke	MoveWindow,hwnd,rect.left,rect.right,[esi].right,[esi].bottom,1
 		
 		.endif

	mov	eax,1
	ret
enumproc	endp

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
abtproc	proc	hwnd:HWND,umsg:UINT,wparam:WPARAM,lparam:LPARAM
	.if	umsg==WM_CLOSE
		invoke	EndDialog,hwnd,0
	.elseif	umsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDOK
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
		.endif
	.else
		mov	eax,0
		ret
	.endif
	mov	eax,1
	ret
abtproc	endp

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
adddlgproc	proc	hwnd:HWND,umsg:UINT,wparam:WPARAM,lparam:LPARAM
local buffer[100]:byte

	.if	umsg==WM_CLOSE
		invoke	EndDialog,hwnd,0
	.elseif	umsg==WM_INITDIALOG
		invoke	copystruct,offset inidata3,offset inidata1
		
	.elseif	umsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDOK
			invoke	GetDlgItemText,hwnd,IDC_HOST,addr buffer,200
			invoke	strlen,addr buffer
			.if	eax!=0
				xor	eax,eax
				mov	al,inidata3.hostindex
				mov	cx,100
				mul	cx
				lea	edx,inidata3.hosts
				add	edx,eax
				invoke	strcpy,edx,addr buffer
				inc	inidata3.hostindex
			.else
				invoke	MessageBox,hwnd,offset err11,offset app,0
			.endif
			
			invoke	copystruct,offset inidata1,offset inidata3
			
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
		.elseif	ax==IDCANCEL
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
		.elseif	ax==IDC_CHECKCON
		
		.else
			
		.endif
	.else
		mov	eax,0
		ret
	.endif
	mov	eax,1
	ret
adddlgproc	endp

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
optproc	proc	hwnd:HWND,umsg:UINT,wparam:WPARAM,lparam:LPARAM
local count1:byte
local i:dword
local buff3[100]:byte
local count2:dword
	.if	umsg==WM_CLOSE
		invoke	EndDialog,hwnd,0
	.elseif	umsg==WM_INITDIALOG
		invoke	GetDlgItem,hwnd,IDC_HOSTS
		mov	cbohwnd,eax
		invoke	copystruct,offset inidata1,offset inidata
		xor	esi,esi
		xor	dl,dl
		.while	dl<inidata.hostindex
			mov	ecx,offset inidata.hosts
			add	ecx,esi
			push	edx
			invoke	SendMessage,cbohwnd,CB_ADDSTRING,0,ecx
			pop	edx
			add	esi,100
			inc	count1
			inc	dl
		.endw
		
		invoke	SendMessage,cbohwnd,CB_SETCURSEL,0,0	
		
		
	.elseif	umsg==WM_COMMAND
		mov	eax,wparam
		.if	ax==IDOK
			invoke	SendMessage,cbohwnd,CB_GETCOUNT,0,0
			mov	i,eax
			xor	ecx,ecx
			mov	esi,offset inidata.hosts
			xor	edx,edx
			mov	count2,0
			.while	edx<i
				push	edx
				invoke	SendMessage,cbohwnd,CB_GETLBTEXT,count2,addr buff3
				invoke	strcpy,esi,addr buff3
				pop	edx
				add	esi,100
				inc	dl
				inc	count2
			.endw

			mov	edx,i
			mov	inidata.hostindex,dl
			call	writeinifile
			
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
		.elseif	ax==IDCANCEL
			invoke	SendMessage,hwnd,WM_CLOSE,0,0
		.elseif	ax==IDC_HOSTADD
			invoke	DialogBoxParam,hinst,adddlg,hwnd,offset adddlgproc,0
			invoke	SendMessage,cbohwnd,CB_RESETCONTENT,0,0
			xor	esi,esi
			mov	edx,offset inidata1.hosts
			xor	ecx,ecx
			.while	cl<inidata1.hostindex
				push	edx
				push	ecx
				invoke	SendMessage,cbohwnd,CB_ADDSTRING,0,edx
				pop	ecx
				pop	edx
				add	edx,100
				inc	cl
			.endw
				
			invoke	SendMessage,cbohwnd,CB_SETCURSEL,0,0
				
		.elseif	ax==IDC_HOSTDELETE
			
			invoke	SendMessage,cbohwnd,CB_GETCURSEL,0,0
			invoke	SendMessage,cbohwnd,CB_DELETESTRING,eax,0
			mov	i,eax
			invoke	SendMessage,cbohwnd,CB_SETCURSEL,i,0
			.if	eax==CB_ERR
				invoke	SendMessage,cbohwnd,CB_SETCURSEL,0,0
			.endif
		
		.endif
	.else
		mov	eax,0
		ret
	.endif
	mov	eax,1
	ret
optproc	endp

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
wproc proc msg2:DWORD
	invoke	CreateThread,0,0,offset clientproc,0,0,0
	mov	tclient,eax
	invoke	CreateThread,0,0,offset serverproc,0,0,0
	mov	tserver,eax
		
	.while	1
		invoke	WaitForMultipleObjects,2,offset tclient,1,1000
		.if	eax==WAIT_OBJECT_0
			ret
		.else
	
		.endif
	.endw
		
	invoke	CreateThread,0,0,offset tproc,0,0,0
	mov	thwnd,eax

	ret
wproc	endp

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;this procedure writes the lantalk.ini file from inidata structure
writeinifile proc
local	i:dword
	mov	ecx,offset inidata.hosts
	xor	dl,dl
	mov	i,0
	.while	dl<inidata.hostindex
		push	edx
		push	ecx
		invoke	_itoa,i,addr buff2,10
		pop	ecx
		push	ecx
		invoke	WritePrivateProfileString,offset sec1,addr buff2,ecx,offset inifile
		pop	ecx
		pop	edx
		add	ecx,100
		inc	i
		inc	dl
	.endw
	xor	eax,eax
	mov	al,inidata.hostindex
	invoke	_itoa,eax,offset buff2,10
	invoke	WritePrivateProfileString,offset sec1,offset field2,addr buff2,offset inifile

	ret
writeinifile	endp

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;this thread keep scanning for incoming messages
;the messages are of the form
;message from ___ to _____

;message body
tproc proc msg3:DWORD
local mhwnd:DWORD	
local fss:FLASHINFO
	mov	eax,offset buff1
	.while 1
		invoke	FindWindow,offset class,offset wtitle
		.if	eax!=0
			mov	mhwnd,eax
			invoke	FindWindowEx,eax,0,offset wstatic,0
			.if	eax!=0	
				;get the whole message text
				invoke	GetWindowText,eax,addr buff1,1024
				;immediately close
				invoke	SendMessage,mhwnd,WM_CLOSE,0,0
				
				;send the message to main window- message has arrived
				invoke	SendMessage,mainhwnd,WM_USER+100,addr buff1,0
				;play the sound
				invoke	PlaySound,offset wavefile,dllhinst,SND_ASYNC or SND_NODEFAULT or SND_RESOURCE
				
				;react as if the user has clicked the tray icon- to show the main window
				invoke	SendMessage,mainhwnd,WM_USER,0,WM_LBUTTONDOWN
				;invoke	SetForegroundWindow,mainhwnd
				
				;flash the window taskbar - experimental
				mov	fss.cbSize,sizeof fss
				push	mhwnd
				pop	fss.hwnd
				mov	fss.dwFlags,FLASHW_ALL or FLASHW_TIMERNOFG
				mov	fss.uCount,3
				mov	fss.dwTimeout,0
				invoke	FlashWindowEx,addr fss
			.endif
		.endif
		invoke	Sleep,5
	.endw
	ret
tproc	endp

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;procedure to copy the ini structures
copystruct proc dest:dword,src:dword
local i:dword
	mov	eax,src
	mov	ecx,dest
	mov	i,0
	.while i<sizeof INIDATA
		mov	dl,[eax]
		mov	[ecx],dl
		inc	eax
		inc	ecx
		inc	i
	.endw
	ret
copystruct endp
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
serverproc 	proc a:dword
local	socket1:DWORD
local 	clientsocksize:dword
local 	clientsocket:dword
local	buff[1024]:byte

  	mov	cx,4445
	xchg	ch,cl
	
;        mov	port,cx
    	
    	mov     sockad.sin_family, AF_INET  
    	mov     sockad.sin_port, cx
    	mov     sockad.sin_addr.S_un.S_addr,INADDR_ANY
    	
    	invoke	socket,AF_INET,SOCK_STREAM, IPPROTO_TCP
	.if	eax==INVALID_SOCKET
		;invoke	StdOut,offset err1
	;	jmp	exit
	.endif
	mov	socket1,eax
	
	invoke	bind,socket1,offset sockad,sizeof sockad
	.if	eax!=0
		;invoke	StdOut,offset err5
;		jmp	exit
	.endif
	
	invoke	listen,socket1,SOMAXCONN
	.if	eax==SOCKET_ERROR
		;invoke	StdOut,offset err6
	;	jmp	done
	.endif
	
	xor	ecx,ecx
;	mov	cx,port
	xchg	ch,cl
	;invoke	printf,offset waitmsg,ecx
	
	mov	clientsocksize,sizeof clientsockad
	invoke	accept,socket1,offset clientsockad,addr clientsocksize

	.if	eax==INVALID_SOCKET
		;invoke	StdOut,offset err7
	;	jmp	done
	.endif
	mov	clientsocket,eax
	
	invoke	inet_ntoa,clientsockad.sin_addr.S_un.S_addr
;	invoke	printf,offset conn,eax
;	invoke	recv,clientsocket,offset buff,sizeof buff,0



	ret
serverproc	endp

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
clientproc	proc a:dword
	LOCAL socket1:SOCKET
	;LOCAL sockad:sockaddr_in
	mov	cx,4445

	mov     sockad.sin_family, AF_INET  
    	mov     sockad.sin_port, cx
    	mov     sockad.sin_addr.S_un.S_addr,eax
	

	invoke	connect,socket1,offset sockad,sizeof sockad
	.if	eax==SOCKET_ERROR
		;invoke	printf,offset err2,server
	;	jmp	exit
	.endif
	
;	invoke	send,socket1,offset req1,len1,0
	.if	eax==SOCKET_ERROR
		;invoke	StdOut,offset err3
;		jmp	exit
	.endif

;	invoke	recv,socket1,offset buff,127,0
;	jz	done
	.if	eax==SOCKET_ERROR
		;invoke	StdOut,offset err4
	;	jmp	exit
	.endif
	;mov	[buff+eax],0
	;invoke	StdOut,offset buff
	
	ret
clientproc endp


bin proc	source:dword,dest:dword
local flag:dword
	mov	esi,source
	mov	edi,dest
	mov	flag,0
	.while	byte ptr [esi]!=0
		mov	al,byte ptr [edi]
		.if	byte ptr [esi]==al
			mov	flag,1
			inc	edi
		.elseif	al==0
			.break .if	flag==1
		.else
			mov	flag,0
			mov	edi,dest
		.endif
		inc	esi
	.endw
	
	.if	flag==1
		mov	eax,esi
		sub	eax,source
	.else
		mov	eax,-1
	.endif
	ret
bin 	endp
end	start	