#include<afxwin.h>

class myframe:public CFrameWnd
{
public:
	myframe()
	{
		Create(0,"madhurahujawindow");
	}
	int OnCreate(LPCREATESTRUCT);
	void OnTimer(UINT);

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