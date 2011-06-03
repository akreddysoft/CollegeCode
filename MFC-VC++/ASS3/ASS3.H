#include <afxwin.h>
#include "resource.h"
#define WM_SETMYFONT WM_USER+200

class myframe:public CFrameWnd
{

protected:
CStatic fonttitle;
CFont m_fontSample;
int m_cxChar;
int m_cyChar;

public:
	myframe()
	{
		Create(0,"madhursfontprogram");
	}

	int OnCreate(LPCREATESTRUCT lp);
	afx_msg void showfont();
	afx_msg void setmyfont();

	
	DECLARE_MESSAGE_MAP()
};


class myapp:public CWinApp
{
public:
	virtual BOOL InitInstance()
	{
		m_pMainWnd=new myframe;
		m_pMainWnd->ShowWindow(SW_SHOWNORMAL);
		return 1;
	}
};

class mydlg:public CDialog
{

public:
	CListBox lb;

	virtual BOOL OnInitDialog();
		static int CALLBACK EnumFontFamProc (ENUMLOGFONT* lpelf,
		NEWTEXTMETRIC* lpntm, int nFontType, LPARAM lParam);
		void OnOK();
	
};

