#include "frame.h"

void myframe::OnCreate(LPCREATESTRUCT lp)
{

	RECT rc;
	rc.left =0;
	rc.top =0;
	rc.right =100;
	rc.bottom =100;

	b1.Create("dffdf",WS_CHILD | WS_VISIBLE|BS_AUTOCHECKBOX,rc,this,200);
	
	rc.left =100;
	rc.top =100;
	rc.right =200;
	rc.bottom =200;

	l1.Create(LBS_STANDARD|WS_CHILD|WS_VISIBLE|WS_BORDER,rc,this,202);
	//l1.CreateEx(WS_EX_CLIENTEDGE,"Listbox","dFFD",LBS_STANDARD|WS_CHILD|WS_VISIBLE,100,100,200,200,this->m_hWnd ,HMENU(202));
	
	l1.AddString("madhur");
	l1.AddString("dffd");
	l1.AddString ("dfdffffffff");
	::SendMessage(l1.m_hWnd,LB_ADDSTRING,0,LPARAM("DFdf"));
	//MessageBox("DF");

	rc.left =400;
	rc.top =400;
	rc.right =450;
	rc.bottom =450;
	s1.Create("Dffdf",WS_CHILD | WS_VISIBLE,rc,this);
	
	e1.CreateEx(WS_EX_CLIENTEDGE,"edit","DFFD",WS_CHILD | WS_VISIBLE,CRect(300,300,400,400),this,300);

	sl1.Create(WS_CHILD | WS_VISIBLE,CRect(000,600,700,700),this,303);
	sl1.SetScrollRange(0,256);
	x=0;

}

void myframe::check()
{
	int i=b1.GetCheck();
	if(i==BST_CHECKED)
		MessageBox("you checked");
	else
		MessageBox("you unchecked");

	l1.AddString("DFdf");
	e1.SetWindowText("dffd");
}

void myframe::listb()
{
	MessageBox("listbox clieck");
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

	case SB_ENDSCROLL:
		//End scroll. 

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
      x = max(0, 0 - (int) info.nPage);

		break;

	case SB_PAGERIGHT:
		//Scroll one page right. 
	
		 // Get the page size. 
//      SCROLLINFO   info;
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
	}

	}
	CFrameWnd::OnHScroll(code, pos,sb);
}


BEGIN_MESSAGE_MAP(myframe,CFrameWnd)
	ON_WM_CREATE()
	ON_BN_CLICKED(200,check)
	ON_LBN_SELCHANGE(202,listb)
	ON_WM_HSCROLL()
END_MESSAGE_MAP()