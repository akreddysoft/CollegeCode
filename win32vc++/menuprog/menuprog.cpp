#include <windows.h>

HINSTANCE hinst;
int WINAPI WinMain(HINSTANCE hinst,HINSTANCE hinst,LPSTR cmdline,int cmdshow)
{
	::hinst=hinst;
	DialogBoxParam(hinst,MAKEINTRESOURCE(IDD_DIALOG1),0,dlgproc,0);
	return 1;



}


BOOL CALLBACK dlgproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam)
{
static NOTIFYICONDATA nf;

	switch(msg)
	{
	case WM_INITDIALOG:
		nf.cbSize=sizeof(nf);
		nf.hIcon =LoadIcon(0,IDI_APPLICATION);
		nf.hWnd =hwnd;
		nf.uCallbackMessage =WM_USER;
		//ShellNotifyIcon
		






	default:
			return 0;
	}

	return 1;
}
