#include "std.h"


class Cmydlg : public CDialog
{
CListCtrl list;

public:
	virtual BOOL OnInitDialog();
//	void butclick();
	Cmydlg():CDialog(IDD_SETTING){}
DECLARE_MESSAGE_MAP()
};

