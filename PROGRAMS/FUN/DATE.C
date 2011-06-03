#include<dos.h>
void main()
{
 union REGS x,y;
 int hours,min,sec;
 clrscr();
 x.h.ah=0x02;
 int86(0x1A,&x,&y);
 hours=y.h.ch;
 min=y.h.cl;
 sec=y.h.dh;
 printf("%x %x %x",hours,min,sec);
}