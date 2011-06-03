#include <windows.h>
#include "resource.h"
#include "F:\programs\win32vc\general.h"
//why gethostname,getshostbyname creates another thread
//see IDC_HOSTADD
#define IDI_EXIT 50
typedef DWORD  (WINAPI *MYPROC) (HWND,DWORD,DWORD,DWORD); 
#define MENUID 6000

HINSTANCE hinst;
HWND hwnd;
//DWORD tid,tid1,tbuzzid;
	static HMENU hmenu;
	HMENU hpop;
	HANDLE tpop;
BOOL disturb,vi;
HANDLE thwnd;
SOCKET newsocket;
//////////INI DATA//////////
char *inifile="beller.ini";
char *sec1="Beller";
struct indata
{
	char wavefile[255];
	char hosts[100][255];
	int trans;
	int hostindex;
}inidata;
char indata[]="wavefile=ringin.wav";
char a[]="0=localhost";
char ab[]="hostindex=1";
char b[]="trans=1";
int cd=0;
static HANDLE closeevent;
//char buffer[255];
//////////////////////////////////////////////////////
DWORD WINAPI lstproc(void *);
DWORD WINAPI tproc(LPVOID s);
DWORD WINAPI tbuzz(void *s);
DWORD WINAPI sthread(void *s);
DWORD WINAPI dispinfo(void *);
DWORD playWAVEFile(HWND hWndNotify, LPSTR lpszWAVEFileName);
BOOL CALLBACK abtproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam);
BOOL CALLBACK optproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam);
BOOL CALLBACK popdlgproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam);
LRESULT CALLBACK dlgproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam);
BOOL WINAPI NetErrorHandler(HWND hwnd, 
                            DWORD dwErrorCode, 
                            LPSTR lpszFunction) ;
init();
void writeinifile();
BOOL CALLBACK addhostproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam);
/////////////////////////////////////////////////////////
int WINAPI WinMain(HINSTANCE hinst,HINSTANCE hprev,LPSTR cmdline,int cmdshows=SW_HIDE)
{
	
	init();

	::hinst =hinst;
	MSG msg;
	HWND hwnd;
	WNDCLASSEX wc;
	wc.cbClsExtra =0;
	wc.cbSize =sizeof(wc);
	wc.cbWndExtra =DLGWINDOWEXTRA;
	wc.hbrBackground =HBRUSH(COLOR_WINDOW+1);
	wc.hCursor =LoadCursor(0,IDC_ARROW);
	wc.hIcon =LoadIcon(0,IDI_APPLICATION);
	wc.hIconSm =LoadIcon(0,IDI_APPLICATION);
	wc.hInstance =hinst;
	wc.lpfnWndProc =WNDPROC(dlgproc);
	wc.lpszClassName ="ahuja";
	wc.lpszMenuName =0;
	wc.style =CS_HREDRAW;

	RegisterClassEx(&wc);

	hwnd=CreateWindowEx(0,"ahuja","madhur",WS_OVERLAPPEDWINDOW,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,0,0,hinst,0);
	::hwnd=hwnd;
	ShowWindow(hwnd,SW_HIDE);
	while(GetMessage(&msg,0,0,0))
	{
		TranslateMessage(&msg);
		DispatchMessage(&msg);
	}
	
	return msg.wParam ;
}

init()
{
	char buffer[255];		
	WSADATA wsadata;
	int	i=WSAStartup(2,&wsadata);
	if(i!=0)
	{
		MessageBox(hwnd,"Winsock Error","Beller",MB_ICONSTOP);
		return 0;
	}
	if(wsadata.wVersion !=2)
	{
		MessageBox(HWND(hwnd),"Older Winsock version","Beller",MB_ICONSTOP);
		return 0;
	}
		
	i=GetPrivateProfileSection(sec1,buffer,sizeof(buffer),inifile);
	if(i==0)	//if the inifile doesnot exist
	{
		WritePrivateProfileSection(sec1,indata,inifile); //write initial section
		gethostname(inidata.hosts[0],255);
		WritePrivateProfileString(sec1,"0",inidata.hosts[0],inifile);	//write actual hostname
		inidata.hostindex ++;		//set initial hostindex
		//_itoa(inidata.hostindex ,buffer,10);
		//WritePrivateProfileString(sec1,"hostindex",buffer,inifile);
				
	}

	GetPrivateProfileString(sec1,"wavefile","ringin.wav",inidata.wavefile ,sizeof(inidata.wavefile) ,inifile);
	inidata.trans =GetPrivateProfileInt(sec1,"trans",1,inifile);
	inidata.hostindex =GetPrivateProfileInt(sec1,"hostindex",1,inifile);
	//get the hostindex first so that we can get nu\o of hosts
	for(i=0;i<inidata.hostindex ;++i)
	{
		_itoa(i,buffer,10);
		GetPrivateProfileString(sec1,buffer,"client",inidata.hosts [i],sizeof(inidata.hosts [i]),inifile);
	}
	return 1;
}


