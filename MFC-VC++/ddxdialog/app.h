#include "std.h"
#include "resource.h"
#include "dlg.h"

class myapp:public CWinApp
{
	int ret;
	mydialog dlg;
public:
	virtual BOOL InitInstance()
	{

		dlg.Create(IDD_DIALOG1);
		m_pMainWnd=&dlg;

		return 1;
	}
};



