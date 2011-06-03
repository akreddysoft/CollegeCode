#include "dlg.h"

BEGIN_MESSAGE_MAP(mydialog,CDialog)
ON_BN_CLICKED(IDC_BUTTON1,sfont)
END_MESSAGE_MAP()

void mydialog::sfont()
{
	CFontDialog dlg;
	CString str;
	int size;
	long style;

	CFont ff;
	int i=dlg.DoModal();
	if(i==IDCANCEL)
		return;
	str=dlg.GetFaceName();
	
	size=dlg.GetSize();


	LOGFONT lf;
	lf.lfHeight =dlg.GetSize();
	
	memset(&lf,0,sizeof lf);
	
	
	str=dlg.GetFaceName();
	if(dlg.IsItalic())		
	lf.lfItalic =1;

	if(dlg.IsUnderline())
		lf.lfUnderline=1;

	if(dlg.IsBold())
		lf.lfWeight=700;
	
	if(dlg.IsStrikeOut())
		lf.lfStrikeOut=1;

	lf.lfHeight =size/10+10;
	
	
	char s[32]="Arial";
	strcpy(lf.lfFaceName,str);
	
	ff.CreateFontIndirect(&lf);

	e1.SetWindowText("dfdfsdfsfsd");
	e1.SetFont(&ff);
	
}

BOOL mydialog::OnInitDialog()
{
	CDialog::OnInitDialog();
	return 0;
}

void mydialog::DoDataExchange(CDataExchange *p)
{
	DDX_Control(p,IDC_EDIT1,e1);
}