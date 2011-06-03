// lDlg.cpp : implementation file
//

#include "stdafx.h"
#include "resource.h"
#include "LDlg1.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About


///////////// to be read from the database/////////
int cnt=3;
int flid[]={0,1,2};
int lflag=0;
int crflid=0,crflidindex=0;
int flrows[10]={10,15,20},flclmns[10]={10,15,20};
int flDV=0;

///////////// floor database /////////////

int labid[10]={1,2,3,4,5};
int labfl[]={0,0,0,0,0};
int labcount=5;

char labname[][20]={"lab 1","lab 2", "lab 3","lab 4","lab 5"};

//pt1[0]=new CPoint;

///////////// floor database /////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////// lab database ////////////////////////
int crrows,crclmns;
int labrows[]={10,10,10,10,10},labclmns[]={10,10,10,10,10};
int crlabid,crlabidindex;
int cmlabid[]={1,1,1,1,1};
int cmid[]={1,2,3,4,5};
int cmcount=5;
////////////////////////// lab database ////////////////////////

///////////// to be read from the database/////////

/////////////////////////////////////////////////////////////////////////////
// CLDlg dialog

CLDlg::CLDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CLDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CLDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CLDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CLDlg)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CLDlg, CDialog)
	//{{AFX_MSG_MAP(CLDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_WM_LBUTTONDOWN()
	ON_WM_LBUTTONDBLCLK()
	ON_BN_CLICKED(IDC_BUTTON1, OnButton1)
	ON_BN_CLICKED(IDC_BUTTON3, OnDV)
	ON_WM_RBUTTONDOWN()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CLDlg message handlers

