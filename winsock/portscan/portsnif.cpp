#include<windows.h>
#include<stdio.h>
char *inifile="portsnif.dat";
char *tcpsec="TCP_Ports";
char *udpsec="UDP_Ports";

int atom(char *);
int main(int argc,char *argv[])
{
	WSADATA wsadata;
	int i;
	SOCKET sock;
	sockaddr_in sockad;
	long portcount;
	char buffer[1024],host[15];
	int pt1,pt2;

	if(argc==1)
	{
		printf("\nPort Scanner v 1.0\n");
		printf("Written by Madhur\n");
		printf("\nUse: portsnif [-r=m-n] hostname or ip\n");
		printf("Options : \n");
		printf("-r:Specify port range to scan\n");

		return EXIT_SUCCESS;
	}
	else
	{
		if(argc==2)
		{
			strcpy(host,argv[1]);
			pt1=1;
			pt2=50;
		}
		if(argc==3)
		{
		//	atom("1234");
			//printf(&argv[1][3]);
			//printf("\n");
			//printf(&argv[1][5]);
			strcpy(host,argv[2]);
			pt1=atom(&argv[1][3]);
			char *sec=strstr(&argv[1][3],"-");
			pt2=atom(++sec);
		//	printf("\n%d\n%d",pt1,pt2);
		}
	}

	WSAStartup(2,&wsadata);
	if(wsadata.wHighVersion <2)
	{
		printf("Older Winsock version\n");
		return EXIT_FAILURE;
	}
	
	i=GetPrivateProfileSection(tcpsec,buffer,1024,inifile);
	if(i==0)
	{
		fprintf(stderr,"\nportsnif.dat not found\n\n");
		return EXIT_FAILURE;
	}

	portcount=pt1;
	HOSTENT *hostent=gethostbyname(host);
	if(hostent==NULL)
	{
		fprintf(stderr,"\nCannot Resolve hostname : %s\n\n",host);
		return EXIT_FAILURE;
	}
	struct in_addr *pinAddr = ((LPIN_ADDR)hostent->h_addr_list[0]);
	char *ipad=inet_ntoa(*pinAddr);
	int ip=inet_addr(ipad);

	sockad.sin_addr.S_un.S_addr =ip;
	sockad.sin_family =AF_INET;
	printf("\nOpen TCP Ports :\n\n");
	while(portcount<pt2)
	{
		
		sockad.sin_port =htons(portcount);
		
		sock=socket(AF_INET,SOCK_STREAM,IPPROTO_TCP);
		if(sock==INVALID_SOCKET)
		{
			printf("Cannot Create Socket\n");
			return 1;
		}

		i=connect(sock,reinterpret_cast<sockaddr*>(&sockad),sizeof(sockad));

		if(i!=SOCKET_ERROR)
		{
			char isec[4];
			_itoa(portcount,isec,10);
			GetPrivateProfileString(tcpsec,isec,"1",buffer,1024,inifile);
			printf("Port %d:  %s\n",portcount,buffer);
		}

		closesocket(sock);
		portcount++;
	}
	WSACleanup();

	return 0;
}


int atom(char *str)
{
	int i=0;
	int num=0;
	while(1)
	{
		if(str[i]>='0'&&str[i]<='9')
		{
			
			num=num+str[i]-'0';
			num=num*10;
		}
		else
			break;
		++i;
	}
	num=num/10;

	return num;
}

