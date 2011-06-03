#include<stdlib.h>
#include<conio.h>
void main()
{
char mdd[10]={"madhur$"};
clrscr();
asm
{
asm  DB  'madhur$'
asm mov ah,9h
asm lea dx,md
asm int 21h
}


getch();
}