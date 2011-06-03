#include "std.h"
#include "resource.h"


class mydialog:public CDialog
{


public:
	
	/* if the resource is not specified the, we automatically provide
	the resource in the constructor.
	if the resource is specified we call another form of constructor*/
	mydialog():CDialog(IDD_DIALOG1){}	
	mydialog(int n):CDialog(n){}
	void bt1();
	void bt2();
	void bt3();
	void OnOK();
	DECLARE_MESSAGE_MAP()
};

