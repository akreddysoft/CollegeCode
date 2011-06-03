#include "std.h"
#include "re.h"
#include "APP.h"
app app1;

BEGIN_MESSAGE_MAP(re,CDialog)
   //{{AFX_MSG_MAP(re)
	ON_BN_CLICKED(IDEXIT, OnExit)
	ON_BN_CLICKED(IDSAVAR,savar)
	ON_BN_CLICKED(IDSOFTICE,idsoft)
	ON_BN_CLICKED(IDCMD,cmd)
	ON_BN_CLICKED(IDCMDTAB,tabhand)
	ON_WM_DESTROY()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

void re::DoDataExchange(CDataExchange *pdx)
{
	DDX_Control(pdx,IDSOFTICE,softbutton);
	DDX_Control(pdx,IDCMD,cmdhere);
	DDX_Control(pdx,IDCMDTAB,tabhandle);
	DDX_Control(pdx,IDC_DRIVE,path);
}


void re::idsoft()
{
	CString rs;
	int d;
	CString path2;
	char path1[100];
	path.GetWindowText(path1,10);
	strcat(path1,":\\Program Files\\NuMega\\SoftIceNT\\loader32.exe %1");
	
	softbutton.GetWindowText(rs);

	openexe();

	if(rs=="Enable")
	{

		d=reg.Create(reg.m_hKey ,"Load Into Softice");
		if(d!=ERROR_SUCCESS)
			MessageBox("error");
		d=reg.SetValue(reg.m_hKey ,"Command",path1,0);
		if(d!=ERROR_SUCCESS)
			MessageBox("error");
		softbutton.SetWindowText("Disable");
	}
	else
	{

		d=reg.RecurseDeleteKey("Load Into Softice");
		if(d!=ERROR_SUCCESS)
			MessageBox("error");
		softbutton.SetWindowText("Enable");
	}


}


void re::cmd()
{
	CString rs;
	int d;
	char *path1="cmd /k cd /d %1";
	
	cmdhere.GetWindowText(rs);

	openfolder();

	if(rs=="Enable")
	{

			d=reg.Create(reg.m_hKey ,"Command Prompt Here");
		if(d!=ERROR_SUCCESS)
			MessageBox("error");
		d=reg.SetValue(reg.m_hKey ,"Command",path1,0);
		if(d!=ERROR_SUCCESS)
			MessageBox("error");
		cmdhere.SetWindowText("Disable");
	}
	else
	{
		d=reg.RecurseDeleteKey("Command prompt Here");
		if(d!=ERROR_SUCCESS)
			MessageBox("error");
		cmdhere.SetWindowText("Enable");
	}


}


void re::tabhand()
{

	CString rs;
	int d;
	char *path1="cmd /k cd /d %1";
	
	tabhandle.GetWindowText(rs);

	opencommand();
	
	if(rs=="Enable")
	{
			d=reg.SetValue(DWORD(0x9),"CompletionChar");
		if(d!=ERROR_SUCCESS)
			MessageBox("error");
		d=reg.SetValue(0x9,"PathCompletionChar");
		if(d!=ERROR_SUCCESS)
			MessageBox("error");
	
	tabhandle.SetWindowText("Disable");
	}
	else
	{
		d=reg.SetValue(DWORD(0),"CompletionChar");
		if(d!=ERROR_SUCCESS)
			MessageBox("error");
		d=reg.SetValue(DWORD(0),"PathCompletionChar");
		if(d!=ERROR_SUCCESS)
			MessageBox("error");

	tabhandle.SetWindowText("Enable");
	
	}
}


void re::OnExit() 
{
 	DestroyWindow();
 		
}

void re::savar()
{
	CRegKey reg;
	int d=reg.Open(HKEY_LOCAL_MACHINE,"System");
	d=reg.Open(reg.m_hKey,"CurrentControlSet");
	d=reg.Open(reg.m_hKey,"Control");
	d=reg.Open(reg.m_hKey,"Session Manager");
	d=reg.Open(reg.m_hKey,"Environment");

	d=reg.Open(HKEY_CURRENT_USER,"Environment");
	
	d=RegSaveKey(reg.m_hKey,"c:\\env",0);
	if(d!=ERROR_SUCCESS)
	{
		MessageBox("Error");
	}
	
}

void re::OnCancel()
{
	DestroyWindow();
}

BOOL re::OnInitDialog() 
{
	
	CDialog::OnInitDialog();

	openexe();
	d=reg.Open(reg.m_hKey,"Load Into Softice");
	if(d!=ERROR_SUCCESS)
	{

		softbutton.SetWindowText("Enable");
	}
	else
		softbutton.SetWindowText("Disable");

   	 openfolder();
	d=reg.Open(reg.m_hKey,"Command Prompt Here");
	if(d!=ERROR_SUCCESS)
	{

		cmdhere.SetWindowText("Enable");
	}
	else
		cmdhere.SetWindowText("Disable");

	unsigned long valdata;
	
    	opencommand();

	d=reg.QueryValue(valdata,"CompletionChar");
	if(d!=ERROR_SUCCESS)
		MessageBox("error");
	if(valdata!=0x9)
	{
		tabhandle.SetWindowText("Enable");
	}
	else
		tabhandle.SetWindowText("Disable");

		return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void re::PostNcDestroy()
{
	delete this; 
	CDialog::OnNcDestroy();

}

void re::openfolder()
{

		d=reg.Open (HKEY_CLASSES_ROOT,"Folder");
		if(d!=ERROR_SUCCESS)
			MessageBox("error");
		d=reg.Open(reg.m_hKey,"shell");
		if(d!=ERROR_SUCCESS)
			MessageBox("error");
}

void re::openexe()
{

	d=reg.Open (HKEY_CLASSES_ROOT,"exefile");
	if(d!=ERROR_SUCCESS)
		MessageBox("error");
	d=reg.Open(reg.m_hKey,"shell");
	if(d!=ERROR_SUCCESS)
		MessageBox("error");


}

void re::opencommand()
{

	d=reg.Open (HKEY_CURRENT_USER,"Software");
	if(d!=ERROR_SUCCESS)
		MessageBox("error");
	d=reg.Open(reg.m_hKey,"Microsoft");
	if(d!=ERROR_SUCCESS)
		MessageBox("error");
	d=reg.Open(reg.m_hKey,"Command Processor");
	if(d!=ERROR_SUCCESS)
		MessageBox("error");


}