BOOL CLDlg::OnInitDialog()
{
	CDialog::OnInitDialog();
	 m_hYellowBrush=(HBRUSH)GetStockObject(BLACK_BRUSH);

	 m_hRedBrush=(HBRUSH)GetStockObject(BLACK_BRUSH);


	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	
	
///////////////////////// initializations ///////////////////////////////////

pt1[0].x=0;
pt1[0].y=0;
pt2[0].x=1;
pt2[0].y=1; 
pt1[1].x=0;
pt1[1].y=3;
pt2[1].x=0;
pt2[1].y=3; 
pt1[2].x=8;
pt1[2].y=7;
pt2[2].x=9;
pt2[2].y=9; 
pt1[3].x=8;
pt1[3].y=5;
pt2[3].x=9;
pt2[3].y=6; 
pt1[4].x=4;
pt1[4].y=4;
pt2[4].x=5;
pt2[4].y=5; 

cmpt[0].x=0;
cmpt[0].y=0;
cmpt[1].x=0;
cmpt[1].y=4;
cmpt[2].x=5;
cmpt[2].y=5;
cmpt[3].x=5;
cmpt[3].y=7;
cmpt[4].x=8;
cmpt[4].y=8;

///////////////////////// initializations ///////////////////////////////////



///////////////////////////////database read from floortab/////////////////////////////////////////////
    CDatabase xx;

	xx.Open("ODBC;DSN=geoinfo");
	CRecordset dbSQL(&xx);
	dbSQL.Open(CRecordset::forwardOnly,"select * from floortab");
	cnt=0;
	while(!dbSQL.IsEOF()) 
	{
	CString xy;
	dbSQL.GetFieldValue("fid",xy);
	flid[cnt]=atoi(xy);
	dbSQL.GetFieldValue("frows",xy);
	flrows[cnt]=atoi(xy);
	dbSQL.GetFieldValue("fclmns",xy);
	flclmns[cnt++]=atoi(xy);
	dbSQL.MoveNext();	
	}

///////////////////////////////database read from floortab//////////////////////////////////////////////

///////////////////////////////database read from labtab//////////////////////////////////////////////
	CRecordset dblab(&xx);
	dblab.Open(CRecordset::forwardOnly,"select * from labtab");
	labcount=0;
	while(!dblab.IsEOF()) 
	{
	CString xy;
	dblab.GetFieldValue("labid",xy);
	labid[labcount]=atoi(xy);

	dblab.GetFieldValue("fid",xy);
	labfl[labcount]=atoi(xy);
	
	dblab.GetFieldValue("labname",xy);
	strcpy(labname[labcount],xy);
	
	dblab.GetFieldValue("labrow1",xy);
	pt1[labcount].x=atoi(xy);
	
	dblab.GetFieldValue("labclmn1",xy);
	pt1[labcount].y=atoi(xy);
	
	dblab.GetFieldValue("labrow2",xy);
	pt2[labcount].x=atoi(xy);
	
	dblab.GetFieldValue("labclmn2",xy);
	pt2[labcount].y=atoi(xy);

	dblab.GetFieldValue("labrows",xy);
	labrows[labcount]=atoi(xy);

	dblab.GetFieldValue("labclmns",xy);
	labclmns[labcount++]=atoi(xy);

	
	dblab.MoveNext();	
	}
	
///////////////////////////////database read from labtab//////////////////////////////////////////////
	
///////////////////////////////database read from labtab//////////////////////////////////////////////
	CRecordset dbcmp(&xx);
	dbcmp.Open(CRecordset::forwardOnly,"select * from comptab");
	cmcount=0;
	while(!dbcmp.IsEOF()) 
	{
	CString xy;
	dbcmp.GetFieldValue("cmid",xy);
	cmid[cmcount]=atoi(xy);
	dbcmp.GetFieldValue("labid",xy);
	cmlabid[cmcount]=atoi(xy);
	dbcmp.GetFieldValue("ptx",xy);
	cmpt[cmcount].x =atoi(xy);
	dbcmp.GetFieldValue("pty",xy);
	cmpt[cmcount].y =atoi(xy);

	dbcmp.GetFieldValue("cmip1",xy);
	cmip[cmcount][0] =atoi(xy);

	dbcmp.GetFieldValue("cmip2",xy);
	cmip[cmcount][1] =atoi(xy);

	dbcmp.GetFieldValue("cmip3",xy);
	cmip[cmcount][2] =atoi(xy);

	dbcmp.GetFieldValue("cmip4",xy);
	cmip[cmcount][3] =atoi(xy);

	cmcount++;
	dbcmp.MoveNext();	
	}
	
	
///////////////////////////////database read from labtab//////////////////////////////////////////////
return TRUE;  // return TRUE  unless you set the focus to a control
}

void CLDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	//if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	//{
	//	CAboutDlg dlgAbout;
	//	dlgAbout.DoModal();
	//}
//	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}
HBRUSH CLDlg::OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor)
{
    if (nCtlColor == CTLCOLOR_EDIT) {
        pDC->SetBkColor(RGB(255, 255, 0));  // yellow
        return m_hYellowBrush;
    }
    if (nCtlColor == CTLCOLOR_DLG) {
        pDC->SetBkColor(RGB(255, 0, 0));    // red
        return m_hRedBrush;
    }
    return CDialog::OnCtlColor(pDC, pWnd, nCtlColor);
}


// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework
/*
Displaying an Image
void DisplayBitmap(CDC *PDC,CBitmap *PBitmap,int X,int Y,int Wid=0,int Hig=0) {
BITMAP BM;
CDC MemDC;
MemDC.CreateCompatibleDC(NULL);
MemDC.SelectObject(PBitmap);
PBitmap->GetObject(sizeof(BM),&BM);
if(Wid==0) {
Wid=BM.bmWidth;
Hig=BM.bmHeight;
}
PDC->BitBlt(X,Y,Wid,Hig,&MemDC,0,0,SRCCOPY);
}.
*/

