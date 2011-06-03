#include<windows.h>
#include "resource.h"
BOOL CALLBACK dlgproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam);
HINSTANCE hinst;
int WINAPI WinMain(HINSTANCE hinst,HINSTANCE hprev,LPSTR cmdline,int cmdshow)
{
	::hinst=hinst;
	DialogBoxParam(hinst,LPSTR(101),0,dlgproc,0);
	return 0;
}

BOOL CALLBACK dlgproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam)
{
	int errno;
	char errmsg[256];
	HICON hicon;
	HWND dlghwnd;
	switch(msg)
	{
	case WM_INITDIALOG:
		hicon=LoadIcon(hinst,MAKEINTRESOURCE(IDI_ICON1));
		SendMessage(hwnd,WM_SETICON,ICON_SMALL,LPARAM(hicon));
		SendMessage(hwnd,WM_SETICON,ICON_BIG,LPARAM(hicon));
		dlghwnd=GetDlgItem(hwnd,IDC_NO1);
		SendMessage(dlghwnd,EM_LIMITTEXT,4,0);
		return 1;
	
	
	case WM_COMMAND:
		switch(LOWORD(wparam))
		{
		case IDC_NO1:
			if(HIWORD(wparam)==EN_CHANGE)
			{
				errno=GetDlgItemInt(hwnd,IDC_NO1,0,0);
				if(FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM,0,errno,LANG_SYSTEM_DEFAULT,errmsg,256,0))
					SetDlgItemText(hwnd,IDC_ERROR,errmsg);
				else
					SetDlgItemText(hwnd,IDC_ERROR,"Error Code not found");
			}
			break;

		case IDC_ABOUT:
			MessageBox(hwnd,"Error Show\n\nWritten By Madhur in VC++.\nEmail any bugs to madhur_ahuja@yahoo.com","Error Show",MB_ICONERROR);
			break;
		}
		return 1;


	case WM_CLOSE:
		EndDialog(hwnd,0);
		return 1;

	default:
		return 0;
	}

}