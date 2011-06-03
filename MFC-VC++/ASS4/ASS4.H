#include <afxwin.h>
#define	HSCROLLID1 100
#define	HSCROLLID2 101
#define	HSCROLLID3 102
#define TEXTID1		500
#define TEXTID2		501
#define TEXTID3		501
#define	STATICID	12
#define WM_COLORIT  WM_USER+500
class myapp:public CWinApp
{
public :
	virtual BOOL InitInstance();
};

class	myedit:public CEdit
{
	public:
   protected:
      static CBrush m_brush;
};


class myframe:public CFrameWnd
{
myedit main;
public:
	int OnCreate(LPCREATESTRUCT);

	myframe();
	
	HBRUSH OnCtlColor(CDC *dc,CWnd *wnd,UINT);
	afx_msg void OnHScroll(UINT ,UINT,CScrollBar*);
	DECLARE_MESSAGE_MAP()


};


class myscroll:public CScrollBar
{
public:
	 afx_msg void OnHScroll(UINT ,UINT,CScrollBar*);

};

BEGIN_MESSAGE_MAP(myframe,CFrameWnd)
	ON_WM_CREATE()
	ON_WM_HSCROLL()
	ON_WM_CTLCOLOR()
	
END_MESSAGE_MAP()
