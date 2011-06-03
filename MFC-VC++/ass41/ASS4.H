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


class myscroll:public CScrollBar
{
public:
	 afx_msg void OnHScroll(UINT ,UINT,CScrollBar*);

};


class myframe:public CFrameWnd
{
CStatic main;
CEdit st1;
CEdit st2;
CEdit st3;
myscroll hs1,hs2,hs3;
public:
	int OnCreate(LPCREATESTRUCT);

	myframe();
	
	HBRUSH OnCtlColor(CDC *dc,CWnd *wnd,UINT);
	afx_msg void OnHScroll(UINT ,UINT,CScrollBar*);
	DECLARE_MESSAGE_MAP()


};




BEGIN_MESSAGE_MAP(myframe,CFrameWnd)
	ON_WM_CREATE()
	ON_WM_HSCROLL()
	ON_WM_CTLCOLOR()
	//ON_WM_CTLCOLOR_REFLECT()
END_MESSAGE_MAP()
