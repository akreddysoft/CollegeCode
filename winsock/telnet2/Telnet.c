//TELNET SERVER
#include<windows.h>
#include<stdio.h>
#include<stdlib.h>
#define TELNET_PORT 23
/////////////////////////////////////
int displaymenu();
int startserver();
int stopserver();
void cleanup();
int closethread(SOCKET);
DWORD WINAPI handleclient(SOCKET);
DWORD WINAPI starts();
int getdata(SOCKET clientsocket,char *str,int pass);
///////////GLOBAL/////////////////////
HANDLE tstars=0,stopserverevent;
SOCKET listensocket;
int win2kxp=0;

/////////////////////////////////////////
int main(int argc,char **argv)
{
	
	char ch;
	int err;
	int retval;
	OSVERSIONINFO vi;

	vi.dwOSVersionInfoSize =sizeof(OSVERSIONINFO);
	
	GetVersionEx(&vi);
	if(vi.dwMajorVersion >4)
		win2kxp=1;

	CreateEvent(0,0,1,"madhurevent");
	err=GetLastError();
	if(err==0xb7)
	{
		printf("\nAnother instance of server is already running");
		ExitProcess(EXIT_SUCCESS);
	}
	

	printf("\n\nTelnet Server v 1.0 Administration");
	displaymenu();
	while(1)
	{
		printf("\n\nChoose the option[0-2]:");
		fflush(stdin);
		ch=fgetc(stdin);
		switch(ch)
		{
		case '0':
			cleanup();
			break;
	
	
		case '1':
			retval=startserver();
			if(retval==0)
				printf("\nThe server did not start successfully");
			else if(retval==2)
				printf("\nThe server is already running");
			else if(retval==3)
				printf("\nThe server returned an unknown error");
			else
				printf("\nThe server started successfully");
			break;

	
		case '2':
			retval=stopserver();
			if(retval==0)
				printf("\nThe server is either not running or unable to stop");
			else
				printf("\nThe server stopped successfully");
	
			break;

		default:
			break;
	
		}
	
		fflush(stdout);
	}

	return EXIT_SUCCESS;
}



int displaymenu()
{
		printf("\n\nSelect one of the options\n\n");
		printf("\n0) Quit this application");
		printf("\n1) Start the server");
		printf("\n2) Stop the server");
		return 0;
}


void cleanup()
{
	//stop the server if running
	int retval=stopserver();
	if(retval==1)
		printf("\nThe running server was stopped");

	WSACleanup();
	ExitProcess(EXIT_SUCCESS);
}


int startserver()
{
	
	int retval;
	DWORD tid;
	DWORD exitcode;
	
	retval=WaitForSingleObject(tstars,0);
	if(retval==WAIT_OBJECT_0 ||retval==WAIT_FAILED)//if either restarting the server or starting server for first time
	{
		stopserverevent=CreateEvent(0,0,0,0);
		tstars=CreateThread(0,0,starts,0,0,&tid);
		if(tstars==NULL)
		{
			retval=GetLastError();
			printf("\nFatal Error: Could not spawn a thread. Error code: %d",retval);
			return 3;	//3 for unknown error
		}

		GetExitCodeThread(tstars,&exitcode);
		if(exitcode==0)
			return 0;	//the server did not start
		else
			return 1;	//server started successfully
	}
	else if(retval==WAIT_TIMEOUT)	//the server running
		return 2;
	else
		return 3;		//unknown error

}