LRESULT CALLBACK dlgproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam)
{
	POINT pt;
	static HANDLE mainthwnd;

	DWORD butid;

	static char lhost[128];
	char event[]={"beller"};
	int i;
	static NOTIFYICONDATA note;
	OSVERSIONINFO vi;
//	char buffer[128];
//	NETRESOURCE nr;
	switch(msg)
	{
		case WM_CREATE:
		/*	retval=WNetOpenEnum(RESOURCE_CONNECTED,RESOURCETYPE_ANY,0,&nr,&j);
			if(retval==NO_ERROR)
				MessageBox(0,"SDF",0,0);
			NetErrorHandler(hwnd,retval,0);
			WNetGetLastError(&ab,buffer,128,buffer1,128);*/
			
			CreateEvent(0,0,0, event);
			i=GetLastError();
			if(i==0xb7)
			{
				MessageBox(hwnd,"Only one instance of program can be active","Beller",MB_ICONSTOP);
				ExitProcess(0);
			}
			
			vi.dwOSVersionInfoSize =sizeof(OSVERSIONINFO);
			GetVersionEx(&vi);
			if(vi.dwMajorVersion >4)
				::vi=1;
			
			//hmenu=LoadMenu(hinst,MAKEINTRESOURCE(IDR_MENU1));
			//hmenu=GetSubMenu(hmenu,0);
			hmenu=CreatePopupMenu();
			hpop=CreatePopupMenu();

			//create the initial menu////
			AppendMenu(hmenu,MF_UNCHECKED,40002,"&Do Not Disturb");
			AppendMenu(hmenu,MF_POPUP,UINT(hpop),"B&uzz to");
			AppendMenu(hmenu,MF_STRING,40003,"&Buzz");
			AppendMenu(hmenu,MF_STRING,40009,"&Options");
			AppendMenu(hmenu,MF_STRING,40005,"&About");
			AppendMenu(hmenu,MF_STRING,40001,"E&xit");
			SetMenuDefaultItem(hmenu,40003,0);
			/////////////////////////////////////////
			
			
			for(i=0;i<inidata.hostindex ;++i)
				AppendMenu(hpop,MF_STRING,MENUID+i,inidata.hosts [i]);
			
			note.cbSize =sizeof(NOTIFYICONDATA);
			note.hIcon =LoadIcon(hinst,MAKEINTRESOURCE(IDI_ICON3));
			note.hWnd =hwnd;
			note.uCallbackMessage =WM_USER+5;
			note.uID =25;
			note.uFlags =NIF_ICON | NIF_MESSAGE;
			Shell_NotifyIcon(NIM_ADD,&note);
			mainthwnd=CreateThread(0,0,lstproc,0,0,0);
			break;

		case WM_SIZE:
			ShowWindow(hwnd,SW_HIDE);
			break;
	
		case WM_COMMAND:
			switch(LOWORD(wparam))
			{
			case IDEXIT:
				SendMessage(hwnd,WM_CLOSE,0,0);
				break;

			case IDABOUT:
				DialogBoxParam(hinst,MAKEINTRESOURCE(IDD_ABOUT),hwnd,abtproc,0);
				break;

			case IDDISTURB:
				i=CheckMenuItem(hmenu,IDDISTURB,MF_BYCOMMAND);
				if(i==MF_CHECKED)
				{
					i=CheckMenuItem(hmenu,IDDISTURB,MF_BYCOMMAND|MF_UNCHECKED);
					note.hIcon =LoadIcon(hinst,MAKEINTRESOURCE(IDI_ICON3));
					Shell_NotifyIcon(NIM_MODIFY,&note);
					disturb=0;
				}
				else
				{
					i=CheckMenuItem(hmenu,IDDISTURB,MF_BYCOMMAND|MF_CHECKED);
					note.hIcon =LoadIcon(hinst,MAKEINTRESOURCE(IDI_ICON4));
					Shell_NotifyIcon(NIM_MODIFY,&note);
					disturb=1;
				}
				break;

			case IDOPTION:
				DialogBoxParam(hinst,MAKEINTRESOURCE(IDD_OPTIONS),hwnd,optproc,0);
				break;

			}
			butid=LOWORD(wparam);
			if(butid>=MENUID&&butid<MENUID+1000)
				CreateThread(0,0,tbuzz,inidata.hosts [butid-MENUID],0,0);
		break;

		case WM_USER+5:
		if(wparam==25)
		{
			if(lparam==WM_RBUTTONDOWN)
			{
				GetCursorPos(&pt);
				SetForegroundWindow(hwnd);
				TrackPopupMenu(hmenu,TPM_LEFTALIGN,pt.x,pt.y,0,hwnd,0);
				PostMessage(hwnd,WM_NULL,0,0);
			}
		}
		break;

		case WM_CLOSE:
			WSACleanup();
			TerminateThread(mainthwnd,0);
			PostQuitMessage(0);
			Shell_NotifyIcon(NIM_DELETE,&note);
			break;

		default:
			return(DefWindowProc(hwnd,msg,wparam,lparam));
	}
	return 0;

}


