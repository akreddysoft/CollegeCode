#include "ass3.h"

myapp app;
CString str;


BEGIN_MESSAGE_MAP(myframe,CFrameWnd)
	ON_WM_CREATE()
	ON_BN_CLICKED(10,showfont)
	ON_MESSAGE(WM_SETMYFONT,setmyfont)
END_MESSAGE_MAP()

int myframe::OnCreate(LPCREATESTRUCT lp)
{
	if (CWnd::OnCreate (lp) == -1)
        return -1;

	CClientDC dc (this);
	CButton *but;
	but=new CButton;
	but->Create("Show fonts",WS_CHILD|WS_VISIBLE|BS_PUSHBUTTON,CRect(10,10,100,50),this,10);
	fonttitle.Create("",WS_VISIBLE | WS_CHILD,CRect(50,100,500,500),this);

    TEXTMETRIC tm;
    dc.GetTextMetrics (&tm);
    m_cxChar = tm.tmAveCharWidth;
    m_cyChar = tm.tmHeight + tm.tmExternalLeading;
   	
	return 0;
}

void myframe::showfont()
{
	mydlg *dlg;
	dlg=new mydlg;
	dlg->Create(IDD_DIALOG1,this);	
}

void myframe::setmyfont()
{ 
	CClientDC dc(this);
	m_fontSample.DeleteObject();
	m_fontSample.CreateFont (-m_cyChar*2, 0, 0, 0, FW_NORMAL,
            0, 0, 0, DEFAULT_CHARSET, OUT_CHARACTER_PRECIS,
            CLIP_CHARACTER_PRECIS, DEFAULT_QUALITY, DEFAULT_PITCH |
           FF_DONTCARE, str); 
	fonttitle.SetFont(&m_fontSample);
	fonttitle.SetWindowText(_T("This is fontview program by Madhur"));
		
}

BOOL mydlg::OnInitDialog()
{
	lb.Create(WS_CHILD|WS_VISIBLE|LBS_STANDARD,CRect(10,10,200,300),this,20);
	lb.ResetContent();
	
	CClientDC dc (this);
    ::EnumFontFamilies ((HDC) dc, NULL, (FONTENUMPROC) EnumFontFamProc,
        (LPARAM) this);

	return 1;
}

int CALLBACK mydlg::EnumFontFamProc (ENUMLOGFONT* lpelf,
    NEWTEXTMETRIC* lpntm, int nFontType, LPARAM lParam)
{
    mydlg* pWnd = (mydlg*) lParam;

    pWnd->lb.AddString (lpelf->elfLogFont.lfFaceName);
    return 1;
}


void mydlg::OnOK()
{
	CWnd *wnd;
	int index=lb.GetCurSel();
	if(index==LB_ERR)
	{	
		MessageBox("Invalid Selection");
		return ;
	}
	lb.GetText(index,str);
	
	wnd=GetParent();
	
	
	::SendMessage(wnd->m_hWnd ,WM_SETMYFONT,index,0);
	
	EndDialog(0);

}



