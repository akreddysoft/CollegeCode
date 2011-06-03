#include "std.h"
//MESSAGE REFLECTION DEMONSTRATION

class mystat:public CStatic
{
COLORREF bkcolor;
public:
	
	afx_msg HBRUSH CtlColor (CDC* pDC, UINT nCtlColor);
	void SetColor(COLORREF);                     
	DECLARE_MESSAGE_MAP()

};


class mydlg:public CDialog
{
mystat s1;
public:
	mydlg(){}

	DECLARE_MESSAGE_MAP()
	BOOL OnInitDialog();
	virtual void DoDataExchange(CDataExchange *p);
	void OnOK();
	void OnCancel();
	void chancol();
};