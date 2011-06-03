#include "frame.h"

myframe::myframe()
{
		Create(0,"dfdf");
}

LRESULT myframe::trayfunc(WPARAM wparam,LPARAM lparam)
{

	CPoint pt;
	GetCursorPos(&pt);
	
	if(lparam==WM_LBUTTONDOWN )
	{

	SetForegroundWindow();

	tmenu.TrackPopupMenu(TPM_RIGHTALIGN ,pt.x ,pt.y ,this,0);
	SendMessage(WM_NULL);
	}
	if(lparam==WM_LBUTTONDBLCLK)
	{
		dlg.DoModal();
	}
	return 1;
}

int myframe::OnCreate(LPCREATESTRUCT lp)
{

	tmenu.CreatePopupMenu();
	tmenu.AppendMenu(MF_STRING,20,"Exit");
	tmenu.AppendMenu(MF_STRING,21,"Settings");
	//tmenu.AppendMenu(MF_STRING,22,"A");
	nf.cbSize =sizeof nf;
	nf.hIcon =LoadIcon(AfxGetInstanceHandle() ,MAKEINTRESOURCE(IDI_ICON1));
	nf.hWnd =this->m_hWnd;
	nf.uCallbackMessage =WM_USER+50;
	nf.uID =25;
	nf.uFlags =NIF_ICON|NIF_MESSAGE;
	Shell_NotifyIcon(NIM_ADD,&nf);
	return 0;
}


void myframe::OnDestroy()
{
	Shell_NotifyIcon(NIM_DELETE,&nf);
}


void myframe::mclick(WPARAM wparam,LPARAM lparam)
{
	switch(wparam)
	{
	case 20:
	SendMessage(WM_CLOSE);
	break;

	case 21:
	
	dlg.DoModal();
		break;
	}

}
BEGIN_MESSAGE_MAP(myframe,CFrameWnd)
ON_WM_CREATE()
ON_MESSAGE(WM_USER+50,trayfunc)
ON_CONTROL_RANGE(BN_CLICKED,20,22,mclick)
ON_WM_DESTROY()
//ON_BN_CLICKED(20,mclick)
END_MESSAGE_MAP()
