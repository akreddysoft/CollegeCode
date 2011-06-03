#include "std.h"






class myframe:public CFrameWnd
{
public:
	myframe()
	{
		Create(0,"controls app",WS_HSCROLL| WS_OVERLAPPEDWINDOW);
	}
int x;
CButton b1;
CListBox l1;
CStatic s1;
CEdit e1;

CScrollBar sl1;
protected:
	afx_msg void OnCreate(LPCREATESTRUCT);
	afx_msg void check();
	afx_msg void listb();
	afx_msg void OnHScroll(UINT,UINT,CScrollBar *);
	DECLARE_MESSAGE_MAP()

};


