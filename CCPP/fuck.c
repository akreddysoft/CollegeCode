#include<stdio.h>
void main()
{
 FILE *nd;
 clrscr();
 fopen("c:\\autoexec.bat","r")&&printf("success") || printf("error opeing file")&&exit(1);
}
