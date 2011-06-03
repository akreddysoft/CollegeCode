#include "std.h"
#include "resource.h"

class mydialog:public CDialog
{
CEdit e1;
public:
	mydialog(int n):CDialog(n){}
	mydialog():CDialog(IDD_DIALOG1){}
	void sfont();
	void DoDataExchange(CDataExchange *p);
	BOOL OnInitDialog();
	DECLARE_MESSAGE_MAP()
};