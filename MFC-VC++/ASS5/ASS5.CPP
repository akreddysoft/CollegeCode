#include "ass5.h"
myapp app;


int myframe::OnCreate(LPCREATESTRUCT lp)
{
	SetTimer(10,1000,0);
	CClientDC dc(this);
	dc.SetBkMode(TRANSPARENT);
	dc.SetBkColor(RGB(0,0,0));
	return 1;
}

void myframe::OnTimer(UINT event)
{

	CFont ff;

	char hour[10],min[10],sec[10];
	SYSTEMTIME sm;
	GetLocalTime(&sm);
	_itoa(sm.wHour,hour,10);
	_itoa(sm.wMinute,min,10);
	_itoa(sm.wSecond,sec,10);
	
	RECT rc;
	GetClientRect(&rc);

	ff.CreatePointFont(480,"Arial");
	CClientDC dc(this);

	dc.SetTextColor(RGB(00,200,00));
	dc.SetBkColor(RGB(0,0,0));
	dc.SelectObject(ff);
	dc.TextOut(rc.right /2 -200,rc.bottom /2,hour);
	dc.TextOut(rc.right /2 -50,rc.bottom /2,":");
	dc.TextOut(rc.right/2 ,rc.bottom /2,min);
	dc.TextOut(rc.right /2 +150,rc.bottom /2,":");
	dc.TextOut(rc.right/2 +200,rc.bottom /2,sec);

}

BEGIN_MESSAGE_MAP(myframe,CFrameWnd)
	ON_WM_CREATE()
	ON_WM_TIMER()
END_MESSAGE_MAP()