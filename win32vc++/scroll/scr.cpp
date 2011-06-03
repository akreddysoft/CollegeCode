#include<windows.h>
//#include "resource.h"
LRESULT CALLBACK wndproc (HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam);
char a[]="madhur";
char *b="madur";
int cx,cy,cxc,cyc;
HINSTANCE hinst;
HWND hs1,hs2,hs3,ed1,ed2,ed3,stat1,stat2;
int r,g,bb;
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
	int pos;
	HDC hdc;
	switch(msg)
	{
	case WM_CREATE:
		hs1=CreateWindow("ScrollBar","DFfd",WS_CHILD |WS_VISIBLE,10,30,140,20,hwnd,HMENU(100),hinst,0);
		hs2=CreateWindow("ScrollBar","DFfd",WS_CHILD |WS_VISIBLE,10,70,140,20,hwnd,HMENU(101),hinst,0);
		hs3=CreateWindow("ScrollBar","DFfd",WS_CHILD |WS_VISIBLE,10,100,140,20,hwnd,HMENU(102),hinst,0);
		ed1=CreateWindowEx(WS_EX_CLIENTEDGE,"edit","DFfd",WS_CHILD |WS_VISIBLE,160,30,140,20,hwnd,HMENU(200),hinst,0);
		ed2=CreateWindowEx(WS_EX_CLIENTEDGE,"edit","DFfd",WS_CHILD |WS_VISIBLE,160,70,140,20,hwnd,HMENU(201),hinst,0);
		ed3=CreateWindowEx(WS_EX_CLIENTEDGE,"edit","DFfd",WS_CHILD |WS_VISIBLE,160,100,140,20,hwnd,HMENU(202),hinst,0);
	
		stat1=CreateWindowEx(WS_EX_CLIENTEDGE,"static","DFfd",WS_CHILD |WS_VISIBLE,400,200,540,500,hwnd,HMENU(202),hinst,0);
		SCROLLINFO info;
		info.cbSize =sizeof info;
		info.nPage =10;
		info.fMask =SIF_PAGE;
		SetScrollInfo(hs1,SB_CTL,&info,1);
		SetScrollInfo(hs2,SB_CTL,&info,1);
		SetScrollInfo(hs3,SB_CTL,&info,1);

	//	stat2=CreateWindowEx(WS_EX_CLIENTEDGE,"static","DFfd",WS_CHILD |WS_VISIBLE,100,100,240,200,hwnd,HMENU(202),hinst,0);

		SetScrollRange(hs1,SB_CTL,0,255,0);
		SetScrollRange(hs2,SB_CTL,0,255,0);
		SetScrollRange(hs3,SB_CTL,0,255,0);

		//SetScrollPos(hs1,SB_CTL
		
		return 0;

	case WM_HSCROLL:
		//SendMessage(HWND(lparam),SBM_SETPOS,222,0);
		pos=GetScrollPos(HWND(lparam),SB_CTL);
		
		switch(wparam)
		{

		case			SB_RIGHT:
			pos=256;
			break;

		case SB_LEFT:
			pos=0;
			break;

		case SB_LINERIGHT:
		if(pos<256)
				pos++;	
		else
			pos=256;
				//return 0;
				break;

		case SB_PAGELEFT:
			SCROLLINFO info;
			
			info.cbSize =sizeof info;
			GetScrollInfo(HWND(lparam),SB_CTL,&info);
			if(pos>0)
			pos=max(0,pos-int(info.nPage ));
			break;

		case SB_PAGERIGHT:
			info.cbSize =sizeof info;
			GetScrollInfo(HWND(lparam),SB_CTL,&info);
			if(pos<256)
			pos=min(256,pos+int(info.nPage ));
			break;
		
		case SB_THUMBPOSITION:
			pos=HIWORD(wparam);
			break;
			
		

		case SB_THUMBTRACK:
				pos=HIWORD(wparam);
				break;

		case SB_LINELEFT:
			if(pos>0)
			pos--;
			else
				pos=0;
			break;
		
		}
		SetScrollPos(HWND(lparam),SB_CTL,pos,1);

			if(lparam==long(hs1))
				SetDlgItemInt(hwnd,200,pos,0);
			if(lparam==long(hs2))
				SetDlgItemInt(hwnd,201,pos,0);
			if(lparam==long(hs3))
				SetDlgItemInt(hwnd,202,pos,0);
		
		//RedrawWindow(hwnd,0,0,RDW_ERASE|RDW_INVALIDATE );
			InvalidateRect(stat1,0,1);
		return 0;

	case WM_CTLCOLORSTATIC:
		HBRUSH hbr;
		r=GetScrollPos(hs1,SB_CTL);
		g=GetScrollPos(hs2,SB_CTL);
		bb=GetScrollPos(hs3,SB_CTL);


	
		if(HWND(lparam)==stat1)
		{
				hbr=CreateSolidBrush(RGB(r,g,bb));
			
		}
		return long(hbr);

	case WM_DESTROY:
		PostQuitMessage(0);
		return 0;

	default:
		return DefWindowProc(hwnd,msg,wparam,lparam);
	}
}