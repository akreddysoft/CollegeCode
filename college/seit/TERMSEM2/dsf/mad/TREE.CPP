#include<stdio.h>
#include<conio.h>
#include<alloc.h>
struct node
{
char a[10];
int rtt;
node*lt,*rt;
}*root,*pt,*ptr,*stack[20];
char ch;
int flag=0;
//root=NULL;
void gettree(node *trev,int x,int y)
{
gotoxy(x,y);
fflush(stdin);
scanf("%s",(trev->a));
trev->rtt=0;
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
void pretrv(node*trev)
{
if(trev!=NULL)
{
printf("%s ",trev->a);
pretrv(trev->lt);
pretrv(trev->rt);
}
}

void intrv(node*trev)
{
if(trev!=NULL)
{

intrv(trev->lt);
printf("%s ",trev->a);
intrv(trev->rt);
}
}

 void postorder1(struct node *t)
 {
  int end=0,i=0,left;
  while(end==0)
  {
   goto left;
   left:
   while(t!=NULL)
   {
    stack[i]=t;
    i++;
    t=t->lt;
    }
   if(i!=0)
   {
    i--;
    if(stack[i]!=t)
    printf("%d",stack[i]->a);
    t=t->rt;
    goto left;
   }

   else
   {
    printf("%d",root->a);
    end =1;
    }
   }
   }

void posttrv(node*trev)
{
if(trev!=NULL)
{
posttrv(trev->lt);
posttrv(trev->rt);
printf("%s ",trev->a);
}
}
void lttrv()
{
if(pt->lt==NULL)
printf("does not contain a value to the left of %s",pt->a);
else
{
printf("the element to the left of %s is %s",pt->a,pt->lt->a);
pt=pt->lt;
}
}
void rttrv()
{
if(pt->rt==NULL)
printf("does not contain a value to the right of %s",pt->a);
else
{
printf("the element to the right of %s is %s",pt->a,pt->rt->a);
pt=pt->rt;
}
}

void intt(node*trev)
{
if(trev!=NULL)
{

intt(trev->lt);
if(flag)
{
ptr->rt=trev;
trev->rtt=1;
ptr=trev;
}

if(trev->lt==NULL&&trev->rt==NULL)
{
flag=1;
trev->rtt=1;
ptr=trev;
}

if(trev->lt!=NULL&&trev->rt!=NULL)
{
flag=0;
ptr=trev;
trev->rtt=0;
}

intt(trev->rt);
}
}
void innrectr(node *trv)
{
 struct stack
 {
  int top;
  node*item[100];
 }s;
 s.top=-1;
 node *ptr=trv;
 do
 {
  while (ptr!=NULL)
  {
  s.item[++s.top]=ptr;
  ptr=ptr->lt;
  }
  if(s.top>=0)
  {
  ptr=s.item[s.top--];
  printf("%s ",ptr->a);
  ptr=ptr->rt;
  }
 }while((s.top>=0)||ptr!=NULL);
}

void prenrectr(node *trv)
{
 struct stack
 {
  int top;
  node*item[100];
 }s;
 s.top=-1;
 node *ptr=trv;
 do
 {
  while (ptr!=NULL)
  {
  s.item[++s.top]=ptr;
   printf("%s ",ptr->a);

  ptr=ptr->lt;
  }
  if(s.top>=0)
  {
  ptr=s.item[s.top--];
  ptr=ptr->rt;
  }
 }while((s.top>=0)||ptr!=NULL);
}

void posnrectr(node *trv)
{
 struct stack
 {
  int top;
  node*item[100];
 }s;
 s.top=-1;
 node *ptr=trv;
 do
 {
  while (ptr!=NULL)
  {
  s.item[++s.top]=ptr;

  ptr=ptr->lt;
  }
  if(s.top>=0)
  {
  ptr=s.item[s.top--];
  ptr=ptr->rt;
  printf("%s ",ptr->a);

  }
 }while((s.top>=0)||ptr!=NULL);
}

void innrectrt(node*trv)
{
node*p,*q;
p=trv;
do
{
 q=NULL;
 while(p!=NULL)
 {
  q=p;
  p=p->lt;
 }
 if(q!=NULL)
 {
 printf("%s ",q->a);
 p=q->rt;
 while(q->rtt&&p!=NULL)
 {
 printf("%s ",p->a);
 q=p;
 p=p->rt;
 }
 }
 }while(q!=NULL);
}










void main()
{
char ch;
pt=root;
clrscr();
do
{
gotoxy(1,1);
printf("1.to enter create a new tree\n");
printf("2.to find inorder traversal\n");
printf("3.to find preorder traversal\n");
printf("4.to find postorder traversal\n");
printf("5.set trv pointer to root\n");
printf("6.trv to lt\n");
printf("7.trv to tr\n");
printf("8.clear output area\n");
printf("9.create an inorder tt\n");
printf("a.in.o.non.rec.trv.\n");
printf("b.in.o.non.rec.tr.of.tt\n");
printf("c preofer\n");
printf("d postorder\n");
printf("enter your choice       \b\b\b\b\b");
scanf("%c",&ch);
switch(ch)
{
case 'b':gotoxy(1,25);
	  printf("						       ");
	  gotoxy(1,25);
	  innrectrt(root);
	  getch();
	  break;
case 'c':gotoxy(1,25);
	  printf("						       ");
	  gotoxy(1,25);
	  prenrectr(root);
	  getch();
	  break;
case 'd':gotoxy(1,25);
	  printf("						       ");
	  gotoxy(1,25);
	  postorder1(root);
	  getch();
	  break;

case 'a':gotoxy(1,25);
	  printf("						       ");
	  gotoxy(1,25);
	  innrectr(root);
	  getch();
	  break;
case '1': fflush(stdin);
	  root=(node*)malloc(sizeof(node));
	  gettree(root,40,1);
	  gotoxy(1,25);
	  printf("           tree loaded in the primary memeory        ");
	  break;
case '2': gotoxy(1,25);
	  printf("						       ");
	  gotoxy(1,25);
	  intrv(root);
	  getch();
	  break;
case '3': gotoxy(1,25);
	  printf("						       ");
	  gotoxy(1,25);
	  pretrv(root);
	  getch();
	  break;
case '4': gotoxy(1,25);
	  printf("						       ");
	  gotoxy(1,25);
	  posttrv(root);
	  getch();
	  break;
case '5': pt=root;break;
case '6': gotoxy(1,25);
	  lttrv();break;
case '7': gotoxy(1,25);
	  rttrv();break;
case '8': gotoxy(1,25);
	  printf("						       ");
	  break;
case '9': intt(root);break;
}
}while(ch!='0');

//getch();
}




