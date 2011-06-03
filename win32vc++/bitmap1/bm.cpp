#include<windows.h>
#include "resource.h"
LRESULT CALLBACK wndproc (HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam);
char a[]="madhur";
char *b="madur";
int cx,cy,cxc,cyc;
HINSTANCE hinst;
int _stdcall WinMain(HINSTANCE hinst,HINSTANCE hprev,LPSTR cmdline,int cmdshow)
{
	HWND hwnd;
	WNDCLASSEX wc;
	MSG msg;
	::hinst=hinst;
	wc.cbClsExtra =0;
	wc.cbSize =sizeof wc;
	wc.cbWndExtra =0;
	wc.hbrBackground =(HBRUSH)(COLOR_WINDOW+1);
	wc.hCursor =LoadCursor(0,IDC_ARROW);
	wc.hIcon =LoadIcon(0,IDI_APPLICATION);
	wc.hIconSm =LoadIcon(0,IDI_APPLICATION);
	wc.hInstance =hinst;
	wc.lpfnWndProc =wndproc;
	wc.lpszMenuName ="ahuja";
	wc.lpszClassName ="madhur";
	wc.style =CS_HREDRAW|CS_VREDRAW;

	RegisterClassEx(&wc);

	hwnd=CreateWindowEx(0,"madhur",b,WS_OVERLAPPEDWINDOW,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,0,0,hinst,0);
	ShowWindow(hwnd,SW_SHOWNORMAL);

	while(GetMessage(&msg,0,0,0))
	{
		TranslateMessage(&msg);
		DispatchMessage(&msg);
	}

	return msg.wParam ;
}

LRESULT CALLBACK wndproc (HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam)
{
	HDC hdcc,hdcw,hdcm;
	RECT rc;
	PAINTSTRUCT ps;
//	int x,y;
	int i,j;
	HBITMAP hb;
//	char a;
	switch(msg)
	{
	case WM_CREATE:
		cx=GetSystemMetrics(SM_CXSIZEFRAME)+GetSystemMetrics(SM_CXSIZE);
		cy=GetSystemMetrics(SM_CYSIZEFRAME)+GetSystemMetrics(SM_CYSIZE);
		return 0;


	case WM_SIZE:
		cxc=LOWORD(lparam);
		cyc=HIWORD(lparam);
		GetClientRect(hwnd,&rc);
		return 0;

	case WM_PAINT:
		hdcc=BeginPaint(hwnd,&ps);
		hdcw=GetWindowDC(hwnd);
		
		hdcm=CreateCompatibleDC(hdcc);
		hb=LoadBitmap(hinst,MAKEINTRESOURCE(IDB_BITMAP2));
		SelectObject(hdcm,hb);
		GetClientRect(hwnd,&rc);
		/*for(i=0;i<rc.right ;i=i+64)
		{
			for(j=0;j<rc.bottom ;j=j+64)
			{
			BitBlt(hdcc,i,j,64,64,hdcm,0,0,SRCCOPY);
			
		}}*
////////////////////////////////////
		
		/*for(i=0;i<cyc;i=i+cy)
		{
			for(j=0;j<cxc;j=j+cx)
			{
				BitBlt(hdcc,j,i,cx,cy,hdcw,0,0,SRCCOPY);
			}
		}*/
/////////////////////////////////////
	//	CreateBitmap(64,64,5,8,



		ReleaseDC(hwnd,hdcw);
		EndPaint(hwnd,&ps);
		return 0;

	
	case WM_DESTROY:
		PostQuitMessage(0);
		return 0;

	default:
		return DefWindowProc(hwnd,msg,wparam,lparam);
	}
}