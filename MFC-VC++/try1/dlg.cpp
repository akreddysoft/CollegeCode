#include "dlg.h"
#include "resource.h"

BEGIN_MESSAGE_MAP(mystat,CStatic)
ON_WM_CTLCOLOR_REFLECT()
END_MESSAGE_MAP()

BEGIN_MESSAGE_MAP(mydlg,CDialog)
ON_COMMAND_RANGE(IDC_RRED,IDC_RBLUE,chancol)
END_MESSAGE_MAP()


BOOL mydlg::OnInitDialog()
{
	CDialog::OnInitDialog();
	CheckRadioButton(IDC_RGREEN,IDC_RBLUE,IDC_RGREEN);
	CheckDlgButton(IDC_GREEN,1);
	return 0;
}

void mydlg::OnOK()
{
	DestroyWindow();
}

void mydlg::OnCancel()
{

	DestroyWindow();
}

void mydlg::DoDataExchange(CDataExchange *p)
{
	DDX_Control(p,IDC_STATIC2,s1);
}

void mydlg::chancol()
{
	int i=GetCheckedRadioButton(IDC_RRED,IDC_RBLUE);
	switch(i)
	{
	case IDC_RRED:
		s1.SetColor(RGB(255,0,0));
		break;

	case IDC_RGREEN:
		s1.SetColor(RGB(0,255,0));
		break;

	case IDC_RBLUE:
		s1.SetColor(RGB(0,0,255));
		break;
	}
}

void mystat::SetColor(COLORREF x)
{
	bkcolor=x;
	Invalidate();
}

HBRUSH mystat::CtlColor(CDC *dc,UINT color)
{
	HBRUSH hbr=CreateSolidBrush(bkcolor); 
	dc->SetTextColor (RGB (255, 255, 255));
    dc->SetBkColor (RGB (255, 0, 0));
    return hbr;
}