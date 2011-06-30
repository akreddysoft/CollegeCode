#include<dos.h>
void main()
{
 char ch;
 union REGS i,o;
 clrscr();
	printf("Enter a key:");
	ch=getche();
	printf("\nAscii=%d",ch);
		i.h.ah=0;
		printf("\nPress another:");
		int86(0x16,&i,&o);
		printf("\nscan code=%d",o.h.ah);
	 getch();     //doubt getch doesnt work when we press arrow keys or func second time
//	getch();      //it may work only with non zero ascii
}