DWORD WINAPI starts()
{		
	WSADATA wsadata;
	SOCKET clntsocket;
	struct sockaddr_in sockad,newsockad;
	HANDLE tpop;
	
	int	i=WSAStartup(2,&wsadata);
	if(i!=0)
	{
		fprintf(stderr,"Error in starting Winsock");
		return 0;
	}
	if(wsadata.wVersion !=2)
	{
		fprintf(stderr,"Error:Older Winsock version");
		return 0;
	}

	listensocket=socket(AF_INET,SOCK_STREAM,IPPROTO_TCP);
	if(listensocket==INVALID_SOCKET)
	{
		fprintf(stderr,"Cannot Create Socket");
		return 0;
	}

	sockad.sin_addr.S_un.S_addr  =INADDR_ANY;
	sockad.sin_port =htons(TELNET_PORT);		//listening on port 23
	sockad.sin_family =AF_INET  ;

	i=bind(listensocket,(struct sockaddr *)&sockad,sizeof(sockad));

	if(i==INVALID_SOCKET)
	{
		fprintf(stderr,"Socket Binding Error");
		return 0;
	}

	i=listen(listensocket,SOMAXCONN);
	if(i==INVALID_SOCKET)
	{
		fprintf(stderr,"Cannot perform passive open on Socket");
		return 0;
	}
	
	i=sizeof(newsockad);

	while(1)	//main listening loop
	{
		DWORD tid;	//must for win9x, not so for win 2k/xp
		clntsocket=accept(listensocket,(struct sockaddr *)&newsockad,&i);
		if(clntsocket==INVALID_SOCKET)
			fprintf(stderr,"Error in accepting incoming connection");
		else
		{
			tpop=CreateThread(0,0,handleclient,clntsocket,0,&tid);
			if(tpop==NULL)
			{
				int retval=GetLastError();
				printf("\nFatal Error: Could not spawn a thread. Error code: %d",retval);
				return 3;	//3 for unknown error
			}

			printf("\n\nIncoming connection accepted from %s:%d",inet_ntoa(newsockad.sin_addr),ntohs(newsockad.sin_port ));
		}
	}


	return 1;
}


int stopserver()
{
	int retval;
	
	retval=SetEvent(stopserverevent);
	TerminateThread(tstars,0);
	retval=closesocket(listensocket);
	if(retval==0)
		return 1;
	else
		return 0;
}



