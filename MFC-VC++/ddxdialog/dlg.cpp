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
	
	b1.SetWindowText("Dfdfd");
	SetDlgItemText(IDC_EDIT1,"MADHUR");
}

void mydialog::OnCancel()
{
	DestroyWindow();
}


void mydialog::DoDataExchange(CDataExchange *p)
{
	CDialog::DoDataExchange(p);
	DDX_Control(p,IDC_BUTTON1,b1);
	DDX_Control(p,IDC_EDIT1,e1);
}

BOOL mydialog::OnInitDialog()
{
	CDialog::OnInitDialog();
	return 1;
}


void mydialog::update()  //imp proc
{
	char str[20];
	e1.GetWindowText(str,20);
	_itoa(int(e1.m_hWnd),str,10);
	MessageBox(str,"demonstration of dialog data exchange"); //STR WILL BE handle to the edit box
	//to which we have don ddx_control
}

void mydialog::init()
{
	CString str;
	UpdateData(0);
	e1.SetWindowText(str);

}
BEGIN_MESSAGE_MAP(mydialog,CDialog)
	ON_BN_CLICKED(IDC_BUTTON1,bt1)
	ON_BN_CLICKED(IDC_BUTTON2,bt2)
	ON_BN_CLICKED(IDC_BUTTON3,bt3)
	ON_BN_CLICKED(IDC_UPDATE,update)
	ON_BN_CLICKED(IDC_INIT,init)
END_MESSAGE_MAP()