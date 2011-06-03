#include "std.h"
#include "resource.h"


class mydialog:public CDialog
{
public:
	mydialog(){}
	//mydialog(int n):CDialog.Create(n){}


	void bt1();
	void bt2();
	void bt3();
	void OnOK();
	void OnCancel();
	DECLARE_MESSAGE_MAP()
};

