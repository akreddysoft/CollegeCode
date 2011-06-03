//METHOD 3 through code
#include<windows.h>
#include "resource.h"
LRESULT CALLBACK wndproc (HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam);
char a[]="madhur";
char *b="madur";
HINSTANCE hinst;
int _stdcall WinMain(HINSTANCE hinst,HINSTANCE hprev,LPSTR cmdline,int cmdshow)
{
	::hinst=hinst;
	HWND hwnd;
	WNDCLASSEX wc;
	MSG msg;

	wc.cbClsExtra =0;
	wc.cbSize =sizeof wc;
	wc.cbWndExtra =0;
	wc.hbrBackground =(HBRUSH)(COLOR_WINDOW+1);
	wc.hCursor =LoadCursor(0,IDC_ARROW);
	wc.hIcon =LoadIcon(0,IDI_APPLICATION);
	wc.hIconSm =LoadIcon(0,IDI_APPLICATION);
	wc.hInstance =hinst;
	wc.lpfnWndProc =wndproc;
	wc.lpszMenuName =0;
	wc.lpszClassName ="madhur";
	wc.style =CS_HREDRAW|CS_VREDRAW;

	RegisterClassEx(&wc);
	//HMENU hmenu=LoadMenu(hinst,MAKEINTRESOURCE(IDR_MENU1));
	hwnd=CreateWindowEx(0,"madhur",b,WS_OVERLAPPEDWINDOW,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,0,0,hinst,0);
	ShowWindow(hwnd,SW_SHOWNORMAL);

	HACCEL hac=LoadAccelerators(hinst,MAKEINTRESOURCE(IDR_ACCELERATOR1));
	while(GetMessage(&msg,0,0,0))
	{
		TranslateAccelerator(hwnd,HACCEL(hac),&msg);
		TranslateMessage(&msg);
		DispatchMessage(&msg);
	}

	return msg.wParam ;
}

LRESULT CALLBACK wndproc (HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam)
{
	HDC hdc;
	RECT rc;
	PAINTSTRUCT ps;
	char a;
	HMENU hmenu,sysmenu;
	switch(msg)
	{
	case WM_CREATE:
		CreateWindow("button","create menu",WS_CHILD|WS_VISIBLE,10,10,100,20,hwnd,HMENU(10),hinst,0);
		sysmenu=GetSystemMenu(hwnd,0);
		AppendMenu(sysmenu,MF_STRING,MF_STRING,"DFFD");

		return 0;
	
	case WM_PAINT:
		hdc=BeginPaint(hwnd,&ps);
		GetClientRect(hwnd,&rc);
		DrawText(hdc,"mdf",-1,&rc,DT_CENTER);
		EndPaint(hwnd,&ps);
		return 0;

	case WM_COMMAND:
		if(lparam==0)
		{
			switch(LOWORD(wparam))
			{
			case IDEXIT:
				SendMessage(hwnd,WM_CLOSE,0,0);
				break;

			case IDHELLO:
				MessageBox(hwnd,"hwllo","dfdf",0);
				break;
			case IDKEYM:
				MessageBox(hwnd,"dmmmmmmm","f",0);
				break;

			case IDREXIT:
				MessageBox(hwnd,"Dffd","acc",0);
				break;
			}
		}
		else
		{
			switch(LOWORD(wparam))
			{
			case 10:
				hmenu=LoadMenu(hinst,MAKEINTRESOURCE(IDR_MENU1));
				SetMenu(hwnd,hmenu);
				break;
			}
		}
		
		return 0;
	
	case WM_CHAR:
		hdc=GetDC(hwnd);
		GetClientRect(hwnd,&rc);
		a=wparam;
		DrawText(hdc,LPSTR(&a),1,&rc,0);
		ReleaseDC(hwnd,hdc);
		
	 return 0;

	case WM_LBUTTONDOWN:
		hdc=GetDC(hwnd);
		TextOut(hdc,LOWORD(lparam),HIWORD(lparam),"this is windows programming",30);
		ReleaseDC(hwnd,hdc);
		return 0;
	
	case WM_DESTROY:
		PostQuitMessage(0);
		return 0;

	default:
		return DefWindowProc(hwnd,msg,wparam,lparam);
	}
}

