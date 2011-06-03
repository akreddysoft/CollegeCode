#include "std.h"

/*class myedit:public CEdit
{

protected:
afx_msg void OnChar (UINT nChar, UINT nRepCnt, UINT nFlags);

DECLARE_MESSAGE_MAP()
};

BEGIN_MESSAGE_MAP(myedit,CEdit)
ON_WM_CHAR()
END_MESSAGE_MAP()*/


class mystat:public CStatic
{
protected:
	afx_msg OnCtlColor(CDC*,CWnd *,UINT);
	DECLARE_MESSAGE_MAP()
};

BEGIN_MESSAGE_MAP(mystat,CStatic)
ON_WM_CHAR()
END_MESSAGE_MAP()
