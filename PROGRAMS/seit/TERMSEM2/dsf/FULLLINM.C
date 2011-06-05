#include<stdio.h>
#include<alloc.h>
#include<conio.h>
//#include<.h>
struct node
{
int data;
struct node *link;
}node;
struct node *first=NULL,*last,*temp,*one,*last1,*temp1;

int n,size=sizeof(size);
char ch;
void main()
{

 int ch;
 clrscr();
 while(1)
 { clrscr();
  printf("\n THE VARIOUS OPERATIONS THAT CAN BE PERFORMED ON LINK LIST ARE");
  printf("\n\n ***FOLLOWING ARE THE INSERTION FUNCTION***");
  printf("\n 1 INSERTION AT THE BEGINNING");
  printf("\n 2 INSERTION AT THE END");
  printf("\n 3 INSERTION AFTER THE SPECIFIC DATA \n");
  printf("\n ***FOLLOWING ARE THE DELETION FUNCTION***");
  printf("\n 4 DELETION AT THE BEGINNING");
  printf("\n 5 DELETION AT THE END");
  printf("\n 6 DELETION AFTER THE SPECIFIC DATA");
  printf("\n 7 SEARCHING");
  printf("\n 8 EXIT");
  printf("\n ENTER YOUR CHOICE :");
  scanf("%d",&ch);
   switch(ch)

   {
   case 1: insert_beg();
	    break;
   case 2: insert_end();
	    break;
   case 3:  insert_spec();
	     break;
   case 4:  delete_beg();
	    break;
   case 5:  delete_end();
	    break;
   case 6:  delete_spec();
	    break;
  // case 7: search();
  //	    break;
  case 8: exit(1);
	   break;
  default:
   printf("\n WRONG CHOICE");
   break;
   }
   }
   }

   insert_beg()
{
printf("\n enter the data");
scanf("%d",&n);
if(first==NULL)
{
first=malloc(size);
first->data=n;
first->link=NULL;
last=first;
}
else
{
  one=malloc(size);
  one->data=n;
  one->link=first;
  first=one;
  }
  temp=first;
  printf("\n List After The Entering Data At The Beginning \n");
  while(temp!=NULL)
  {
   printf("%d  ",temp->data);
   temp=temp->link;
  }getch();
 return 0;
 }


 insert_end()     //for insertion at the end
 {
 int k=0;
  temp=first;
  while(temp!=NULL)
  {
   k=1;
  temp=temp->link;
   }
   if(k==1)
 {
  printf("\n enter the data to be inserted");
  scanf("%d",&n);
   last1=malloc(size);
   last->link=last1;
   last1->data=n;
   last1->link=NULL;
   last=last1;
   temp=first;
    printf(" \n List After The Entering Data At The End \n");
  while(temp!=NULL)
  {
   printf("%d  ",temp->data);
   temp=temp->link;
  }
   }
   else
   printf("\n List Is Empty \n");
  getch();
  return 0;}


   insert_spec()       //insertion at specific location
  { int var;
  int k=0,l=0;
  one=malloc(size);
     temp=first;
     while(temp!=NULL)
     {
     k=1;
     temp=temp->link;
    }
    if(k!=1)
    printf("\n List Is Empty \n");
    else
   {
  temp=first;
  printf("\n The Given List Is \n");
   while(temp!=NULL)
   { printf("%d ",temp->data);
    temp=temp->link;
    }
    printf("\n Enter The Data From The List After Which Data Is To Be Inserted");
 scanf("%d",&var);
 temp=first;
      while(temp!=NULL)
  {
  if(temp->data==var)
  {l=1;
  break;
  }
  temp=temp->link;
   }
   if(l!=1)
   printf("\n Data Not Found \n");
   else
    {
  temp1=malloc(size);
  temp1=temp->link;
 printf("Enter The Data To Be Inserted ");
 scanf("%d",&n);

 one->data=n;
 temp->link=one;
 one->link=temp1;
 temp=first;
 while(temp!=NULL)
  {
   printf("%d  ",temp->data);
   temp=temp->link;
  }
  }}


getch();
return 0;
}
   delete_beg()         //deletion at the beginning
 {
  temp=first;
  if(temp->link!=NULL)
  { printf("\n %d Is Being Deleted",temp->data);
  temp1=temp->link;
   temp=first=temp1;
  printf("\n List After Deleting First Element \n");
  while(temp!=NULL)
  {
   printf("%d  ",temp->data);
   temp=temp->link;
  }
  }
  else
  printf("\n List Is Empty");
  getch();
    return 0;
  }


  delete_end()   //deletion at end
  { int k=0;
  temp=first;
  temp1=malloc(size);
  while(temp!=NULL)
  { k=1;
  temp1=temp;
  temp=temp->link;
  if(temp->link==NULL)
  {printf("\n %d Is Being Deleted",temp->data);
  break;
  }
  }
  if(k==1)
  {
   last=temp1;
   temp1->link=NULL;
   temp=first;
   printf("\n List After Deleting Last Element Is \n") ;
   while(temp!=NULL)
   {
   printf("%d  ",temp->data);
   temp=temp->link;
   }
  }
  else
  printf("\n List Is Empty \n");
  getch();
  return 0;
  }

   delete_spec()         //deleting at the specific location
   { int k=0,l=0 ,var;
    temp=first;
    while(temp!=NULL)
    {
    k=1;
    temp=temp->link;
    }
   if(k!=1)
   printf("\n List Is Empty \n");
   else
   {temp=first;
   printf("\n The Given List Is \n");
   while(temp!=NULL)
   {
   printf("%d ",temp->data);
   temp=temp->link;
   }
   printf("\n Enter The Data From The List Which Is To Be Deleted");
   scanf("%d",&var);
    temp=first;
   while(temp!=NULL)
   {
   temp1=temp;
   temp=temp->link;
   if(temp->data==var)
    {
    l=1;
    break;
   }
   }

   if(l!=1)
   printf("\n Data Not Found \n");
   else
   {printf("\n %d Is Being Deleted",temp->data);
   temp=temp->link;
   temp1->link=temp;
   printf("\n List After Deleting Element From Specifc Location Is \n");
   temp=first;
   while(temp!=NULL)
  {
   printf("%d  ",temp->data);
   temp=temp->link;
  }
  }
  }
   getch();
   return 0;

  }
  search()
  {
  int var,k=0,l=0;
  printf("\n Enter The Data To Be Searched");
  scanf("%d",&var);
    temp=first;
    while(temp!=NULL)
    {
    k=1;
    temp=temp->link;
    }
   if(k!=1)
   printf("\n List Is Empty \n");
   else
{
  temp=first;
   while(temp!=NULL)
   {
   temp1=temp;
   temp=temp->link;
   if(temp->data==var)
    {
    l=1;
    break;
   }
   }

   if(l!=1)
   printf("\n Data Not Found \n");
   else
   printf("\n Data Is Found");
   }
   getch();
   return 0;
   }