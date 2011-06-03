#include "std.h"
#include "resource.h"

class mydialog:public CDialog
{
	void bt1();
public:
	mydialog(){}
	mydialog(int n):CDialog(n){}
	//for modeless dialog box
	void OnOK();
	void OnCancel();
	virtual void PostNcDestroy();
	////////////////////
	//virtual BOOL OnInitDialog();

DECLARE_MESSAGE_MAP()
};



class myframe:public CFrameWnd
{


public:
	myframe();
	void mdls();
	void modal();
	void exitt();

protected:
DECLARE_MESSAGE_MAP()
};