DWORD WINAPI lstproc(LPVOID h)
{
	SOCKET listensocket;
	sockaddr_in sockad,newsockad;
	int i;
	
	listensocket=socket(AF_INET,SOCK_STREAM,IPPROTO_TCP);
	if(listensocket==INVALID_SOCKET)
	{
		MessageBox(0,"Cannot Create Socket","Beller",MB_ICONSTOP);
		ExitProcess(0);
	}

	sockad.sin_addr.S_un.S_addr  =INADDR_ANY;
	sockad.sin_port =htons(4444);		//listening on port 4444
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
		if(disturb==1)
			return 1;

	    tpop=CreateThread(0,0,dispinfo,(void *)&newsockad,0,0);
		
		WaitForSingleObject(thwnd,INFINITE);
	}

	closesocket(listensocket);

	return 1;


}

//this thread is created whenever incoming connection is accepted
DWORD WINAPI tproc(void *newsock)
{

	int retval;
	static char buffer[5];
	int i;

	retval=recv(int(newsock),buffer,4,0);

	if(retval==SOCKET_ERROR)
	{
		MessageBox(0,"Error Receiving Data","Beller",0);
		return 1 ;
	}

	
	i=strcmp(buffer,"PLAY");	//check the code, at this time only play is supported
	if(i!=0)
	{
		MessageBox(0,"Received Data not identified: probably corrupted","Beller",0);
		return 1;
	}
	else
	{
		thwnd=CreateThread(0,0,tproc,(void *)newsocket,0,0);
	}

	//play the file
	while(1)
	{
	//playWAVEFile(0,"ringin.wav");
		PlaySound("ringin.WAV", NULL, SND_SYNC | SND_NODEFAULT); 
		int i=WaitForSingleObject(tpop,500);
		if(i==WAIT_OBJECT_0)
			break;
	}

	closesocket((int)newsock);

	return 1;

}

DWORD WINAPI tbuzz(void *hostname)
{

	static char buffer[5];
	int i;
	sockaddr_in sockad;
	char buff[]={"PLAY"};
	HOSTENT *hostent;
	
	
	SOCKET sock=socket(AF_INET,SOCK_STREAM, IPPROTO_TCP);
	hostent=gethostbyname((char*)hostname);
	if(hostent==0)
	{
		MessageBox(hwnd,"cannot resolve hostname","Beller",MB_ICONSTOP);
		return 1;
	}

	struct in_addr *pinAddr = ((LPIN_ADDR)hostent->h_addr_list[0]);
	char *ipad=inet_ntoa(*pinAddr);

	int ip=inet_addr(ipad);
	sockad.sin_addr.S_un.S_addr =ip;
	sockad.sin_family =AF_INET;
	sockad.sin_port =htons(4444);

	i=connect(sock,reinterpret_cast<sockaddr*>(&sockad),sizeof(sockad));
	if(i==SOCKET_ERROR)
	{
		MessageBox(hwnd,"Cannot Connect to Host","Beller",MB_ICONSTOP);
		return 0;
	}

	i=send(sock,buff,5,0);
	if(i==SOCKET_ERROR)
	{
		MessageBox(hwnd,"Data Send Error","Beller",MB_ICONSTOP);
		return 0;
	}

	closesocket(sock);
	return 1;

}


