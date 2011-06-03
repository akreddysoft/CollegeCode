#include<afxwin.h>
#include "resource.h"

class mydialog:public CDialog
{
public:
	mydialog()
	{
		Create(MAKEINTRESOURCE(IDD_DIALOG1),0);
	}

};

	mydialog *dlg;
class myapp:public CWinApp
{

public:

	virtual BOOL InitInstance()
	{
		dlg=new mydialog;
		//dlg->
		dlg->ShowWindow(SW_SHOWNORMAL);
		m_pMainWnd=dlg;
		return 1;
	}

};


