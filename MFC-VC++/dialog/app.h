#include "std.h"
#include "resource.h"
#include "dlg.h"

class myapp:public CWinApp
{
	int ret;
public:
	virtual BOOL InitInstance()
	{
		mydialog dlg;  //dont need to specify the constructor
		m_pMainWnd=&dlg;
		ret=dlg.DoModal();
		switch(ret)
		{
		case IDOK:
			::MessageBox(0,"you pressed ok","gffg",0);
			break;

		case IDCANCEL:
			::MessageBox(0,"you pressed cancel",0,0);
			break;
		
		case IDC_BUTTON1:
			TRACE("BUTTON1\n");
			break;

		case IDC_BUTTON2:
			TRACE("Btutton2\n");
			break;
		
		case 10:
			TRACE("THIS IS 10\n");
			break;

		case 4:
			TRACE("this is 4\n");
			break;
		}
		TRACE("\nfffffffffff%d",ret);
		return 1;
	}
};