DWORD WINAPI	dispinfo(void *newsockad)
{
	DialogBoxParam(hinst,MAKEINTRESOURCE(IDD_POP),hwnd,popdlgproc,long(newsockad));		
	return 0;
}


BOOL CALLBACK popdlgproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam)
{	
	RECT rc;
	RECT dr;
	HMODULE user;
	static MYPROC mad;

	HDC hdc;
	char *buffer;
	char buff[20];
	HOSTENT *hostent;
    struct in_addr iaHost; 
	sockaddr_in *sockad;
	sockad=(sockaddr_in*)lparam;
	HBRUSH hbr;

	static int i=0,flag=0;
	static int timer=0;
	switch(msg)
	{
	case WM_INITDIALOG:
	
		buffer=inet_ntoa(sockad->sin_addr );
		SetDlgItemText(hwnd,IDC_IPAD,buffer);
		
		iaHost.S_un.S_addr=inet_addr(buffer);
		hostent=gethostbyaddr((const char*)&iaHost.S_un,sizeof in_addr,AF_INET);
		SetDlgItemText(hwnd,IDC_HOST,hostent->h_name );

		GetWindowRect(GetDesktopWindow(),&dr);
		GetClientRect(hwnd,&rc);
		
		SetTimer(hwnd,11,1000,0);
		MoveWindow(hwnd,dr.right -rc.right-50 ,dr.bottom  -rc.bottom-50 ,rc.right ,rc.bottom ,0);

		SetWindowPos(hwnd,HWND_TOPMOST,0,0,0,0, SWP_NOACTIVATE|SWP_NOSIZE|SWP_NOMOVE); 
		SetWindowLong(hwnd,GWL_STYLE,GetWindowLong(hwnd, GWL_STYLE) &~ WS_BORDER);
		
		if(vi&&inidata.trans)
		{
			user=GetModuleHandle("user32.dll");
			mad=(MYPROC)GetProcAddress(user,"SetLayeredWindowAttributes");
			SetWindowLong(hwnd,GWL_EXSTYLE,GetWindowLong(hwnd, GWL_EXSTYLE) | WS_EX_LAYERED);
			SetTimer(hwnd,10,10,0);
		}
			
		break;

	case WM_CTLCOLORDLG:
		hbr=CreateSolidBrush(RGB(166,202,240));
		return int(hbr);
	case WM_CTLCOLORSTATIC:
		hdc=(HDC)wparam;
		SetBkMode(hdc,TRANSPARENT);
	
		hbr=CreateSolidBrush(RGB(166,202,240));
		return int(hbr);
		break;

	case WM_TIMER:
		if(wparam==10)
		{
			(mad)(hwnd,RGB(0,0,0), (255 * i) / 100, LMA_ALPHA);
			if(flag==0)
				++i;
			else
				--i;
			if(i==100)
				flag=1;
			if(i==5)
				flag=0;

		}
		if(wparam==11)
		{
			timer=timer+1;
			itoa(timer,buff,10);
			SetDlgItemText(hwnd,IDC_TIME,buff);
		}

		break;

		case WM_COMMAND:
			switch(LOWORD(wparam))
			{
			case IDOK:
				SendMessage(hwnd,WM_CLOSE,0,0);
				break;
		
			}
		break;

		case WM_CLOSE:
			timer=0;
			EndDialog(hwnd,0);
			break;
			
		case WM_LBUTTONDOWN:
			SendMessage(hwnd,WM_CLOSE,0,0);
			break;

		default:
			return 0;
	}

	return 1;

}

