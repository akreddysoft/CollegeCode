#include "frame.h"


BEGIN_MESSAGE_MAP(myframe,CFrameWnd)
ON_WM_HSCROLL()
ON_WM_CREATE()
ON_WM_CTLCOLOR()
END_MESSAGE_MAP()


int myframe::OnCreate(LPCREATESTRUCT lp)
{
	sl1.Create(WS_CHILD | WS_VISIBLE ,CRect(000,100,400,200),this,303);
	sl1.SetScrollRange(0,256);
	SetScrollRange(SB_VERT,0,256);

	SCROLLINFO info;
	info.nPage =10;
	info.cbSize =sizeof info;
	info.fMask =SIF_PAGE;
	sl1.SetScrollInfo(&info);

	e1.CreateEx(WS_EX_CLIENTEDGE,"edit","DFFD",WS_CHILD | WS_VISIBLE,CRect(300,300,400,400),this,300);

	return 0;
}


void myframe::OnHScroll(UINT code,UINT pos,CScrollBar *sb)
{
/* DO NOT DO HERE IF(*sb==s1) because sb can be null if msg came from windows scroll bar
	hence derefrenceing it can crash.
	instead get the id by using getdlgitem and then compare the id with the manually created
	scroll bar*/

	if(sb!=0)   //check if the message came from the windows scroll bar
	{

	if(303==::GetDlgCtrlID(sb->m_hWnd ))
	{
	
	x=sb->GetScrollPos();
	switch(code)
	{
	case SB_LEFT:
		//Scroll to far left. 
		x=0;
		break;

	case SB_LINELEFT:
		//Scroll left. 
		if(x>0)
		x=x-1;
		break;

	case SB_LINERIGHT:
		//Scroll right. 
		if(x<256)
		x++;
		break;
	
	case SB_PAGELEFT:
		//Scroll one page left. 
// Get the page size. 
      SCROLLINFO   info;
      sb->GetScrollInfo(&info, SIF_ALL);
   
      if (x > 0)
      x = max(0, x - (int) info.nPage);

		break;

	case SB_PAGERIGHT:
		//Scroll one page right. 
	
		 // Get the page size. 

      sb->GetScrollInfo(&info, SIF_ALL);

      if (x < 256)
         x = min(256, x + (int) info.nPage);
		break;

	case SB_RIGHT:
		//Scroll to far right. 
		x=256;
		break;

	case SB_THUMBPOSITION:
		//Scroll to absolute position. The current position is specified by the nPos parameter. 
		x=pos;
		break;

	case SB_THUMBTRACK:
		//Drag scroll box to specified position. The current position is specified by the nPos parameter. 
		x=pos;
		break;
	
		}
	//SetScrollPos(SB_CTL,x); this is wrong this sets the windows standard scroll bar pos
	sb->SetScrollPos(x);
	SetScrollPos(SB_VERT,x);
	char *s=new char;
	_itoa(x,s,10);
	e1.SetWindowText(s);
	}
	}
	CFrameWnd::OnHScroll(code, pos,sb);
}


HBRUSH myframe::OnCtlColor(CDC *dc,CWnd *win,UINT ct)
{
	HBRUSH hbr;
	if(win->m_hWnd==e1.m_hWnd )
	{
		SetTextColor(*dc,RGB(0,100,0));
		SetBkColor(dc->m_hDC ,RGB(0,0,200));  //*dc=dc->m_hdc
		hbr=CreateSolidBrush(RGB(200,100,100));
		return hbr;

	
	}
	hbr=CFrameWnd::OnCtlColor(dc,win , ct);
	return hbr;
	
}