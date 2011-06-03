#include<windows.h>
#include "resource.h"
#define IDI_EXIT 50


HANDLE hd;
NOTIFYICONDATA note;
HMENU hmenu;
HANDLE lhnd,lhnd1;
long count;
long index;
unsigned long tid;
char buffer[50];
//int cmd=SW_HIDE;
BOOL CALLBACK dlgproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam);

int _stdcall WinMain(HINSTANCE hinst,HINSTANCE hprev,LPSTR cmdline,int cmd=SW_HIDE)
{
	MSG msg;
	HWND hwnd;
	WNDCLASSEX wc;
	wc.cbClsExtra =0;
	wc.cbSize =sizeof(wc);
	wc.cbWndExtra =DLGWINDOWEXTRA;
	wc.hbrBackground =HBRUSH(COLOR_WINDOW+1);
	wc.hCursor =LoadCursor(0,IDC_ARROW);
	wc.hIcon =LoadIcon(0,IDI_APPLICATION);
	wc.hIconSm =LoadIcon(0,IDI_APPLICATION);
	wc.hInstance =hinst;
	wc.lpfnWndProc =WNDPROC(dlgproc);
	wc.lpszClassName ="dlgclass";
	wc.lpszMenuName =0;
	wc.style =CS_HREDRAW;

	RegisterClassEx(&wc);

	hwnd=CreateDialogParam(hinst,MAKEINTRESOURCE(IDD_DIALOG1),0,0,0);


	if(!IsDialogMessage(hwnd,&msg))
	{
	while(GetMessage(&msg,0,0,0))
	{
		TranslateMessage(&msg);
		DispatchMessage(&msg);
	}
	}

	return 0;
}



BOOL CALLBACK dlgproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam)
{
	POINT pt;
	switch(msg)
	{
		case WM_CREATE:
		hmenu=CreatePopupMenu();
		AppendMenu(hmenu,MF_STRING,IDI_EXIT,"Exit");
		note.cbSize =sizeof(NOTIFYICONDATA);
			note.hIcon =LoadIcon(0,IDI_APPLICATION);
			note.hWnd =hwnd;
			note.uCallbackMessage =WM_USER+5;
			note.uID =25;
			note.uFlags =NIF_ICON | NIF_MESSAGE;
			Shell_NotifyIcon(NIM_ADD,&note);
		
		
		break;

	

		case WM_SIZE:
				ShowWindow(hwnd,SW_HIDE);
				break;
	

		case WM_COMMAND:
			switch(LOWORD(wparam))
			{
			case IDSTART:
				break;
			}

		break;


		case WM_USER+5:
		if(wparam==25)
		{
			if(lparam==WM_RBUTTONDOWN)
			{
				GetCursorPos(&pt);
				TrackPopupMenu(hmenu,TPM_RIGHTALIGN,pt.x,pt.y,0,hwnd,0);
			}
			if(lparam==WM_LBUTTONDBLCLK)
			{
				ShowWindow(hwnd,SW_RESTORE);
			}
		}
		break;


		case WM_CLOSE:
			PostQuitMessage(0);
			Shell_NotifyIcon(NIM_DELETE,&note);
			break;

		default:
			return(DefDlgProc(hwnd,msg,wparam,lparam));
	}
	return 0;

}