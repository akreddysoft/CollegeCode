#include "std.h"
//#include "edit.h"


class myframe : public CFrameWnd
{
public:
myframe()
{
	Create(0,"scroll bar demon",WS_HSCROLL | WS_VSCROLL | WS_OVERLAPPEDWINDOW);
}
CScrollBar sl1;

//myedit e1;
CEdit e1;
//myedit e2;
protected:
	int x;
	afx_msg int OnCreate(LPCREATESTRUCT);
	afx_msg void OnHScroll(UINT,UINT,CScrollBar *);
	afx_msg HBRUSH OnCtlColor(CDC *,CWnd *,UINT);
	DECLARE_MESSAGE_MAP()
};

