#include<windows.h>
#include "mess.h"
#include "resource.h"

BOOL CALLBACK dlgproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam);
int init();
struct message msg[100];
int _stdcall WinMain(HINSTANCE hinst,HINSTANCE hprev,LPSTR cmdline,int cmdshow)
{
	init();
	DialogBoxParam(hinst,MAKEINTRESOURCE(IDD_DIALOG1),0,dlgproc,0);
	return 0;
}

BOOL CALLBACK dlgproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam)
{
	int res,hwn,wpar,lpar;
	char wp[20],lp[20];
	int mssg;
	int wf,lf;
	switch(msg)
	{
	case WM_CREATE:
			res=IsDlgButtonChecked(hwnd,IDC_RWPARAM);
			if(res==BST_CHECKED)
			{
				MessageBox(hwnd,"Dfdf","dffd",0);
				//wpar=GetDlgItemInt(hwnd,IDC_EWPARAM,0,0);
				//wf=1;
			}
			else
				MessageBox(hwnd,"Dfdf","dfdf",0);
	
	case WM_COMMAND:
		switch(LOWORD(wparam))
		{
		case IDOK:
			SendMessage(hwnd,WM_CLOSE,0,0);
			break;
			
		
		case IDC_RWPARAM:
			res=IsDlgButtonChecked(hwnd,IDC_RWPARAM);
			if(res==BST_CHECKED)
			{
				MessageBox(hwnd,"Dfdf","dffd",0);
				//wpar=GetDlgItemInt(hwnd,IDC_EWPARAM,0,0);
				//wf=1;
			}
			else
				MessageBox(hwnd,"Dfdf","dfdf",0);
			break;

		case IDC_SEND:
			res=IsDlgButtonChecked(hwnd,IDC_WPARAM);
			if(res==BST_CHECKED)
			{
				wpar=GetDlgItemInt(hwnd,IDC_EWPARAM,0,0);
				wf=1;
			}
			else
			{
				GetDlgItemText(hwnd,IDC_EWPARAM,wp,20);
				wf=0;
			}
		
			
			res=IsDlgButtonChecked(hwnd,IDC_LPARAM);
			if(res==BST_CHECKED)
			{
				lf=1;
				lpar=GetDlgItemInt(hwnd,IDC_ELPARAM,0,0);
			}
			else
			{
				lf=0;
				GetDlgItemText(hwnd,IDC_ELPARAM,lp,20);
			}

			
			hwn=GetDlgItemInt(hwnd,IDC_HWND,0,0);
			msg=12;

			if(wf&&lf)
				SendMessage(HWND(hwn),12,wpar,lpar);
			else
				if(wf&&!lf)
					SendMessage(HWND(hwn),12,wpar,LPARAM(&lp));
				else
					if(!wf&&lf)
						SendMessage(HWND(hwn),12,WPARAM(&wp),LPARAM(lpar));
					else
						SendMessage(HWND(hwn),12,WPARAM(&wp),LPARAM(&lp));
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


int init()
{
	msg[0].id =1;
//	msg[0].name ="WM_CREATE"
	msg[1].id =0xc;
//	msg[1].name ="WM_SETTEXT";
	msg[2].id =0xd;
	//msg[2].name ="WM_GETTEXT";
	return 0;
}
