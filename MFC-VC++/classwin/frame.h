#include "std.h"

class myframe :public CFrameWnd
{
CString clas;
CMenu m;
double i,y;
public:
	myframe()
	{
		
		clas=AfxRegisterWndClass(CS_HREDRAW,LoadCursor(0,IDC_CROSS),CreateSolidBrush(RGB(100,200,100)),LoadIcon(0,IDI_APPLICATION));
		Create(clas,"dfdf");
	}

	afx_msg void OnContextMenu(CWnd *,CPoint);
	int OnCreate(LPCREATESTRUCT lp);
	afx_msg void OnPaint();
	void m1();
	
DECLARE_MESSAGE_MAP()
};