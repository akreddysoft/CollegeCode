#include<windows.h>

#pragma data_seg(".SHARDATA")
static HWND   hWnd = NULL;  // Main hwnd. We will get this from the app.
#pragma data_seg()

HANDLE hInst;
HHOOK hhook;
POINT pt;
//MOUSEHOOKSTRUCT ms;
//HWND hWnd;

LRESULT CALLBACK hproc(int code,WPARAM wparam,LPARAM lparam);

BOOL APIENTRY DllMain( HANDLE hModule, 
                       DWORD  ul_reason_for_call, 
                       LPVOID lpReserved
					 )
{
    if(ul_reason_for_call=DLL_THREAD_ATTACH)
	{
		hInst=hModule;
	}
	return TRUE;
}



void installhook(HWND hwnd)
{
	hWnd=hwnd;
	hhook=SetWindowsHookEx(WH_MOUSE,hproc,HINSTANCE(hInst),0);

}


void removehook()
{
	UnhookWindowsHookEx(hhook);
	
}


LRESULT CALLBACK hproc(int code,WPARAM wparam,LPARAM lparam)
{
	HWND handle;
//	char buffer[30];
	int ctrlid;
	MOUSEHOOKSTRUCT *add;


    add=(MOUSEHOOKSTRUCT*)lparam;
	//add=lparam;
	
//fuck off.......edick head..asshole
	pt =add->pt;
	handle=WindowFromPoint(pt);
	ctrlid=GetDlgCtrlID(handle);
//	GetClassName(handle,buffer,30);
	SendMessage(hWnd,WM_USER+50,WPARAM(handle),ctrlid);
	return(CallNextHookEx(hhook,code,wparam,lparam));
	
}

