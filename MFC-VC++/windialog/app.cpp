#include "app.h"

myapp app;


BOOL myapp:: InitInstance()
	{
		m_pMainWnd=new myframe;
		m_pMainWnd->ShowWindow(SW_SHOWNORMAL);
		m_pMainWnd->UpdateWindow();
		return 1;
		
	}