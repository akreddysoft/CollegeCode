#include "dlg.h"

void mydialog::bt1()
{
	//EndDialog(10);
	//for modeless it should be always destroy window
	DestroyWindow();
	TRACE("this is bt1\n");
}


void mydialog::bt2()
{
	//EndDialog(10);
	//for modeless it should be always destroy window
	DestroyWindow();
	TRACE("this is bt2\n");
}

void mydialog::OnOK()
{
	MessageBox("this is i am in onok");
	//EndDialog(10);
	//for modeless it should be always destroy window
	DestroyWindow();
	
}

void mydialog::bt3()
{
	SetDlgItemText(IDC_EDIT1,"MADHUR");
}

void mydialog::OnCancel()
{
	DestroyWindow();
}




BEGIN_MESSAGE_MAP(mydialog,CDialog)
ON_BN_CLICKED(IDC_BUTTON1,bt1)
ON_BN_CLICKED(IDC_BUTTON2,bt2)
ON_BN_CLICKED(IDC_BUTTON3,bt3)
END_MESSAGE_MAP()