void CLDlg::OnPaint() 
{
///////////////////////////////////////////////////////////////////////////////////////
	////OnPaint redefined 
//	CBitmap bm;
//	bm.LoadBitmap(IDB_BITMAP2);
	//DisplayBitmap(pControlDC,&bm,0,0,100,100);
	CWnd* pWnd = GetDlgItem(IDC_STATIC1);     // IDC_STATIC1 specified
                                              //  in the dialog editor
    CDC* pControlDC = pWnd->GetDC();
	
    pWnd->Invalidate();
    pWnd->UpdateWindow();

    pControlDC->SelectStockObject(0);
	pBrush=new CBrush();
	pBrush->CreateSolidBrush(RGB(50,25,50));
	CRect rect;
	rect.left=0;
	rect.top=0;
	rect.bottom=650;
	rect.right=650;
    pControlDC->Rectangle(rect);      // black square bullet
//	pControlDC->Ellipse(CRect(0,0,100,100));
	pControlDC->FillRect(rect,pBrush);

	switch(lflag)
	{
	case 0:	{
			int intrval=650/cnt;
			for(int cntr=1;cntr<cnt;cntr++)
			{
				pControlDC->MoveTo(0,intrval*cntr);
				pControlDC->LineTo(650,intrval*cntr);

			}
			}
			break;
	case 1:
		{
		if(flDV)
		{
		int interval=650/flrows[crflid];
		for(int i=1;i<flrows[crflid];i++)
		{
				pControlDC->MoveTo(0,interval*i);
				pControlDC->LineTo(650,interval*i);
			
		}
		interval=650/flclmns[crflid];
		for(i=1;i<flclmns[crflid];i++)
		{
			pControlDC->MoveTo(interval*i,0);
			pControlDC->LineTo(interval*i,650);
		}
		}
		///////// formation of labs ///////////
		CBrush *pBrush=new CBrush();
		pBrush->CreateSolidBrush(RGB(0,0,155));
		for(int tempcntr=0;tempcntr<labcount;tempcntr++)
		{
			if(labfl[tempcntr]==crflid)
			{
				//int x1=pt1[tempcntr].y*(650/flclmns[crflid]),y1=pt1[tempcntr].x*(650/flrows[crflid]) ;
				//int x2=pt2[tempcntr].y*(650/flclmns[crflid]),y2=pt2[tempcntr].x*(650/flrows[crflid]) ;
				long xx1=pt1[tempcntr].x,yy1=pt1[tempcntr].y;
				long xx2=pt2[tempcntr].x,yy2=pt2[tempcntr].y;
									

				if(xx1>xx2)
				{
					int temp=xx1;
					xx1=xx2;
					xx2=temp;
				}
				if(yy1>yy2)
				{
					int temp=yy1;
					yy1=yy2;
					yy2=temp;
				}
				char str1[30],str2[10];
				itoa(xx1,str1,10);
				itoa(yy1,str2,10);
				strcat(str1,"#");
				strcat(str1,str2);
				itoa(xx2,str2,10);
				strcat(str1,"#");
				strcat(str1,str2);
				itoa(yy2,str2,10);
				strcat(str1,"#");
				strcat(str1,str2);
				//AfxMessageBox(str1);
				pControlDC->SelectStockObject(1);
				//rect.left=5000;
				//rect.top=5000;
				//rect.right=0;
				//rect.bottom=0;
				//int xyflag=1;
				//int xleft,ytop,xright,ybottom;
				//for(int i=xx1;i<=xx2;i++)
				//	for(int j=yy1;j<=yy2;j++)
					//{
						
						rect.left=yy1*(650/flclmns[crflid]);
						rect.top=xx1*(650/flrows[crflid]);
						rect.bottom=(xx2+1)*(650/flrows[crflid]);
						rect.right=(yy2+1)*(650/flclmns[crflid]);
					
					//}
					pControlDC->FillRect(rect,pBrush);
					pControlDC->Draw3dRect(rect,COLORREF(RGB(255,0,0)),COLORREF(RGB(255,0,0)));

			
				

			}
		}
		///////// formation of labs ///////////
		
		}
		break;
	case 2:
		{
			
			int interval=650/crrows;
			for(int i=1;i<crrows;i++)
			{
					pControlDC->MoveTo(0,interval*i);
					pControlDC->LineTo(650,interval*i);
				
			}
			interval=650/crclmns;
			for(i=1;i<crclmns;i++)
			{
				pControlDC->MoveTo(interval*i,0);
				pControlDC->LineTo(interval*i,650);
			}

			//////////////////// placing computers ///////////////
			for(int tempcntr=0;tempcntr<cmcount;tempcntr++)
				{
					if(cmlabid[tempcntr]==crlabid)
					{
						long xx1=cmpt[tempcntr].x,yy1=cmpt[tempcntr].y;
						/////////////// place computer img /////////////////////
						/// ...........................
						rect.left=yy1*(650/crclmns);
						rect.top=xx1*(650/crrows);
						rect.bottom=(xx1+1)*(650/crrows);
						rect.right=(yy1+1)*(650/crclmns);
				
					//}
					pControlDC->FillRect(rect,pBrush);
					pControlDC->Draw3dRect(rect,COLORREF(RGB(255,0,0)),COLORREF(RGB(255,0,0)));

						/////////////// place computer img /////////////////////

					}
			}
			//////////////////// placing computers ///////////////

		}break;
	}
  


	pWnd->ReleaseDC(pControlDC);
////////////////////////////////////////////////////////////////////////////////////////
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting
	
		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CLDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}



