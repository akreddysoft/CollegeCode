#include<dos.h>
void main()
{
 union REGS i,o;
 clrscr();
 i.h.ah=0x30;
 int86(0x21,&i,&o);
 printf("Version=%d",o.h.al);
}