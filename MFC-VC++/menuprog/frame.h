#include "std.h"
#include "dlg.h"

class myframe:public CFrameWnd
{

	NOTIFYICONDATA nf;
	CMenu tmenu;
	Cmydlg dlg;
//	CFileDialog fildlg(TRUE);
public:
	CListCtrl list;
	myframe();
	LRESULT trayfunc(WPARAM,LPARAM);
	int OnCreate(LPCREATESTRUCT);
	void OnDestroy();
	void mclick(WPARAM ,LPARAM);
protected:
DECLARE_MESSAGE_MAP()
};