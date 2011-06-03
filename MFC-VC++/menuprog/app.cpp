#include "app.h"
#include "frame.h"

myapp app;


BOOL myapp::InitInstance()
	{
		m_pMainWnd=new myframe;
		m_pMainWnd->ShowWindow(SW_HIDE);
		m_pMainWnd->UpdateWindow();
		return 1;
		
	}