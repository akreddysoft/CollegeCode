#include<stdio.h>
void main()
{
	FILE *nd;
/*
	FILE *nd=	fopen("c:\\atoexec.bat","r");
	clrscr();
	if(!nd)
	{
		printf("Error opeing file");
	}
	else
	{
	  printf("succes");

	  }*/

	clrscr();
	nd=fopen("c:\\autoexec.bat","r")&&printf("success") || printf("error opeing file")&&exit(1) ;
}
