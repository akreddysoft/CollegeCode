//ASSIGNMENT NO.10
//LINKED LIST
#include<alloc.h>
int append(struct node**q,int num);
int addatbeg(struct node**q,int num);
void deleted(struct node**q,int num);
void display(struct node*q);
struct node
{
 int data;
 struct node*link;
}n1;
void main()
{
 int temp,choice,num,i;
 struct node *p;
 clrscr();
 p=NULL;
 printf("\n1 add");
 printf("\n2 delete");
 printf("\n0 Exit");
 while(choice!=0)
 {
  printf("\nEnter choice:");
  scanf("%d",&choice);
  switch(choice)
  {
   case 1:
   printf("\nEnter the value to be added:");
   scanf("%d",&num);
   append(&p,num);
	 display(p);
   break;
   case 2:
   printf("\nEnter the value to be deleted:");
   scanf("%d",&num);
   deleted(&p,num);
   display(p);
   break;
  }
 }
}
append(struct node **q,int num)
{
 struct node *temp,*r;
 temp=*q;
 if(*q==NULL)
 {
  temp=malloc(sizeof(struct node));
  temp->data=num;
  temp->link=NULL;
  *q=temp;
 }
 else
 {
  temp=*q;
  while(temp->link!=NULL)
   temp=temp->link;

   r=malloc(sizeof(struct node));
   r->data=num;
   r->link=NULL;
   temp->link=r;
  }
  return(num);
}

void deleted(struct node **q,int num)
{
 struct node *old,*temp;
 temp=*q;
 while(temp!=NULL)
 {
  if(temp->data==num)
   {
    if(temp==*q)
     {
      *q=temp->link;
      free(temp);
      return;
     }
   else
    {
     old->link=temp->link;
     free(temp);
     return;
    }
  }
 else
 {
  old=temp;
  temp=temp->link;
 }
}
printf("%d",num);
}
void display(struct node*q)
{
 printf("\nThe linked list is:\n");
 while(q!=0)
 {
	printf("  %d  ",q->data);
	q=q->link;
 }
}