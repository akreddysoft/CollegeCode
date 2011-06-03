#include "dlg.h"

BEGIN_MESSAGE_MAP(Cmydlg,CDialog)
//	ON_BN_CLICKED(IDC_ADD,butclick)
END_MESSAGE_MAP()

BOOL Cmydlg::OnInitDialog()
{
	list.Attach(::GetDlgItem(this->m_hWnd ,IDC_LIST1));
	return 1;
}

