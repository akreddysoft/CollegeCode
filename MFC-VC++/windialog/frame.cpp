#include "frame.h"
#include "resource.h"


myframe::myframe()
{
	RECT rc;
	rc.bottom =600;
	rc.left =0;
	rc.right=600;
	rc.top =0;
	Create(0,"dfdf",WS_OVERLAPPEDWINDOW,rc,0,MAKEINTRESOURCE(IDR_MENU1));
}


//void myframe::mdls()

void myframe::modal()
{
	mydialog dlg(IDD_DIALOG1);
	
	int i=dlg.DoModal();
}

void myframe::mdls()
{
	mydialog *dlg;
	dlg=new mydialog;      //must also call delete, even if destroy window
	dlg->Create(IDD_DIALOG1,this);
}

void myframe::exitt()
{
	SendMessage(WM_CLOSE);
}

void mydialog::bt1()
{
	MessageBox("dfdfdf");
}

void mydialog::OnOK()
{
	CDialog::OnOK();	//for modal
	DestroyWindow();  //for modeless
}

void mydialog::OnCancel()
{
	CDialog::OnCancel();
	DestroyWindow();	//for modele

}


void mydialog::PostNcDestroy()
{
	delete this;       //this is must for modeless if created on heap
}

BEGIN_MESSAGE_MAP(myframe,CFrameWnd)
ON_BN_CLICKED(IDC_MODELESS,mdls)
ON_BN_CLICKED(IDC_MODAL,modal)
ON_BN_CLICKED(IDEXIT,exitt)
END_MESSAGE_MAP()



BEGIN_MESSAGE_MAP(mydialog,CDialog)
ON_BN_CLICKED(IDC_BUTTON1,bt1)
END_MESSAGE_MAP()

