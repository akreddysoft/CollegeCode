#include<stdio.h>
#include<conio.h>
#include<alloc.h>
typedef struct node
{
int data;
struct node *plink,*nlink;
}node;
char ch;
int size=sizeof(node),n;
node *first=NULL,*temp,*last,*new1,*temp1;
//creation
void main()
{              clrscr();
do
{
printf("\n enter the data");
scanf("%d",&n);
if(first==NULL)
{
 first=malloc(size);
 first->data=n;
 first->plink=NULL;
 first->nlink=NULL;
 last=first;
 }
 else
 {
 temp=malloc(size);
 temp->data=n;
 last->nlink=temp;
 temp->nlink=NULL;
 temp->plink=last;
 last=temp;
 }
 printf("\n do u want to continue: ");
 scanf(" %c",&ch);
 }while(ch=='y');
 temp=first;
  while(temp!=NULL)
  {
   printf("%d  ",temp->data);
   temp=temp->nlink;
  }
  temp1=new1=malloc(size);
  //deleltion at the end
  temp=first;
  while(temp->nlink!=NULL)
  temp=temp->nlink;

  temp1=temp->plink;
  temp1->nlink=NULL;
  //temp=temp1;
  last=temp1;
  temp=first;
  printf("\n the data after \n");
  while(temp!=NULL)
  {
  printf("%d ",temp->data);

  temp=temp->nlink;
  }
  getch();

  }
