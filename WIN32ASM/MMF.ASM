
;--------------------------------------------------------------------------
;                     mmf1.asm (compile using tasm32)
;--------------------------------------------------------------------------
.386
.model	flat,stdcall
option 	casemap:none
.nolist
include	windows.inc
include	kernel32.inc
include user32.inc
include masm32.inc
.listall
includelib masm32.lib
includelib user32.lib
includelib kernel32.lib
  DlgProc PROto hWP:HWND, message:UINT, wparam:WPARAM, lparam:LPARAM
.data

IDD_DIALOG1  equ                   101
IDI_ICON1    equ                   102
IDC_BUTTON1  equ                   1000
IDC_BUTTON2  equ                   1001
IDC_EDIT1    equ                   1002
IDC_STATIC   equ                   -1

rect		RECT <?>
ps              PAINTSTRUCT <?>
hInstance	dd ?
hwnd		dd ?
height          dd ?
width1           dd ?
s_height        dd ?
s_width         dd ?
szObjectName    db 'mmfobject',0
szRetData       db 1000h dup (0)
szDataSize      dd ?
szNewInst       db 'Open a new instance now!',0
.code

start:
	
	
        invoke GetModuleHandle, 0
        mov hInstance, eax

        invoke DialogBoxParam, hInstance, IDD_DIALOG1, 0, offset DlgProc, 0
        invoke ExitProcess, 0

        DlgProc PROC hWP:HWND, message:UINT, wparam:WPARAM, lparam:LPARAM
	
        LOCAL hDW:HWND
        LOCAL hwndChild:HWND
        LOCAL hFile:HANDLE
        LOCAL hFileMapping:HANDLE
        LOCAL lpMappedObject:dword

        .IF message==WM_PAINT

        call      paint

        .ELSEIF message==WM_COMMAND

        call      command

        .ELSEIF message==WM_INITDIALOG

        call      initdlg

        .ELSEIF message==WM_DESTROY

        call      destroy

        .ENDIF

	xor eax, eax
        ret 

paint:

        invoke BeginPaint, hWP, offset ps
 
        invoke EndPaint, hWP, offset ps
	
        mov eax, 0
	
        ret
	
command:

        cmp wparam, IDC_BUTTON1
        jz map
        cmp wparam, IDC_BUTTON2
        jz retrieve
        cmp wparam, IDCANCEL
        jz destroy

        mov eax, 0
        ret

map:
        invoke GetDlgItemTextA, hWP, IDC_EDIT1, offset szRetData, 40h
        lea     edi, [szRetData]
        xor     eax, eax
        or      ecx, -1
        repnz   scasb
        not     ecx
        sub     edi, ecx
        mov     szDataSize, ecx
        cmp     [szRetData], 0
        jnz     _map

        xor eax, eax
        ret

_map:

        invoke CreateFileMappingA, INVALID_HANDLE_VALUE, 0, PAGE_READWRITE, \
        0, 1000h, offset szObjectName
        mov     hFileMapping, eax

        invoke MapViewOfFile, hFileMapping, FILE_MAP_ALL_ACCESS, 0, 0, 1000h
        mov lpMappedObject, eax

        invoke GetDlgItem, hWP, IDC_BUTTON2
        mov hwndChild, eax
        invoke EnableWindow, hwndChild, TRUE

        xor      ecx, ecx
        mov      ecx, szDataSize
        lea      esi, [szRetData]
        mov      edi, lpMappedObject
        rep      movsb

        invoke GetDlgItem, hWP, IDC_BUTTON1
        mov hwndChild, eax
        invoke EnableWindow, hwndChild, FALSE
        invoke SetDlgItemTextA, hWP, IDC_EDIT1, offset szNewInst

        ret

retrieve:

        invoke OpenFileMappingA, FILE_MAP_ALL_ACCESS, TRUE, \
        offset szObjectName
        mov     hFileMapping, eax
        invoke MapViewOfFile, hFileMapping, FILE_MAP_ALL_ACCESS, 0, 0, 1000h
        mov     lpMappedObject, eax
        invoke SetDlgItemTextA, hWP, IDC_EDIT1, lpMappedObject

        ret
        
initdlg:

        invoke OpenFileMappingA, FILE_MAP_ALL_ACCESS, TRUE, \
        offset szObjectName
        cmp     eax, NULL
        jnz     another_instance
 
        invoke GetDlgItem, hWP, IDC_BUTTON2
        mov hwndChild, eax
        
        invoke EnableWindow, hwndChild, FALSE
        jmp Sk_Button

another_instance:

        invoke GetDlgItem, hWP, IDC_BUTTON1
        mov hwndChild, eax
    
        invoke EnableWindow, hwndChild, FALSE

Sk_Button:


        invoke GetSystemMetrics, SM_CXFULLSCREEN
        mov s_width, eax

        invoke GetSystemMetrics, SM_CYFULLSCREEN
        mov s_height, eax
        
        invoke GetWindowRect, hWP, offset rect

        mov eax, rect.rc_bottom
        sub eax, rect.rc_top
        mov height, eax

        mov eax, rect.rc_right
        sub eax, rect.rc_left
        mov width1, eax

        mov eax, s_width
        sub eax, width1
        shr eax, 01h
        mov s_width, eax

        mov eax, s_height
        sub eax, height
        shr eax, 01h
        mov s_height, eax

        invoke MoveWindow, hWP, s_width, s_height, width1, height, FALSE

        ret

destroy:

        invoke UnmapViewOfFile, lpMappedObject
        invoke CloseHandle, hFileMapping
        invoke EndDialog, hWP, 0

        ret
	
        DlgProc endp
                	
	end	start