void CLDlg::OnLButtonDown(UINT nFlags, CPoint point) 
{
	// TODO: Add your message handler code here and/or call default
	/*
*/
//	AfxMessageBox(point.x + ' ' + point.y);
	
	//::AfxMessageBox("hjs");	
	CDialog::OnLButtonDown(nFlags, point);
}

void CLDlg::OnLButtonDblClk(UINT nFlags, CPoint point) 
{
	// TODO: Add your message handler code here and/or call default
	CWnd* pWnd = GetDlgItem(IDC_EDIT1);
	CWnd* pWnd1 = GetDlgItem(IDC_EDIT2);
	char str[10];
	point.x-=35;
	point.y-=30;
	
	if ( point.x<0)
		point.x=1000;
	if(point.y<0)
		point.y=1000;


	if(point.x<650 && point.y<650 )
	{
		itoa(point.y,str,10);		
		pWnd->SetWindowText(str);
		switch(lflag)
		{
		case 0: 
		
			crflidindex=point.y/(650/cnt);
			crflid=flid[crflidindex];
			itoa(crflid,str,10);
			pWnd->SetWindowText(str);
			lflag=1;
			OnPaint();
		
			break;
			///////////// switch to computers in a lab //////////
		case 1:
			{

			int xval=point.y/(650/flrows[crflidindex]);
				int yval=point.x/(650/flclmns[crflidindex]);
				itoa(xval,str,10);
				pWnd->SetWindowText(str);
				itoa(yval,str,10);
				pWnd1->SetWindowText(str);
				for(int tempcntr=0;tempcntr<labcount;tempcntr++)
				{
					if(labfl[tempcntr]==crflid)
					{
						//int x1=pt1[tempcntr].y*(650/flclmns[crflid]),y1=pt1[tempcntr].x*(650/flrows[crflid]) ;
						//int x2=pt2[tempcntr].y*(650/flclmns[crflid]),y2=pt2[tempcntr].x*(650/flrows[crflid]) ;
						long xx1=pt1[tempcntr].x,yy1=pt1[tempcntr].y;
						long xx2=pt2[tempcntr].x,yy2=pt2[tempcntr].y;
												

						if(xx1>xx2)
						{
							int temp=xx1;
							xx1=xx2;
							xx2=temp;
						}
						if(yy1>yy2)
						{
							int temp=yy1;
							yy1=yy2;
							yy2=temp;
						}
						for(int i=xx1;i<=xx2;i++)
							for(int jj=int(yy1);jj<=yy2;jj++)
								if((i==xval)&&(jj==yval))
								{
									crlabid=labid[tempcntr];
									crlabidindex=tempcntr;
									crrows=labrows[tempcntr];
									crclmns=labclmns[tempcntr];
									lflag++;
									OnPaint();
								}
								
							
						//////////////
					}
				}

		
			break;
			}
		case 2:
				int xval=point.y/(650/crrows);
				int yval=point.x/(650/crclmns);
				itoa(xval,str,10);
				pWnd->SetWindowText(str);
				itoa(yval,str,10);
				pWnd1->SetWindowText(str);
				for(int tempcntr=0;tempcntr<cmcount;tempcntr++)
				{

					if(xval==cmpt[tempcntr].x)
						if(yval==cmpt[tempcntr].y)
						{
							CWnd* pWndip = GetDlgItem(IDC_STATIC2);
							char strip[100];
							itoa(cmip[tempcntr][0],str,10);
							strcpy(strip,str);
							itoa(cmip[tempcntr][1],str,10);
							strcat(strip,"-");
							strcat(strip,str);
							itoa(cmip[tempcntr][2],str,10);
							strcat(strip,"-");
							strcat(strip,str);
							itoa(cmip[tempcntr][3],str,10);
							strcat(strip,"-");
							strcat(strip,str);
							pWndip->SetWindowText(strip);
							
						}
				}

		
			break;



		}

	}
	


	
	CDialog::OnLButtonDblClk(nFlags, point);
}

