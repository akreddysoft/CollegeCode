#include<windows.h>
#include<stdlib.h>
#include<stdio.h>

DWORD WINAPI tprint(SOCKET sock);
int main(int argc,char **argv)
{
	int port;
	char hostname[255];
	int retval,i;
	HOSTENT *host;
	struct sockaddr_in sockad;
	SOCKET sock;
	WSADATA wsadata;
	struct in_addr *pinAddr;
	char buff[1024];
	HANDLE thprint;
	DWORD tid;

	if(argc==1)
	{
		printf("\nUsage : Telnet hostname port");
		return EXIT_SUCCESS;
	}
	else if(argc==2)
	{
		printf("\nEither hostname of port is missing");
		return EXIT_SUCCESS;
	}
	else
	{
		port=atoi(argv[2]);
		strcpy(hostname,argv[1]);
	}

	i=WSAStartup(2,&wsadata);

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

	host=gethostbyname(hostname);
	if(host==0)
	{
		fprintf(stderr,"\nUnable to resolve hostname");
		return EXIT_FAILURE;
	}
	else
		pinAddr=host->h_addr_list [0];
	
	sockad.sin_addr =*pinAddr;
	sockad.sin_family =AF_INET;
	sockad.sin_port =htons(port);

	
	sock=socket(AF_INET,SOCK_STREAM,0);
	if(sock==INVALID_SOCKET)
	{
		fprintf(stderr,"\nError:Cannot Create socket");
		return EXIT_FAILURE;
	}

	retval=connect(sock,(struct sockaddr *)&sockad,sizeof(sockad));
	if(retval==SOCKET_ERROR)
	{
		fprintf(stderr,"\nUnable to connect to %s",hostname);
		return EXIT_FAILURE;
	}

	thprint=CreateThread(0,0,tprint,sock,0,&tid);

	while(1)
	{
		int ret;
		fgets(buff,1024,stdin);
		
		ret=strcmp(buff,"quit\n");
		if(ret==0)
			break;

		ret=send(sock,buff,strlen(buff),0);

		if(ret==SOCKET_ERROR)
		{
			printf("\nconnection to host lost");
			ExitProcess(EXIT_FAILURE);
		}
		fflush(stdin);
	}
	TerminateThread(thprint,0);	//this must be above closesocket, otherwise this thread gets socket_error
	closesocket(sock);
	
	WSACleanup();
	return EXIT_SUCCESS;
}


DWORD WINAPI tprint(SOCKET sock)
{

	char buff[1024];
	while(1)
	{
		int ret;
	
		ret=recv(sock,buff,1024,0);
		if(ret==0)
		{	
		
			printf("\nConnection gracefully closed by server");
			return 1;
		}
		else if(ret==SOCKET_ERROR)
		{	
			
			printf("\nConnection closed on server side");
			return 1;
		}
		else
		{
			buff[ret]=0;
			printf(buff);
		}
	}
	
	closesocket(sock);
	return 2;
}