DWORD playWAVEFile(HWND hWndNotify, LPSTR lpszWAVEFileName)
{
    UINT wDeviceID;
    DWORD dwReturn;
	char buffer[100];
    MCI_OPEN_PARMS mciOpenParms;
    MCI_PLAY_PARMS mciPlayParms;

    // Open the device by specifying the device and filename.
    // MCI will choose a device capable of playing the specified file.

	//strcat(lpszWAVEFileName," as madhur");

    mciOpenParms.lpstrDeviceType = "waveaudio";
    mciOpenParms.lpstrElementName = lpszWAVEFileName;
	//mciOpenParms.lpstrAlias ="fdsfd";
    if (dwReturn = mciSendCommand(0, MCI_OPEN,
       MCI_OPEN_TYPE | MCI_OPEN_ELEMENT, 
       (DWORD)(LPVOID) &mciOpenParms))
    {
        
		mciGetErrorString(dwReturn,buffer,sizeof buffer);
		MessageBox(0,buffer,0,0);
		// Failed to open device. Don't close it; just return error.
        return (dwReturn);
    }

    // The device opened successfully; get the device ID.
    wDeviceID = mciOpenParms.wDeviceID;

    // Begin playback. The window procedure function for the parent 
    // window will be notified with an MM_MCINOTIFY message when 
    // playback is complete. At this time, the window procedure closes 
    // the device.

    mciPlayParms.dwCallback = (DWORD) hWndNotify;
    if (dwReturn = mciSendCommand(wDeviceID, MCI_PLAY, MCI_NOTIFY, 
        (DWORD)(LPVOID) &mciPlayParms))
    {
        mciSendCommand(wDeviceID, MCI_CLOSE, 0, NULL);
        return (dwReturn);
    }

    return (0L);
}

BOOL CALLBACK abtproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam)
{	
	switch(msg)
	{
		case WM_COMMAND:
			switch(LOWORD(wparam))
			{
			case IDOK:
				SendMessage(hwnd,WM_CLOSE,0,0);
				break;
		
			}

			case WM_CLOSE:
				EndDialog(hwnd,0);
				break;

			default:
				return 0;
	}

	return 1;

}


