#include <windows.h>

struct inidata
{
	char ipad[20];
	int time_interval;
};

char *inifile="spy.ini";
char *section="madhur";
char *sec1="Address";
//char *sec2="Time";

DWORD WINAPI lstproc(void *);
int WINAPI WinMain (HINSTANCE hinst,HINSTANCE dd,LPSTR cmdline,int cmdshow)
{
	WSADATA wsadata;
	char buffer[20];
	int i;
	SOCKET listensocket;
	sockaddr_in sockad;


	WSAStartup(2,&wsadata);
	if(i!=0)
	{
		MessageBox(0,"Winsock Error","Beller",MB_ICONSTOP);
		return 0;
	}
	if(wsadata.wVersion !=2)
	{
		MessageBox(0,"Older Winsock version","Beller",MB_ICONSTOP);
		return 0;
	}

	i=GetPrivateProfileString(section,sec1,0,inidata.ipad ,20,inifile);
	if(i!=0)
	{
		MessageBox(0,"Error","Error",0);
		ExitProcess(0);
	}
	
/*	while(GetMessage(&msg,0,0,0))
	{
		TranslateMessage(&msg);
		DispatchMessage(&msg);
	}*/

//	SetTimer(0,25,100,tproc);

	HANDLE mainthwnd=CreateThread(0,0,lstproc,0,0,0);


	return 1;

}

