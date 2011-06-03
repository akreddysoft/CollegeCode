#include "dlg.h"
#include "std.h"
#include "resource.h"

class myapp:public CWinApp
{
mydlg *dlg;
public:
	virtual BOOL InitInstance()
	{
		dlg=new mydlg;
		dlg->Create(IDD_DIALOG1);
		m_pMainWnd=dlg;
		return 1;
	}
};
		