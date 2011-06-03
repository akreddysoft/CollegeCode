#include "std.h"
#include "frame.h"


class myapp:public CWinApp
{
public:
	virtual BOOL InitInstance()
	{
		m_pMainWnd=new myframe;
		m_pMainWnd->ShowWindow(SW_SHOWNORMAL);
		m_pMainWnd->UpdateWindow();
		return 1;
	}
};
