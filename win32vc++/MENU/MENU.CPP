#include<windows.h>
#include <E:\programming\win32vc\menu\resource.h>
LRESULT CALLBACK WndProc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam);
char *a="I am learning Win32 Programming";
int x,y;
HINSTANCE hinstance;
int WINAPI WinMain(HINSTANCE hinst,HINSTANCE hprev,LPSTR cmdline,int cmdshow)
{
	

	hinstance=hinst;
	WNDCLASSEX wc;
	MSG msg;
	HWND hwnd;
	wc.cbClsExtra =0;
	wc.cbSize =sizeof(WNDCLASSEX);
	wc.cbWndExtra =0;
	wc.hbrBackground =HBRUSH(COLOR_WINDOW+1);
	wc.hCursor =LoadCursor(0,IDC_ARROW);
	wc.hIcon =LoadIcon(0,IDI_APPLICATION);
	wc.hIconSm =LoadIcon(0,IDI_APPLICATION);
	wc.hInstance =hinst;
	wc.lpfnWndProc =WndProc;
	wc.lpszClassName ="ahuja";
	wc.lpszMenuName =MAKEINTRESOURCE(IDR_MENU1);
	wc.style =CS_HREDRAW;

	RegisterClassEx(&wc);
	hwnd=CreateWindowEx(0,"ahuja","madhur",WS_OVERLAPPEDWINDOW,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,0,0,hinst,0);
	ShowWindow(hwnd,SW_SHOWNORMAL);

	while(GetMessage(&msg,0,0,0))
	{
		TranslateMessage(&msg);
		DispatchMessage(&msg);
	}

	return msg.wParam ;
}

LRESULT CALLBACK WndProc(HWND hWnd,UINT msg1,WPARAM wparam,LPARAM lparam)
{
//	HDC hdc;
	HMENU menuhwnd;
	switch(msg1)
	{

	case WM_COMMAND:
		switch(LOWORD(wparam))
		{
		case IDHI:
			MessageBox(hWnd,"madhur","ahuja",0);
			break;

		case IDCHANGE:
			menuhwnd=LoadMenu(hinstance,MAKEINTRESOURCE(IDR_MENU2));
			SetMenu(hWnd,menuhwnd);
			break;
		}
		break;
	
	case WM_DESTROY:
		PostQuitMessage(0);
		break;

	default:
		return(DefWindowProc(hWnd,msg1,wparam,lparam));
	}

	return 0;
}























