#include<stdio.h>
#include<conio.h>
#include<alloc.h>
typedef struct node
{
int data;
struct node *link;
}node;
int size=sizeof(node),n;
node *first=NULL,*temp,*last,*last1,*temp1,*first1;
void main()
{                            int cnt=0,half;
char ch;
clrscr();
do
{
printf("\n enter the data");
scanf("%d",&n);
if(first==NULL)
{                                     cnt++;
 first=malloc(size);
 first->data=n;
 first->link=NULL;
 last=first;
 }
 else
 {                              cnt++;
 temp=malloc(size);
 temp->data=n;
 temp->link=NULL;
 last->link=temp;
 last=temp;
 }
 printf("\n do you wish tio continue ");
 scanf(" %c",&ch);
 }while(ch=='y');

 temp=first;
 printf("\n List After Insertion Is \n");
  while(temp!=NULL)
  {
   printf("%d  ",temp->data);
   temp=temp->link;
  }
   half=cnt/2;
  cnt=0;
  temp=first;
  while(cnt!=half)
  {
  temp1=temp;
  temp=temp->link;
  cnt++;
  }
  first1=temp;
  last1=temp1;
  last->link=first;
  last1->link=NULL;
  temp=first1;
  printf("\n the list after divison is:\n ");
  while(temp!=NULL)
  {
  printf("%d  ",temp->data);
  temp=temp->link;
  }
getch();
}
