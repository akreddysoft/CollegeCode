void main()
{
char mdd[10]={"madhur$"};
char far *s;
s=0xb8000000;
clrscr();
{
asm mov ah,9h
asm lea dx,mdd
asm int 21h
asm mov ax,B800h
asm mov bx,0000

//asm mov ax,b800h


}
getch();
}