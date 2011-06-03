#include "std.h"
#include "re.h"
#include "APP.h"

BOOL app::InitInstance()
{
		//;dlg=new re;
		dlg.Create(101);
		dlg.ShowWindow(SW_SHOWNORMAL);
		m_pMainWnd=&dlg;	
		return 1;
}