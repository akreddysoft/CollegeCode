#include "ass4.h"

char fill[1000];

char madhur[2000]={"color program by madhur ahuja"};

myapp app;
myscroll hs1,hs2,hs3,*point;
CEdit *st1,*st2,*st3;
CDC *dc;
CWnd *wnd;

myframe::myframe()
{
	Create(0,"mywindow");
}

BOOL myapp::InitInstance()
{
	myframe *p;
	p=new myframe;
	p->ShowWindow(SW_SHOWNORMAL);
	m_pMainWnd=p;
	return 1;
}

int myframe::OnCreate(LPCREATESTRUCT lp)
{
	RECT rc;
	rc.bottom=500;
	rc.left =100;
	rc.right =500;
	rc.top =300;
	
	for(int i=0;i<1000;++i)
		fill[i]='!';
	fill[999]=0;

	
	lstrcat(madhur,fill);
	main.Create(WS_CHILD|WS_VISIBLE | WS_THICKFRAME|ES_MULTILINE,CRect(10,200,700,700),this,STATICID);
	
	main.SetWindowText(madhur);

	hs1.Create(WS_CHILD| WS_VISIBLE|SBS_HORZ ,CRect(10,10,500,30),this,HSCROLLID1);
	hs2.Create(WS_CHILD| WS_VISIBLE|SBS_HORZ ,CRect(10,50,500,70),this,HSCROLLID2);
	hs3.Create(WS_CHILD| WS_VISIBLE|SBS_HORZ ,CRect(10,90,500,110),this,HSCROLLID3);
	
	hs1.SetScrollRange(0,255);
	hs3.SetScrollRange(0,255);
	hs2.SetScrollRange(0,255);
	
	st1=new CEdit;
	st2=new CEdit;
	st3=new CEdit;
	st1->Create(WS_BORDER | WS_THICKFRAME |WS_CHILD| WS_VISIBLE|ES_READONLY,CRect(600,10,700,30),this,TEXTID1);
	st2->Create(WS_BORDER | WS_THICKFRAME |WS_CHILD| WS_VISIBLE|ES_READONLY,CRect(600,50,700,70),this,TEXTID2);
	st3->Create(WS_BORDER | WS_THICKFRAME |WS_CHILD| WS_VISIBLE|ES_READONLY,CRect(600,90,700,110),this,TEXTID3);
	
	return 0;
}




void myframe::OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar)
{
	RECT rc;
	
	rc.left=10;
	rc.top=200;
	rc.right =700;
	rc.bottom  =700;
	int minpos=0;
	int maxpos=255;
	int curpos=pScrollBar->GetScrollPos();

	
	switch(nSBCode)
	{
	 case SB_LEFT:      // Scroll to far left.
      curpos = minpos;
      break;

   case SB_RIGHT:      // Scroll to far right.
      curpos = maxpos;
      break;

   case SB_ENDSCROLL:   // End scroll.
      break;

   case SB_LINELEFT:      // Scroll left.
      if (curpos > minpos)
         curpos--;
      break;

   case SB_LINERIGHT:   // Scroll right.
      if (curpos < maxpos)
         curpos++;
      break;

   case SB_PAGELEFT:    // Scroll one page left.
   {
      // Get the page size. 
      SCROLLINFO   info;
      pScrollBar->GetScrollInfo(&info, SIF_ALL);
   
      if (curpos > minpos)
      curpos = max(minpos, curpos - (int) info.nPage);
   }
      break;

   case SB_PAGERIGHT:      // Scroll one page right.
   {
      // Get the page size. 
      SCROLLINFO   info;
      pScrollBar->GetScrollInfo(&info, SIF_ALL);

      if (curpos < maxpos)
         curpos = min(maxpos, curpos + (int) info.nPage);
   }
      break;

   case SB_THUMBPOSITION: // Scroll to absolute position. nPos is the position
      curpos = nPos;      // of the scroll box at the end of the drag operation.
      break;

   case SB_THUMBTRACK:   // Drag scroll box to specified position. nPos is the
      curpos = nPos;     // position that the scroll box has been dragged to.
      break;
	}

	pScrollBar->SetScrollPos(curpos);
	
	int id=pScrollBar->GetDlgCtrlID();
	switch(id)
	{
	case HSCROLLID1:
		char str[5];
		_itoa(curpos,str,10);
		st1->SetWindowText(str);
		break;

	case HSCROLLID2:
		_itoa(curpos,str,10);
		st2->SetWindowText(str);
		break;

	case HSCROLLID3:
		_itoa(curpos,str,10);
		st3->SetWindowText(str);
		break;
	}

	HWND  wnd;
	wnd=::GetDlgItem(this->m_hWnd ,STATICID);
	::RedrawWindow(wnd,0,0,RDW_ERASE | RDW_INVALIDATE);

	
}


HBRUSH myframe:: OnCtlColor(CDC *dc,CWnd *wnd,UINT color)
{
	HBRUSH hbr=CWnd::OnCtlColor(dc,wnd,color);
	
	if(wnd->GetDlgCtrlID()==STATICID)
	{
		
		dc->SetBkColor(RGB(100,100,0));
		hbr=CreateSolidBrush(RGB(hs1.GetScrollPos(),hs2.GetScrollPos(),hs3.GetScrollPos()));
		dc->SetBkMode(TRANSPARENT);
		
	}
	
	
	return hbr;
}