DWORD WINAPI handleclient(SOCKET clientsocket)
{
	char *logo= "\t\t==============================\n\r"\
				"\t\tWelcome to Telnet Server v 1.0\n\r"\
				"\t\t==============================\n\r\n\r"\
				"login:";

	char buff[1024];
	int retval,ret;
	char *ok="\n\rAuthentication Successful\n";
	char *notok="\n\rAuthentication Failure\n";
	char *ps="\n\r#$ ";
	char *pass="\n\rPassword: ";
	char dosline[10],cmdline[80];
	char user[50],password[50];
	char *crlf="\r\n";
	int i;

 	STARTUPINFO startupinfo;
 	PROCESS_INFORMATION pinfo;
 	SECURITY_ATTRIBUTES sat;

	HANDLE hRead,hWrite;
	int bytesRead;

	///HANDSHAKE DATA//////////////////
	char peer1_0[] = {
	0xff, 0xfb, 0x01, 0xff, 0xfd, 0x03, 0xff, 0xfd, 
	0x1f, 0xff, 0xfe, 0x00, 0xff, 0xfe, 0x00};

	char peer2_0[]={0xff,0xfe,0x1f,0xff,0xfe,0x20,0xff,0xfe,0x18,0xff,0xfe,0x27,0xff,0xfe,0x24};
	char peer3_0[]={0xff,0xfd,0x24};
//////////////////////////
	sat.nLength=sizeof(SECURITY_ATTRIBUTES) ;
	sat.lpSecurityDescriptor=NULL ;
   	sat.bInheritHandle=TRUE ;
	
	if(win2kxp==1)
		strcpy(dosline,"cmd /c ");
	else
		strcpy(dosline,"command.com /c ");

	/////////////DO HANDSHAKING//////////////////////////
	send(clientsocket,peer1_0,15,0);
	send(clientsocket,logo,strlen(logo),0);
	retval=recv(clientsocket,buff,1024,0);
	retval=send(clientsocket,peer2_0,15,0);
	retval=recv(clientsocket,buff,1024,0);
	retval=send(clientsocket,peer3_0,3,0);
	retval=recv(clientsocket,buff,1024,0);

	retval=send(clientsocket,peer3_0,3,0);
//	retval=recv(clientsocket,buff,1024,0);

	retval=getdata(clientsocket,buff,0);
	////////////////////////////////////////////
	printf("hello");
	retval=getdata(clientsocket,user,0);
	printf("hello");
	if(retval==0)
	{
		printf("\nConnection closed by client");
		closethread(clientsocket);
		return 1;
	}
	send(clientsocket,pass,strlen(pass),0);
	
	retval=getdata(clientsocket,password,0);
	if(retval==0)
	{
		printf("\nConnection closed by client");
		closethread(clientsocket);
		return 1;
	}
	printf("start:");
	for(i=0;i<=strlen(user);++i)
	{
		printf("%d  ",user[i]);
	}
	printf("\n");
	for(i=0;i<=strlen(password);++i)
	{
		printf("%d  ",password[i]);
	}

	
	retval=strcmp(user,"madhur");
	ret=strcmp(password,"client");

	if(retval==0 &&ret==0)
		send(clientsocket,ok,strlen(ok),0);
	else
	{	
		send(clientsocket,notok,strlen(notok),0);
		closethread(clientsocket);
		return 1;
	}

	//retval=getdata(clientsocket,buff,0);
	while(1)
	{
		int i;
		char command[25];
		i=WaitForSingleObject(stopserverevent,0);
		if(i==WAIT_OBJECT_0)
		{	
			closesocket(clientsocket);
			return 0;
		}

		retval=send(clientsocket,ps,strlen(ps),0);	
		if(retval==SOCKET_ERROR)
		{
			printf("\nConnection broken");
			break;
		}
		retval=getdata(clientsocket,command,0);
		if(retval==0)
		{	
			printf("\nConnection closed by client");
			closethread(clientsocket);
			return 1;
		}
		i=strcmp(command,"quit");
		if(i==0)
		{
			closethread(clientsocket);
			return 1;
		}

		strcpy(cmdline,dosline);
		strcat(cmdline,command);
	
		i=CreatePipe(&hRead,&hWrite,&sat,0 );
		
	    	startupinfo.cb=sizeof(STARTUPINFO) ;
	    	GetStartupInfo(&startupinfo );
	                                  	
	    	startupinfo.hStdOutput=hWrite;
	    	startupinfo.hStdError=hWrite;
	   	startupinfo.dwFlags= STARTF_USESHOWWINDOW| STARTF_USESTDHANDLES ;
	    	startupinfo.wShowWindow=SW_HIDE ;
	   	
		i=CreateProcess(0,cmdline, 0, 0, TRUE, 0, 0, 0, &startupinfo, &pinfo );
		if(i==0)
		{
			i=GetLastError();
			printf("\nError:cannot create pipe,Error code:%d",i);
			ExitProcess(EXIT_FAILURE);
		}
	
		send(clientsocket,crlf,2,0);
		CloseHandle(hWrite);
	
		RtlZeroMemory(&buff,1024);
	    	bytesRead=1;
		while(bytesRead!=0)
		{
			ReadFile(hRead,&buff,1023,&bytesRead,NULL );
			buff[bytesRead]=0;
			send(clientsocket,buff,strlen(buff),0);
		}

	}
	////////////////////////////////////
	closethread(clientsocket);
	return 0;
}


int closethread(SOCKET clientsocket)
{

	int ret,retval;
	struct sockaddr_in sockad;
	ret=sizeof(sockad);	
	retval=getpeername(clientsocket,(struct sockaddr *)&sockad,&ret);
	if(retval==0)
		printf("\nConnection closed : %s:%d\n",inet_ntoa(sockad.sin_addr),ntohs(sockad.sin_port ));
	
	closesocket(clientsocket);
	return 1;
}


int getdata(SOCKET clientsocket,char *str,int pass)
{
	int retval=0;
	char buff[25];
	int i=0;
	while(1)
	{
		retval=recv(clientsocket,buff,2,0);
		if(retval==1)	
		{
			send(clientsocket,buff,1,0);
			str[i++]=buff[0];
		}
		else if(retval==2)
		{
			if(buff[0]==13&&buff[1]==10)
			{
				if(i==0)
				{
					strcpy(str,"\r\n");
					return 1;
					i=1;
				}				//here we dont want return val to 0
				break;
			}
		}
		else if(retval==0)
			return 0;

	}
		str[i]=0;
		return i;

}
