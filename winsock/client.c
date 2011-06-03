#include<stdio.h>


int main()
{


	struct sockaddr_in sockad;
	SOCKET sock;
	int ret,readcount=1;
	char buffer[1024];
	
	sock=socket(AF_INET,SOCK_STREAM,0);
	if(sock==INVALID_SOCKET)
	{
		printf("\nCannot create socket");
		return EXIT_FAILURE;
	}
	
	
	sockad.sin_family=AF_INET;
	sockad.sin_port=htons(4444);
	sockad.sin_addr.addr=inet_addr("127.0.0.1");
	
	ret=connect(sock,&sockad,sizeof(sockad));
	if(ret==SOCKET_ERROR)
	{
		printf("\nsocket connection failed");
		return EXIT_FAILURE;
	}
	
	
	send(sock,"madhur",6,MSG_DONTROUTE);
	
	closesocket(sock);
	
	return EXIT_SUCCESS;
}
	
	
	
	
	
	