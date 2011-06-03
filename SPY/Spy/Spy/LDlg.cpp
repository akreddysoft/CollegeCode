// LDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Spy.h"
#include "LDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CLDlg dialog


CLDlg::CLDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CLDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CLDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CLDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CLDlg)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CLDlg, CDialog)
	//{{AFX_MSG_MAP(CLDlg)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CLDlg message handlers
