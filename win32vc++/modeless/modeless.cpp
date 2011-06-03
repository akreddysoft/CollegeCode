#include<windows.h>
#include "resource.h"
BOOL CALLBACK dlgproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam);

int _stdcall WinMain(HINSTANCE hinst,HINSTANCE hprev,LPSTR cmdline,int cmdshow)
{
	HWND hwnd;
	MSG msg;
	WNDCLASSEX wc;

	wc.cbClsExtra =0;
	wc.cbSize =sizeof wc;
	wc.cbWndExtra =DLGWINDOWEXTRA ;
	wc.hbrBackground =HBRUSH(COLOR_WINDOW+1);
	wc.hCursor =LoadCursor(hinst,IDC_ARROW);
	wc.hIcon =LoadIcon(hinst,IDI_APPLICATION);
	wc.hIconSm =LoadIcon(hinst,IDI_APPLICATION);
	wc.hInstance =hinst;
	wc.lpfnWndProc =WNDPROC(dlgproc);
	wc.lpszClassName ="ahuja";
	wc.lpszMenuName =0;
	wc.style =CS_HREDRAW | CS_VREDRAW;

	RegisterClassEx(&wc);

	hwnd=CreateDialogParam(hinst,MAKEINTRESOURCE(IDD_DIALOG1),0,dlgproc,0);
	ShowWindow(hwnd,SW_SHOWNORMAL);
	while(GetMessage(&msg,0,0,0))
	{
		if(!IsDialogMessage(hwnd,&msg))
		{
		TranslateMessage(&msg);
		DispatchMessage(&msg);
		}
	}

	return msg.wParam ;
}



BOOL CALLBACK dlgproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam)
{
	switch(msg)
	{

	case WM_CREATE:
		MessageBox(hwnd,"Dfdfd","Dfdfdf",0);
		return 0;

	case WM_DESTROY:
		PostQuitMessage(0);
		return 0;

	default:
		return DefWindowProc(hwnd,msg,wparam,lparam);
	}
}