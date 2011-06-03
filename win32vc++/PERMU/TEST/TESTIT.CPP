#include<windows.h>
#include"resource.h"

BOOL CALLBACK dlgproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam);
int WINAPI WinMain(HINSTANCE hinst,HINSTANCE hprev,LPSTR cmdline,int cmdshow)
{
	DialogBoxParam(hinst,MAKEINTRESOURCE(IDD_DIALOG1),0,dlgproc,0);
	return 0;
}

BOOL CALLBACK dlgproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam)
{
	char buffer[50];
	int result;
	switch(msg)
	{
	case WM_INITDIALOG:
		SetDlgItemText(hwnd,IDC_NAME,"madhur");
		break;


	case WM_COMMAND:
		switch(LOWORD(wparam))
		{
		case IDEXIT:
			SendMessage(hwnd,WM_CLOSE,0,0);
			break;

		case IDOK:
			GetDlgItemText(hwnd,IDC_PASS,buffer,100);
			if(result=strcmp(buffer,"53412")==0)
				MessageBox(hwnd,buffer,buffer,0);
		//	else
		//		MessageBox(hwnd,"invalid","invalid",0);
			break;

		}
		break;

	case WM_CLOSE:
		EndDialog(hwnd,0);
		break;

	default:
		return 0;
	}
	return 1;
}

