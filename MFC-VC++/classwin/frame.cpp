#include "frame.h"
#include "resource.h"
#include "math.h"

BEGIN_MESSAGE_MAP(myframe,CFrameWnd)
	ON_WM_CONTEXTMENU()
	ON_WM_CREATE()
	ON_BN_CLICKED(500,m1)
	ON_WM_PAINT()
END_MESSAGE_MAP()

CRect rc;
int myframe::OnCreate(LPCREATESTRUCT lp)
{
	//m.CreateMenu();
	m.CreatePopupMenu();
	m.AppendMenu(0,500,"Dffd");
	m.AppendMenu(0,501,"Dffd");
	m.AppendMenu(0,502,"Dffd");
	m.AppendMenu(0,503,"Dffd");
	HICON ic;
	ic=LoadIcon(HINSTANCE(0x400000),MAKEINTRESOURCE(IDI_ICON1));
	SetIcon(ic,1);
	//SetMenu(&m);
	return 0;
}
void myframe::OnContextMenu(CWnd *p,CPoint p1)
{
	m.TrackPopupMenu(MF_STRING,p1.x,p1.y,p);
}

CBitmap bm;

void myframe::m1()
{
//CBitmap bm;
	CFileDialog g1(0);
	g1.DoModal();
	MessageBox(g1.GetFileName());

	

/*bm.LoadBitmap(IDB_BITMAP1);
	m.AppendMenu(MF_STRING,600,"dfdfDFfsd");
m.AppendMenu(MF_BITMAP,601,&bm);*/

}


void myframe::OnPaint()
{
	
	CPaintDC dc(this);
	GetClientRect(rc);
	for(i=0;i<rc.right ;i=i+0.5)
	{
		y=80*sin(3.14*i*2*20);
		dc.SetPixel(i,rc.bottom/2 -y,RGB(0,0,0));
	}
}