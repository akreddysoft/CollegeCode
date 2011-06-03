#include<stdio.h>
#include<stdlib.h>
#include<conio.h>
int main(int argc,char **argv)
{
	
	FILE *fl;
	char *buffer;
	long filesize;
	int a,linecount=0,i;
	
	if(argc==1)
	{
		printf("Edit v 1.0\n");
		printf("\nWritten By Madhur");
		return EXIT_SUCCESS;
	}
	
	fl=fopen(argv[1],"rt");
	if(fl==NULL)
	{
		fprintf(stderr,"\nCannot Open File:%s",argv[1]);
		return EXIT_FAILURE;
	}

	fseek(fl,0,SEEK_END);
	filesize=ftell(fl);
	fseek(fl,0,0);
//	filesize=ftell(fl);

	buffer=malloc(filesize);
   //	a=fread(buffer,1,filesize,fl);
   //	buffer[filesize-45]=0;

	for(i=0;i<filesize;++i)
	{
		if(buffer[i]=='\n')
		{
			linecount++;
		}
	}


	for(i=0;i<linecount;++i)
	{

		char buff[80];
		getline(fl,buff);
		printf("%s",buff);
		if(i==48)
			break;

	}



	while(!kbhit())
	{
		char ch=getch();
		char buff[80];
		if(ch=='q')
			return EXIT_SUCCESS;
		if(ch==77)
		{
			getline(fl,buff);
			printf("%s",buff);
		}



	}


	return EXIT_SUCCESS;
}


int getline(FILE *fl,char buff[80])
{
	int i=0;
	while(fread(buff+i,1,1,fl))
	{
		if(buff[i]=='\n')
			break;
		++i;
	}
	buff[i]='\n';
	buff[i+1]=0;
	return 0;
}