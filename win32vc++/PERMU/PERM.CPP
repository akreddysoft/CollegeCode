#include<windows.h>
#include "resource.h"
///////////////////////////////////////////////////////////////////////////
char buffer[30];
char windowhandle[10],edithandle[10],buthwnd[10],naghandle[10],nagid[10],butid[10],regcode[20];
HWND windhandle,edhandle,butonhwnd,nagbuthandle;
LPARAM lparam1;
long wparam1;
unsigned long tid;
int butonid,nagbutid;
DWORD tid1;
HWND hwnd1;
HINSTANCE hinst1;
char newstr[20];
char str[20]={"12345"},ret[20];
void brute(char str1[20]);
int len;
HANDLE th;

///////////////////////////////////////////////////////////////////////////////
long fact(int);
BOOL CALLBACK dlgproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam);
unsigned long WINAPI tproc(void *);
void inc(char [12]);

/////////////////////////////////////////////////////////////////////////////
int WINAPI WinMain(HINSTANCE hinst,HINSTANCE hprev,LPSTR cmdline,int cmdshow)
{
	DialogBoxParam(hinst,MAKEINTRESOURCE(IDD_DIALOG1),0,dlgproc,0);
	return 0;
}

////////////////////////////////////////////////////////////////////////
DWORD WINAPI thproc(void *)
{
	POINT pt;
	HWND hWnd;
	int id;
	char handle[30];

	while(1)
	{	
		GetCursorPos(&pt);
		hWnd=WindowFromPoint(pt);
		_itoa(int(hWnd),handle,10);
		SetDlgItemText(hwnd1,IDC_WINDOW,handle);

		GetClassName(hWnd,buffer,20);
		SetDlgItemText(hwnd1,IDCLASS,buffer);

		id=GetDlgCtrlID(hWnd);
		_itoa(id,buffer,10);
		SetDlgItemText(hwnd1,IDC_ID,buffer);
		
		
		Sleep(100);
	}
}


BOOL CALLBACK dlgproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam)
{
	
	switch(msg)
	{
	case WM_INITDIALOG:

		hwnd1=hwnd;
		CreateThread(0,0,thproc,&hwnd,0,&tid1);
		break;

	case WM_USER+50:
		
		_itoa(wparam,buffer,10);		
		SetDlgItemText(hwnd,IDC_WINDOW,buffer);
		
		GetClassName(HWND(wparam),buffer,30);
		SetDlgItemText(hwnd,IDCLASS,buffer);

		_itoa(lparam,buffer,10);
		SetDlgItemText(hwnd,IDC_ID,buffer);
		
		break;

	case WM_COMMAND:
		switch(LOWORD(wparam))
		{
		case IDC_BRUTE:
			str[0]=0x31;
			str[1]=0x32;
			str[2]=0x33;
			str[3]=0x34;
			str[4]=0x35;
			str[5]=0;
			th=CreateThread(0,0,tproc,0,0,LPDWORD(tid));
			EnableWindow(GetDlgItem(hwnd,IDC_BRUTE),FALSE);
			if(th==NULL)
				MessageBox(hwnd,"unable to start","madhur",0);
			break;

		
		case IDTEST:
			GetDlgItemText(hwnd,IDC_HWND,windowhandle,100);
			GetDlgItemText(hwnd,IDC_EDHWND,edithandle,100);
			
			GetDlgItemText(hwnd,IDC_NAGHWND,naghandle,100);
			GetDlgItemText(hwnd,IDC_BUTID,butid,100);
			
			GetDlgItemText(hwnd,IDC_BUTHWND,buthwnd,100);
			GetDlgItemText(hwnd,IDC_BUTNAGID,nagid,100);
		
			windhandle=(HWND)atol(windowhandle);
			edhandle=(HWND)atol(edithandle);
		
			nagbuthandle=(HWND)atol(naghandle);
			butonid=atoi(butid);

			butonhwnd=(HWND)atol(buthwnd);
			nagbutid=atol(nagid);
			break;

		case IDC_TESTSET:
			SendMessage(edhandle,WM_SETTEXT,0,LPARAM("this is test string"));
			break;


		case IDC_TESTPRESS:
			wparam1=MAKEWPARAM(butonid,BN_CLICKED);
			lparam1=LPARAM(butonhwnd);
			SendMessage(windhandle,WM_COMMAND,wparam1,lparam1);
			break;

		case IDC_TESTPRESS1:
			wparam1=MAKEWPARAM(nagbutid,BN_CLICKED);
			lparam1=LPARAM(nagbuthandle);
			SendMessage(windhandle,WM_COMMAND,wparam1,lparam1);
			break;
		
		case IDEXIT:
			EndDialog(hwnd,0);
			break;

		case IDC_SUSPEND:
			SuspendThread(th);
				EnableWindow(GetDlgItem(hwnd1,IDC_BRUTE),TRUE);
			break;

		case IDC_RESET:
			TerminateThread(th,0);
			EnableWindow(GetDlgItem(hwnd1,IDC_BRUTE),TRUE);
			break;
		
		}
		break;

		case WM_CLOSE:
			EndDialog(hwnd,0);
			break;
		
		break;

		default:
			return 0;
	}
	return 1;
}

