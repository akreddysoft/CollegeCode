#include "std.h"
#include "dlg.h"
#include "resource.h"

class myapp :public CWinApp
{
public:	
	mydialog dlg;

	virtual BOOL InitInstance()
	{
		//dlg.Create(IDD_DIALOG1);
		dlg.DoModal();
		return 1;
	}
};