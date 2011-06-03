#include<windows.h>
LRESULT CALLBACK wndproc (HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam);
void draw(HDC hdc) ;

char a[]="madhur";
char *b="madur";
int _stdcall WinMain(HINSTANCE hinst,HINSTANCE hprev,LPSTR cmdline,int cmdshow)
{
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
	HDC hdc;
	RECT rc;
	PAINTSTRUCT ps;
	char a;
	HPEN pos;
	HFONT fn;
	switch(msg)
	{
	case WM_PAINT:
		hdc=BeginPaint(hwnd,&ps);
		GetClientRect(hwnd,&rc);
		pos=CreatePen(PS_DASH,1,RGB(00,100,0));
		SelectObject(hdc,pos);
		
		//CreateBrush
		
		SetTextColor(hdc,RGB(200,200,0));
		fn=CreateFont(24,16,0,0,400,0,0,0,OEM_CHARSET,OUT_DEFAULT_PRECIS,CLIP_DEFAULT_PRECIS,DEFAULT_QUALITY,DEFAULT_PITCH | FF_SCRIPT,"Arial"); 
		SelectObject(hdc,fn);
		
		TextOut(hdc,10,10,"dfdf",4);
		DrawText(hdc,"amdffdfd",-1,&rc,DT_CENTER);
		
		MoveToEx(hdc,0,0,0);
		LineTo(hdc,100,100);

		draw(hdc);
		
		EndPaint(hwnd,&ps);
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

void draw(HDC hdc) 
{
    HPEN hpen, hpenOld;
    HBRUSH hbrush, hbrushOld;

    // Create a green pen.
    hpen = CreatePen(PS_SOLID, 10, RGB(0, 255, 0));
    // Create a red brush.
    hbrush = CreateSolidBrush(RGB(255, 0, 0));

    // Select the new pen and brush, and then draw.
     SelectObject(hdc, hpen);
     SelectObject(hdc, hbrush);
     Rectangle(hdc, 100,100, 200,200);

    // Do not forget to clean up.
    SelectObject(hdc, hpenOld);
    DeleteObject(hpen);
    SelectObject(hdc, hbrushOld);
    DeleteObject(hbrush);
}