BOOL CALLBACK optproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam)
{	
	static HWND cbohwnd;
	int i,j;
	static OPENFILENAME ofn;
//	static int temptrans=2;
	char buffer[100];
	static char wavefile[400]={""};
	static HWND chkhwnd;
	static struct indata inidata1;

	switch(msg)
	{
	case WM_INITDIALOG:
		inidata1=inidata;
		
		ZeroMemory(&ofn, sizeof(ofn));
		ofn.lStructSize =sizeof (ofn);
		ofn.hwndOwner =hwnd;
		ofn.hInstance =hinst;
		ofn.lpstrFilter = "Wave\0*.wav\0";
		ofn.nFilterIndex = 1;
		ofn.lpstrFileTitle = NULL;
		ofn.nMaxFileTitle = 0;
		ofn.lpstrInitialDir = NULL;
		ofn.lpstrFile =buffer;
		ofn.nMaxFile =400;
		ofn.Flags =OFN_FILEMUSTEXIST | OFN_PATHMUSTEXIST | OFN_LONGNAMES | OFN_EXPLORER | OFN_HIDEREADONLY ;
		ofn.lpstrFileTitle ="Open";
		
		if(vi==0)
		{
			chkhwnd=GetDlgItem(hwnd,IDC_TRANS);
			EnableWindow(chkhwnd,0);
		}
////////////////		
		SetDlgItemText(hwnd,IDC_WAVEFILE,inidata.wavefile);
		cbohwnd=GetDlgItem(hwnd,IDC_HOSTS);
		for(i=0;i<inidata.hostindex ;++i)
			SendMessage(cbohwnd,CB_ADDSTRING,0,(LPARAM)(LPCTSTR)inidata.hosts [i]);
		SendMessage(cbohwnd,CB_SETCURSEL,0,0);
		if(inidata.trans)
			CheckDlgButton(hwnd,IDC_TRANS,BST_CHECKED);
		else
			CheckDlgButton(hwnd,IDC_TRANS,BST_UNCHECKED);
		
		break;
///////////////////////////////////		

		case WM_COMMAND:
			switch(LOWORD(wparam))
			{
			case IDOK:
				inidata=inidata1;
			//	SendMessage(cbohwnd,CB_RESETCONTENT,0,0);

						
				for(i=0;i<inidata.hostindex;++i)
					RemoveMenu(hpop,MENUID+i,MF_BYCOMMAND);


				i=SendMessage(cbohwnd,CB_GETCOUNT,0,0);
				
				for(j=0;j<i;++j)
				{
					
					SendMessage(cbohwnd,CB_GETLBTEXT,j,(LPARAM)buffer);
					strcpy(inidata.hosts [j],buffer);
				}
				inidata.hostindex =i;

				SendMessage(hwnd,WM_CLOSE,0,0);
				writeinifile();
		

				for(i=0;i<inidata.hostindex ;++i)
					AppendMenu(hpop,MF_STRING,MENUID+i,inidata.hosts [i]);
				
				break;

					
			case IDC_APPLY:
			///	SendMessage(cbohwnd,CB_RESETCONTENT,0,0);
				inidata=inidata1;

				i=SendMessage(cbohwnd,CB_GETCOUNT,0,0);
				for(j=0;j<i;++j)
				{
					
					SendMessage(cbohwnd,CB_GETLBTEXT,j,(LPARAM)buffer);
					strcpy(inidata.hosts [j],buffer);
				}
				
				SendMessage(cbohwnd,CB_SETCURSEL,0,0);
				
			
				for(i=0;i<inidata.hostindex;++i)
					RemoveMenu(hpop,MENUID+i,MF_BYCOMMAND);

				for(i=0;i<inidata.hostindex ;++i)
					AppendMenu(hpop,MF_STRING,MENUID+i,inidata.hosts [i]);

				i=strcmp(wavefile,"");
				if(i!=0)
					strcpy(inidata.wavefile ,wavefile);

				writeinifile();
				break;

			case IDC_HOSTDELETE:
				i=SendMessage(cbohwnd,CB_GETCURSEL,0,0);
				SendMessage(cbohwnd,CB_DELETESTRING,i,0);
				i=SendMessage(cbohwnd,CB_SETCURSEL,i,0);
				if(i==CB_ERR)
					SendMessage(cbohwnd,CB_SETCURSEL,0,0);

				break;

			case IDCANCEL:
				SendMessage(hwnd,WM_CLOSE,0,0);
				break;

			case IDBROWSE:
				i=GetOpenFileName(&ofn);
	//			if(i==0)
	//				return 1;
				SetDlgItemText(hwnd,IDC_WAVEFILE,ofn.lpstrFile );
	//			strcpy(wavefile,ofn.lpstrFile );
				break;
			
			case IDC_HOSTADD:
				closeevent=CreateEvent(0,0,1,0);				
				DialogBoxParam(hinst,MAKEINTRESOURCE(IDD_ADDHOST),hwnd,addhostproc,(long)&inidata1 );
				SendMessage(cbohwnd,CB_RESETCONTENT,0,0);
				for(i=0;i<inidata1.hostindex ;++i)
					SendMessage(cbohwnd,CB_ADDSTRING,0,(LPARAM)(LPCTSTR)inidata1.hosts [i]);
				SendMessage(cbohwnd,CB_SETCURSEL,0,0);
				break;

			case IDC_TRANS:
				
				i=IsDlgButtonChecked(hwnd,IDC_TRANS);
				if(i==BST_CHECKED)
					inidata1.trans =1;	//set vals in temperorary structures
				else
					inidata1.trans =0;	

				break;
			}
			break;

			case WM_CLOSE:
				//WaitForSingleObject(closeevent,INFINITE);
				EndDialog(hwnd,0);
				break;

			default:
				return 0;
	}

	return 1;

}

void writeinifile()
{

		int i;
		char buff[3];
		for(i=0;i<inidata.hostindex ;++i)
		{
			_itoa(i ,buff,10);
			WritePrivateProfileString(sec1,buff,inidata.hosts[i],inifile);
		}
		_itoa(inidata.hostindex ,buff,10);
		WritePrivateProfileString(sec1,"hostindex",buff,inifile);
		WritePrivateProfileString(sec1,"wavefile",inidata.wavefile ,inifile);
		_itoa(inidata.trans ,buff,10);
		WritePrivateProfileString(sec1,"trans",buff,inifile);
	//	return 1;
}


