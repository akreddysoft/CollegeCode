#include<windows.h>
LRESULT CALLBACK WndProc (HWND hwnd, UINT msg ,WPARAM wparam, LPARAM lparam);
int WINAPI  WinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPSTR     lpCmdLine,
                     int       nCmdShow)
{
 	WNDCLASSEX wc;
	MSG msg;
	HWND hwnd;
	
	wc.cbClsExtra =0;
	wc.cbSize =sizeof (WNDCLASSEX);
	wc.cbWndExtra =0;
	wc.hbrBackground =(HBRUSH)(COLOR_WINDOW+1);
	wc.hCursor =LoadCursor(0,IDC_ARROW);
	wc.hIcon =LoadIcon(NULL,IDI_APPLICATION);
	wc.hIconSm =LoadIcon(NULL,IDI_APPLICATION);
	wc.hInstance =hInstance;
	wc.lpfnWndProc =WndProc;
	wc.lpszClassName ="madhur";
	wc.lpszMenuName =0;
	wc.style =CS_HREDRAW || CS_VREDRAW;
	RegisterClassEx(&wc);
	hwnd =CreateWindowEx(0,"madhur","madhurswindow",WS_OVERLAPPEDWINDOW	,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,0,0,hInstance,0);
	ShowWindow(hwnd,SW_NORMAL);
	
	while(GetMessage(&msg,0,0,0))
	{
		TranslateMessage(&msg);
		DispatchMessage(&msg);
	}

return msg.wParam;
}
	
LRESULT CALLBACK WndProc (HWND hwnd, UINT msg ,WPARAM wparam, LPARAM lparam)
{
	HDC hdc;
	RECT rect;
	PAINTSTRUCT ps;
	switch (msg)
	{

		case WM_DESTROY:
			PostQuitMessage(0);
			break;
		
		case WM_PAINT:
			hdc=BeginPaint(hwnd,&ps);
			GetClientRect(hwnd,&rect);
			DrawText(hdc,"madhur ahuja",-1,&rect,DT_CENTER||DT_SINGLELINE);
			ReleaseDC(hwnd,hdc);
			break;

		default:
		//	MessageBox(0,"ddsf","Ddfsdsf",0);
			return	DefWindowProc(hwnd,msg,wparam,lparam);
		
	}
return 0;

}