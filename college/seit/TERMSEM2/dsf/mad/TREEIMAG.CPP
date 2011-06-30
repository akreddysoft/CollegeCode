#include<iostream.h>
#include<fstream.h>
#include<process.h>
#include<graphics.h>
#include<conio.h>
#include<stdio.h>
#include<string.h>
#include<dos.h>
#include<stdlib.h>
struct node
{
char a[10];
node*lt,*rt;
};

char ch;
void gettree(node*trev,int x,int y)
{
gotoxy(x,y);
fflush(stdin);
gets(trev->a);
gotoxy(1,25);
printf("want to enter the left  node to %6s (y/n)  \b",trev->a);
fflush(stdin);
ch=getche();
if(ch=='y'||ch=='Y')
{
gotoxy(x-1,y+1);
printf("/");
gotoxy(x-2,y+2);
printf("/");
node*temp;
temp=(node*)malloc(sizeof(node));
trev->lt=temp;
gettree(temp,x-3,y+3);
}
else
trev->lt=NULL;
gotoxy(1,25);
printf("want to enter the right node to %6s (y/n)  \b",trev->a);
fflush(stdin);
ch=getche();
if(ch=='y'||ch=='Y')
{
gotoxy(x+1,y+1);
printf("\\");
gotoxy(x+2,y+2);
printf("\\");
node*temp;
temp=(node*)malloc(sizeof(node));
trev->rt=temp;
gettree(temp,x+3,y+3);
}
else
trev->rt=NULL;
}
void showtree(node*trev,int x,int y)
{
gotoxy(x,y);
fflush(stdin);
puts(trev->a);
if(trev->lt!=NULL)
{

gotoxy(x-1,y+1);
printf("/");
gotoxy(x-2,y+2);
printf("/");
showtree(trev->lt,x-3,y+3);
}
if(trev->rt!=NULL)
{
gotoxy(x+1,y+1);
printf("\\");
gotoxy(x+2,y+2);
printf("\\");
showtree(trev->rt,x+3,y+3);
}

}
void createig(node*trev,node*trev1)
{
strcpy(trev1->a,trev->a);
trev1->lt=NULL;
trev1->rt=NULL;
if(trev->lt!=NULL)
{
trev1->rt=new node;
createig(trev->lt,trev1->rt);
}
if(trev->rt!=NULL)
{
trev1->lt=new node;
createig(trev->rt,trev1->lt);
}

}

void main()
{
node*root,*root1;
clrscr();
gotoxy(1,25);
cout<<"enter the tree";
root=new node;
gettree(root,40,1);
cout<<"the tree loaded";
sound(200);
delay(1000);
nosound();
getch();
getch();
clrscr();

showtree(root,40,10);
getch();
root1=new node;
createig(root,root1);
clrscr();
showtree(root1,40,10);
getch();
}



