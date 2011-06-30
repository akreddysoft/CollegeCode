#include<dos.h>
#include<conio.h>
#include<stdio.h>
void main()
{
 union REGS i,o;
 char ch;
 clrscr();
 i.h.ah=0;
 while(getch()!='c')
 {
	int86(0X16,&i,&o);
	switch(o.h.ah)
	{
	 case 72:
	 printf("up");
	 break;
	 case 80:
	 printf("Down");
	 break;
	 case 75:
	 printf("Left");
	 break;
	 case 77:
	 printf("Right");
		break;
	 default:
	 printf("Other");
	}
 }
 getch();
}