void CLDlg::OnButton1() 
{
	// TODO: Add your control notification handler code here
	if(lflag)
		lflag--;	
	OnPaint();
}

void CLDlg::OnDV() 
{
	// TODO: Add your control notification handler code here
if(flDV)flDV=0;
else flDV=1;
OnPaint();
	
}


void CLDlg::OnRButtonDown(UINT nFlags, CPoint point) 
{
/*	// TODO: Add your message handler code here and/or call default
	CWnd* pWnd = GetDlgItem(IDC_EDIT1);
	CWnd* pWnd1 = GetDlgItem(IDC_EDIT2);
	char str[10];
	point.x-=35;
	point.y-=30;
	
	if ( point.x<0)
		point.x=1000;
	if(point.y<0)
		point.y=1000;


	if(point.x<650 && point.y<650 )
	{
		itoa(point.y,str,10);		
		pWnd->SetWindowText(str);
		switch(lflag)
		{
		case 0: 
		
			crflid=point.y/(650/cnt);
			itoa(crflid,str,10);
			pWnd->SetWindowText(str);
			lflag=1;
			OnPaint();
		
			break;
			///////////// switch to computers in a lab //////////
		case 1:

			int xval=point.y/(650/flrows[crflid]);
				int yval=point.x/(650/flclmns[crflid]);
				itoa(xval,str,10);
				pWnd->SetWindowText(str);
				itoa(yval,str,10);
				pWnd1->SetWindowText(str);
				for(int tempcntr=0;tempcntr<labcount;tempcntr++)
				{
					if(labfl[tempcntr]==crflid)
					{
						//int x1=pt1[tempcntr].y*(650/flclmns[crflid]),y1=pt1[tempcntr].x*(650/flrows[crflid]) ;
						//int x2=pt2[tempcntr].y*(650/flclmns[crflid]),y2=pt2[tempcntr].x*(650/flrows[crflid]) ;
						long xx1=pt1[tempcntr].x,yy1=pt1[tempcntr].y;
						long xx2=pt2[tempcntr].x,yy2=pt2[tempcntr].y;
												

						if(xx1>xx2)
						{
							int temp=xx1;
							xx1=xx2;
							xx2=temp;
						}
						if(yy1>yy2)
						{
							int temp=yy1;
							yy1=yy2;
							yy2=temp;
						}
						for(int i=xx1;i<=xx2;i++)
							for(int jj=int(yy1);jj<=yy2;jj++)
								if((i==xval)&&(jj==yval))
								{
									crlabid=labid[tempcntr];
									crrows=labrows[tempcntr];
									crclmns=labclmns[tempcntr];
									lflag++;
									OnPaint();
								}
								
							
						//////////////
					}
				}

		
			break;


		}

	}
	


*/	
	CDialog::OnRButtonDown(nFlags, point);
}