BOOL CALLBACK addhostproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam)
{
	char hostname[255];
	HOSTENT *hostent;
	struct in_addr *pinAddr ;
	static struct indata *inidata2,inidata3; //must be static
	char *ipad;
	int i;
	switch(msg)
	{
	case WM_INITDIALOG:
		//inidata2=new struct indata;
		inidata2=(struct indata* )lparam;
		inidata3=*inidata2;
		
		//ResetEvent(closeevent);
		break;
		
		case WM_COMMAND:
			switch(LOWORD(wparam))
			{
			case IDOK:
				GetDlgItemText(hwnd,IDC_HOST,hostname,255);
				if(hostname!="")
				{
					
					strcpy(inidata3.hosts[inidata3.hostindex ],hostname);
					//strcpy(inidata.hosts [inidata.hostindex],hostname);
					//inidata.hostindex ++;
					inidata3.hostindex ++;
				}
				else
					MessageBox(hwnd,"Invalid HostName","Beller",0);
			
				*inidata2=inidata3;
				SendMessage(hwnd,WM_CLOSE,0,0);		
				break;
		
			
			case IDCANCEL:
				SendMessage(hwnd,WM_CLOSE,0,0);
				break;

			case IDC_CHECKCON:
				GetDlgItemText(hwnd,IDC_HOST,hostname,255);
				hostent=gethostbyname(hostname);
				if(hostent!=0)
				{
					pinAddr = ((LPIN_ADDR)hostent->h_addr_list[0]);
					ipad=inet_ntoa(*pinAddr);
					SetDlgItemText(hwnd,IDC_ADDIP,ipad);
				}
				else
				{					
					i=MessageBox(hwnd,"Could not resolve hostname,Add anyway?","Beller",MB_ICONQUESTION|MB_YESNO);
					
					if(i==IDYES)
						SendMessage(hwnd,WM_COMMAND,IDOK,(LPARAM)GetDlgItem(hwnd,IDOK));
					SetDlgItemText(hwnd,IDC_ADDIP,"");
				}
				break;
		
			}
			break;

			case WM_CLOSE:
				
				//delete inidata2;
				EndDialog(hwnd,0);
			//	SetEvent(closeevent);
				break;

			default:
				return 0;
	}

	return 1;
}

/*
BOOL WINAPI NetErrorHandler(HWND hwnd, 
                            DWORD dwErrorCode, 
                            LPSTR lpszFunction) 
{ 
    DWORD dwWNetResult, dwLastError; 
    CHAR szError[256]; 
    CHAR szCaption[256]; 
    CHAR szDescription[256]; 
    CHAR szProvider[256]; 
 
    // The following code performs standard error-handling. 
 
    if (dwErrorCode != ERROR_EXTENDED_ERROR) 
    { 
        wsprintf((LPSTR) szError, "%s failed; \nResult is %ld", 
            lpszFunction, dwErrorCode); 
        wsprintf((LPSTR) szCaption, "%s error", lpszFunction); 
        MessageBox(hwnd, (LPSTR) szError, (LPSTR) szCaption, MB_OK); 
        return TRUE; 
    } 
 
    // The following code performs error-handling when the 
    //  ERROR_EXTENDED_ERROR return value indicates that the 
    //  WNetGetLastError function can retrieve additional information.
 
    else 
    { 
        dwWNetResult = WNetGetLastError(&dwLastError, // error code
            (LPSTR) szDescription,  // buffer for error description 
            sizeof(szDescription),  // size of error buffer
            (LPSTR) szProvider,     // buffer for provider name 
            sizeof(szProvider));    // size of name buffer
 
        //
        // Process errors.
        //
        if(dwWNetResult != NO_ERROR) { 
            wsprintf((LPSTR) szError, 
                "WNetGetLastError failed; error %ld", dwWNetResult); 
            MessageBox(hwnd, (LPSTR) szError, 
                "WNetGetLastError", MB_OK); 
            return FALSE; 
        } 
 
        //
        // Otherwise, print the additional error information.
        //
        wsprintf((LPSTR) szError, 
            "%s failed with code %ld;\n%s", 
            (LPSTR) szProvider, dwLastError, (LPSTR) szDescription); 
        wsprintf((LPSTR) szCaption, "%s error", lpszFunction); 
        MessageBox(hwnd, (LPSTR) szError, (LPSTR) szCaption, MB_OK); 
        return TRUE; 
    } 
}
*/