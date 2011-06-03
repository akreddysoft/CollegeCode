#include "try.h"

myapp a;


void frame::OnPaint()
{
	PAINTSTRUCT ps;
	CClientDC dc(this);
	BeginPaint(&ps);
	dc.TextOut(pt1.x ,pt1.y ,"madhur");
	//GetCursorPos(&pt1);
	//pt1=dc.GetCurrentPosition();
	dc.TextOut(10,10,char1);
	//dc.SetPixel(pt1.x,pt1.y,RGB(0,0,0));
	EndPaint(&ps);
	
}

void frame::OnCreate()
{
	//frame *p;
	//p=new frame;
	//->MessageBox("madhur");
//essageBox("madhur");
	//eateWindow("button","hellow",0,10,10,100,
//reate("button","hello",0,rectDefault,HWND(a.p->m_hWnd ));
}

void frame::OnLButtonDown(int i,CPoint pt)
{
	pt1.x =pt.x ;
	pt1.y =pt.y ;
	InvalidateRect(0);
	
}



void frame::OnChar(UINT char1,UINT rep,UINT flag)
{
	InvalidateRect(0);
	frame::InvalidateRect(0);
	//::char1=char1;
	frame::char1=char1;
	
}