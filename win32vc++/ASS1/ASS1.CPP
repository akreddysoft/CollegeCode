#include<windows.h>
#define BUTTONID 100
#include<math.h>

LRESULT CALLBACK wndproc(HWND hwnd,UINT msg,WPARAM wparam ,LPARAM lparam);
HINSTANCE hinst;
HWND buthwnd,edhwnd,edhwnd1;

int _stdcall WinMain(HINSTANCE hinstance ,HINSTANCE hprev,LPSTR cmdline,int cmdshow)
{
	hinst=hinstance;
	WNDCLASSEX wc;
	MSG msg;
	HWND hwnd;
	wc.cbClsExtra =0;
	wc.cbSize =sizeof(wc);
	wc.cbWndExtra =0;
	wc.hbrBackground =HBRUSH(COLOR_BTNFACE+1);
	wc.hCursor =LoadCursor(0,IDC_ARROW);
	wc.hIcon =LoadIcon(0,IDI_APPLICATION);
	wc.hIconSm =LoadIcon(0,IDI_APPLICATION);
	wc.hInstance =hinstance;
	wc.lpfnWndProc =wndproc;
	wc.lpszClassName ="ahuja";
	wc.lpszMenuName =0;
	wc.style =CS_HREDRAW|CS_VREDRAW;

	RegisterClassEx(&wc);

	hwnd=CreateWindowEx(WS_EX_CLIENTEDGE,"ahuja","madhur",WS_OVERLAPPEDWINDOW,100,100,200,200,0,0,hinstance,0);
	ShowWindow(hwnd,SW_SHOWMAXIMIZED);

	while(GetMessage(&msg,0,0,0))
	{
		TranslateMessage(&msg);
		DispatchMessage(&msg);

	}

	return msg.wParam ;
}

LRESULT CALLBACK wndproc(HWND hwnd,UINT msg,WPARAM wparam ,LPARAM lparam)
{
	static int cx,cy;
	PAINTSTRUCT ps;
	HDC hdc;
	char amp[10],freq[10];
	long ampl,fq;
	double y,i;
 
	switch(msg)
	{
	case WM_CREATE:
		buthwnd=CreateWindowEx(0,"button","Draw Wave",WS_CHILD | WS_VISIBLE,900,10,100,20,hwnd,HMENU(100),hinst,0);
		edhwnd=CreateWindowEx(WS_EX_CLIENTEDGE,"edit","amplitude",WS_CHILD | WS_VISIBLE | ES_NUMBER,100,10,100,20,hwnd,HMENU(101),hinst,0);
		edhwnd1=CreateWindowEx(WS_EX_CLIENTEDGE,"edit","frequeny",WS_CHILD | WS_VISIBLE | ES_NUMBER,500,10,100,20,hwnd,HMENU(102),hinst,0);
		break;

	case WM_SIZE:
		cx=LOWORD(lparam);
		cy=HIWORD(lparam);
		break;

	case WM_COMMAND:
		if(LOWORD(wparam)==100)
		  InvalidateRect(hwnd,0,1);
		break;

	case WM_PAINT:
		hdc=BeginPaint(hwnd,&ps);
		MoveToEx(hdc,0,cy/2,0);
		LineTo(hdc,cx,cy/2);

		GetWindowText(edhwnd,amp,10);
		GetWindowText(edhwnd1,freq,10);
		ampl=atoi(amp);
		fq=atoi(freq);
		ampl=ampl*(-1);
		for(i=0;i<cx;i=i+0.5)
		{
			  y=ampl*sin(2*3.14*fq*i);
		 	  SetPixel(hdc,i,cy/2-y,RGB(0,0,0));		
		}
		EndPaint(hwnd,&ps);
		break;

	case WM_DESTROY:
		PostQuitMessage(0);
		break;

	default:
		return(DefWindowProc(hwnd,msg,wparam,lparam));

	}
	return 0;
}