/*unsigned long WINAPI tproc(void *)
{

			int i=0;
			char buff[10];
			len=strlen(str);
			for(i=0;i<fact(len)-1;++i)
			{				
				brute(str);
				_itoa(i,buff,10);
				SetDlgItemText(hwnd1,IDC_COUNT,buff);
				
				SetDlgItemText(hwnd1,IDC_CURRENT,str);
				SendMessage(edhandle,WM_SETTEXT,0,LPARAM(str));			
				wparam1=MAKEWPARAM(butonid,BN_CLICKED);
				lparam1=LPARAM(butonhwnd);
				PostMessage(windhandle,WM_COMMAND,wparam1,lparam1);
				Sleep(10);
			}
			EnableWindow(GetDlgItem(hwnd1,IDC_BRUTE),TRUE);
			return 0;
}*/


unsigned long WINAPI tproc(void *)
{

			long i=0;
			char buff[12]={"00000000000"};
			
			while(1)
			{				
				SetDlgItemText(hwnd1,IDC_COUNT,buff);

				SetDlgItemText(hwnd1,IDC_CURRENT,buff);
				SendMessage(edhandle,WM_SETTEXT,0,LPARAM(buff));			
				wparam1=MAKEWPARAM(butonid,BN_CLICKED);
				lparam1=LPARAM(butonhwnd);
				PostMessage(windhandle,WM_COMMAND,wparam1,lparam1);
				
				inc(buff);
				//Sleep(10);
			}
			EnableWindow(GetDlgItem(hwnd1,IDC_BRUTE),TRUE);
			return 0;
}



void inc(char buff[12])
{
	char *ch=&buff[10];
	int index=atoi(ch);
	if(buff[index]=='9'&&index==0)
	{
		buff[index]='1';
		buff[++index]='0';
	}
	else
	{
		if(buff[index]=='9')
		{
			buff[index]='0';
			++buff[index-1];
		}
		++buff[index];
	}
}	
	
/*
void brute(char str1[20])
{
	int i,m;
	char am;

	for(i=len-1;i>=0;--i)
		 if(str1[i-1]<str1[i])
		 {
			  m=i;
			  break;
		 }
	for(i=0;i<m-1;++i)
		newstr[i]=str1[i];
	int index=i;

	am=str1[m-1];
	char bm=str1[m];
	for(i=m;i<len;++i)
		 if(bm>str1[i])
			 if(str1[i]>am)
				  bm=str1[i];
	newstr[index]=bm;

	for(i=m-1;i<len;++i)
		 if(str1[i]!=bm)
			  newstr[++index]=str1[i];

	for(i=m;i<len;++i)
		 for(int j=m;j<len-1;++j)
			  if(newstr[j]>newstr[j+1])
			  {
				   char t=newstr[j];
				   newstr[j]=newstr[j+1];
				   newstr[j+1]=t;
			  }

	newstr[++index]=0;
	strcpy(str1,newstr);
}
*/

long fact(int n)
{
	long fac=1;
	while(n>0)
	{
		  fac=fac*n;
		  n--;
	}
	return fac;
}
