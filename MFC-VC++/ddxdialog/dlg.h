#include "std.h"
#include "resource.h"



class mydialog:public CDialog
{
/*create the classes which represent the controls create in script file*/
protected:
	CEdit e1;
	CButton b1,b2,b3;
	CListBox l1;
	CStatic s1;

	void update();

public:
	mydialog(){}

	void bt1();
	void bt2();
	void bt3();
	void OnOK();
	void OnCancel();
	virtual void DoDataExchange(CDataExchange *);
	virtual BOOL OnInitDialog();
	void init();

	DECLARE_MESSAGE_MAP()
};

