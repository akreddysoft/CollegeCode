#include "ass6.h"
#include "dlg.h"

BEGIN_MESSAGE_MAP(CDlgCalcApp, CWinApp)
	ON_COMMAND(ID_HELP, CWinApp::OnHelp)
END_MESSAGE_MAP()



CDlgCalcApp::CDlgCalcApp()
{
}



CDlgCalcApp theApp;

BOOL CDlgCalcApp::InitInstance()
{
	CDlgCalcDlg dlg;
	m_pMainWnd = &dlg;
	dlg.DoModal ();
	return FALSE;
}
