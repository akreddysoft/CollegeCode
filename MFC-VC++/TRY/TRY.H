#include<afxwin.h>


class frame:public CFrameWnd
{
private:
	CPoint pt1;
	char char1;

public:
	frame()
	{
		Create(0,"hello");
	}

	void OnPaint();
	void OnLButtonDown(int i,CPoint pt);
	void OnCreate();
	void OnChar(UINT char1,UINT rep,UINT flag);
	
DECLARE_MESSAGE_MAP()
};

BEGIN_MESSAGE_MAP(frame,CFrameWnd)
	ON_WM_CREATE()
	ON_WM_PAINT()
	ON_WM_LBUTTONDOWN()
	ON_WM_CHAR()
END_MESSAGE_MAP()


class myapp:public CWinApp
{
public:
	frame *p;
	
public:
	virtual BOOL InitInstance()
	{
		p=new frame;
		p->ShowWindow(SW_SHOWNORMAL);
		m_pMainWnd=p;
		return 1;
	}

};

