#include<windows.h>
#include<stdio.h>
#include<stdlib.h>
#define TELNET_PORT 23

int displaymenu();

int startserver();
int stopserver();
void cleanup();
int closethread(SOCKET);
DWORD WINAPI handleclient(SOCKET);
DWORD WINAPI starts();
HANDLE tstars=0,stopserverevent;
SOCKET listensocket;
int win2kxp=0;

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
		ExitProcess(0);
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
	ExitProcess(0);
}


startserver()
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
		return 3;

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

	while(1)
	{
		DWORD tid;
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
			
				ExitProcess(EXIT_FAILURE);	//3 for unknown error
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

	char buff[1024],buff1[1024];
	int retval,ret;
	char *ok="\n\rAuthentication Successful\n";
	char *notok="\n\rAuthentication Failure\n";
	char *ps="\n\r#$ ";
	char *pass="\n\rPassword: ";
	char dosline[255];

 	STARTUPINFO startupinfo;
 	PROCESS_INFORMATION pinfo;
 	SECURITY_ATTRIBUTES sat;
	char cmdline[80]="cmd /c ";
	HANDLE hRead,hWrite;
	int bytesRead;

//////////////////////////
	sat.nLength=sizeof(SECURITY_ATTRIBUTES) ;
	sat.lpSecurityDescriptor=NULL ;
   	sat.bInheritHandle=TRUE ;
	
	if(win2kxp==1)
		strcpy(dosline,"cmd /c ");
	else
		strcpy(dosline,"command.com /c ");

	send(clientsocket,logo,strlen(logo),0);
	
	retval=recv(clientsocket,buff,1024,0);
	if(retval==0)
	{
		
		printf("\nConnection closed by client");
		//closesocket(clientsocket);
		closethread(clientsocket);
		return 1;
	}

	buff[retval]=0;

	send(clientsocket,pass,strlen(pass),0);
	retval=recv(clientsocket,buff1,1024,0);
	if(retval==0)
	{
		printf("\nConnection closed by client"); 
		closethread(clientsocket);
		return 1;
	}
	buff1[retval]=0;


	retval=strcmp(buff,"madhur\n");
	ret=strcmp(buff1,"client\n");

	if(retval==0 &&ret==0)
		send(clientsocket,ok,strlen(ok),0);
	else
	{	
		send(clientsocket,notok,strlen(notok),0);
		
		closethread(clientsocket);
		return 1;
	}


////////////////////////////////////////////
	send(clientsocket,ps,strlen(ps),0);	
	retval=recv(clientsocket,buff,1024,0);
	while(1)
	{
		int i;
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
		retval=recv(clientsocket,buff,1024,0);

		if(retval==0)
		{
			printf("\nConnection closed by client");
			break;
		}
		else if (retval==SOCKET_ERROR)
		{
			printf("\nConnection broken");
			break;
		}

		if(win2kxp==0)	//due to difference in terminals
			buff[retval-1]=0;	
		else
			buff[retval]=0;

		strcpy(cmdline,dosline);
		strcat(cmdline,buff);
	
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