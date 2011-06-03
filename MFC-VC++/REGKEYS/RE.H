#include "resource.h"

class re:public CDialog
{

	CButton softbutton,cmdhere,tabhandle;
	CRegKey reg;
	CEdit path;
	void openfolder();
	void opencommand();
	void openexe();
	int d;
public:
	re(){}
	
	//{{AFX_MSG(re)
	virtual BOOL OnInitDialog();
	afx_msg void OnExit();
	afx_msg void savar();
	afx_msg void idsoft();
	afx_msg void cmd();
	afx_msg void tabhand();
	
	//}}AFX_MSG
	
	//{{AFX_VIRTUAL(re)
	virtual void PostNcDestroy();
	virtual void OnCancel();
	virtual void DoDataExchange(CDataExchange *pdx);
	//}}AFX_VIRTUAL

DECLARE_MESSAGE_MAP()
};




















