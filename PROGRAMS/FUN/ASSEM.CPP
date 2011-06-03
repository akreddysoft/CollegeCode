#include<conio.h>
void main()
{
char str[]={"madhur$"};
char ch;
clrscr();
asm{
 mov	ah,09h
 lea	dx,str
 int	21h
 mov	ah,01h
 int	21h
 mo

}
}