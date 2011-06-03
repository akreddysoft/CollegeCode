#include<windows.h>
#include<Tlhelp32.h>
#include<E:\programming\win32vc\tsrlike\resource.h>

HANDLE hd;
PROCESSENTRY32 ps;
NOTIFYICONDATA note;
HMENU hmenu;
HANDLE lhnd,lhnd1;
long count;
long index;
unsigned long tid;
char buffer[50];

BOOL CALLBACK dlgproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam);
unsigned long WINAPI tproc(void *);

int WINAPI WinMain(HINSTANCE hinst,HINSTANCE hprev,LPSTR cmdline,int cmdshow)
{
	
	DialogBoxParam(hinst,MAKEINTRESOURCE(IDD_PROCESS),0,dlgproc,0);
	return 0;
}


BOOL CALLBACK dlgproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam)
{
	POINT pt;
	long result;
	
	switch(msg)
	{
	case WM_INITDIALOG:
	hmenu=CreatePopupMenu();
	AppendMenu(hmenu,MF_STRING,IDI_EXIT,"Exit");
	
	
	hd=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
	ps.dwSize =sizeof(PROCESSENTRY32);
	Process32First(hd,&ps);
	lhnd=GetDlgItem(hwnd,IDC_LIST1);
	lhnd1=GetDlgItem(hwnd,IDC_LIST2);
	SendMessage(HWND(lhnd),LB_ADDSTRING,0,LPARAM(ps.szExeFile) );
	while(Process32Next(hd,&ps))
		SendMessage(HWND(lhnd),LB_ADDSTRING,0,LPARAM(ps.szExeFile) );
	
	CreateThread(0,0,tproc,0,0,&tid);
	break;
	
	case WM_SIZE:
		if(wparam==SIZE_MINIMIZED)
		{

			note.cbSize =sizeof(NOTIFYICONDATA);
			note.hIcon =LoadIcon(0,IDI_APPLICATION);
			note.hWnd =hwnd;
			note.uCallbackMessage =WM_USER+5;
			note.uID =25;
			note.uFlags =NIF_ICON | NIF_MESSAGE;
			Shell_NotifyIcon(NIM_ADD,&note);
			ShowWindow(hwnd,SW_HIDE);
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

	case WM_COMMAND:
			switch(LOWORD(wparam))
			{
			case IDI_EXIT:
				SendMessage(hwnd,WM_CLOSE,0,0);
				break;
			
			case IDC_EXIT:
				SendMessage(hwnd,WM_CLOSE,0,0);
				break;
			
			case IDC_REFRESH:
					count=SendMessage(HWND(lhnd),LB_GETCOUNT,0,0);
					while(SendMessage(HWND(lhnd),LB_DELETESTRING,--count,0))
				
					hd=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
					Process32First(hd,&ps);
					lhnd=GetDlgItem(hwnd,IDC_LIST1);
					SendMessage(HWND(lhnd),LB_ADDSTRING,0,LPARAM(ps.szExeFile) );
					while(Process32Next(hd,&ps))
						SendMessage(HWND(lhnd),LB_ADDSTRING,0,LPARAM(ps.szExeFile) );
				break;

			case IDC_ADD:
					index=SendMessage(HWND(lhnd),LB_GETCURSEL,0,0);
					SendMessage(HWND(lhnd),LB_GETTEXT,index,LPARAM(buffer));
					result=SendMessage(HWND(lhnd1),LB_FINDSTRINGEXACT,-1,LPARAM(buffer));
					if(result==LB_ERR)
						SendMessage(HWND(lhnd1),LB_ADDSTRING,0,LPARAM(buffer));					
					else
						MessageBox(hwnd,"App already exits","Dialog",0);
					break;

			case IDC_REMOVE:
					index=SendMessage(HWND(lhnd1),LB_GETCURSEL,0,0);
					if(index==LB_ERR)
						MessageBox(hwnd,"Select an item first","dialog",0);
					else
					{
						SendMessage(HWND(lhnd1),LB_DELETESTRING,index,0);
					}
					break;
			case IDOK:
					//code for saving list
					SendMessage(hwnd,WM_SIZE,SIZE_MINIMIZED,0);
					break;

			
			}
	break;
	
	case WM_CLOSE:
			EndDialog(hwnd,0);
			Shell_NotifyIcon(NIM_DELETE,&note);
			break;

	default:
		return 0;
	}	

	return 1;
}


unsigned long WINAPI tproc(void *)
{
	char *buffer[100];
	long count,i=0,result;
	while(1){
	count=SendMessage(HWND(lhnd1),LB_GETCOUNT,0,0);
	if(count!=0)
	{

	while(i<count-1)
		SendMessage(HWND(lhnd1),LB_GETTEXT,i,LPARAM(buffer[i++]));
	
	result=SendMessage(HWND(lhnd),LB_FINDSTRINGEXACT,-1,LPARAM(buffer[0]));
	if(result==LB_ERR)
	///					SendMessage(HWND(lhnd1),LB_ADDSTRING,0,LPARAM(buffer));					
	MessageBox(0,"blocked process is running","dfdf",0);
}}
	return 0;
}
