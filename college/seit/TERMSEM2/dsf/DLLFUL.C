#include<malloc.h>
struct node
{
	int data;
	struct node *plink,*nlink;
};
typedef struct node node;
int size=sizeof(node),n;
node *first=NULL,*temp,*last,*new1,*temp1;
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
  printf("\n 3 INSERTION AFTER THE SPECIFIC LOCATION \n");
  printf("\n ***FOLLOWING ARE THE DELETION FUNCTION***");
  printf("\n 4 DELETION AT THE BEGINNING");
  printf("\n 5 DELETION AT THE END");
  printf("\n 6 DELETION AFTER THE SPECIFIC LOCATION.");
  printf("\n 7 SEARCHING");
  printf("\n 8 TRAVERSAL OF THE LIST");
  printf("\n 9 EXIT");
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
   case 7: search();
		break;
   case 8: disp();
	break;
  case 9: exit(1);
	   break;
  default:
   printf("\n WRONG CHOICE");
   break;
   }
   }
   }

  insert_beg()   //insertion at the beginning
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
 first->plink=temp;
 temp->nlink=first;
 temp->plink=NULL;
 first=temp;
 }
 disp();
 return 0;
 }

 disp()
 {
 temp=first;
 printf("\n List After Insertion Is \n");
  while(temp!=NULL)
  {
   printf("%d  ",temp->data);
   temp=temp->nlink;
  }
 getch();
}

  insert_end()  //insertion at the end
{
int k=0;
temp=first;
 if(temp!=NULL)
 {
 while(temp!=NULL)
	 temp=temp->nlink;
 printf("\n enter the data to be inserted");
 scanf("%d",&n);
 new1=malloc(size);
 new1->data=n;
 last->nlink=new1;
 new1->plink=last;
 new1->nlink=NULL;
 last=new1;
 temp=first;
  disp();
  }
  else
  printf("\n List Is Empty \n");
return 0;
}

insert_spec()  //insertion at specific location
 {
  int k=0;
   new1=malloc(size);
	 temp=first;
	if(temp==NULL)
	printf("\n List Is Empty \n");
	else
 {
  printf("\n The Given List Is \n");
  disp();
  printf("\n Enter The Location From After Which Data Is To Be Inserted ");
  scanf("%d",&n);
  temp=first;
  k=0;
  while(temp!=NULL)
	 {  temp=temp->nlink;
	k++;
	 }
  temp=first;
  if(n<=k)
	  {     k=1;
   while(k<n)
	{
   temp=temp->nlink;
   k++;
	}
  temp1=temp->nlink;
  printf("\n enter the data");
  scanf("%d",&n);
  new1=malloc(size);
  new1->data=n;
  new1->nlink=temp1;
  new1->plink=temp;
  temp->nlink=new1;
  temp1->plink=new1;
  temp=first;
  disp();
 }
  else
  printf("\n Location Not Found");
 }
  return 0;
  }

  delete_beg()  //deletion at beginning
  {         int l=0;
  temp1=malloc(size);
  temp=first;
  if(temp==NULL)
  { if(first==last)
  {
   printf("\n Now The List Is Empty \n");
   free(first);
   }
   else
   {
	temp=first;
	 temp1=temp->nlink;
	   free(temp);
	 temp1->plink=NULL;
	 temp=first=temp1;
	 disp();
   }
   }
	  else
	 printf("\n list is empty");
	 return 0;
	 }

  delete_end()   // deletion at the end
  {            int k=0;
  temp=first;
  if(temp!=NULL)
  {
  temp=first;
  if(temp==last)
  {
  free(temp);
  printf("\n  Now List Is Empty \n");
  }
  else
  {
  temp1=malloc(size);
  while(temp->nlink!=NULL)
  temp=temp->nlink;
  temp1=temp->plink;
  temp1->nlink=NULL;
  last=temp1;
  printf("\n deletion at the end \n" );
  disp();
  }
  }
  else
  printf("\n List Is Empty");

  getch();
  return 0;
  }

   delete_spec() //deletion at the location
 {
  int k=0;
  temp=first;
  if(temp!=NULL)
  k=1;
   if(k==1)
 { temp=first;
	printf("\n The Given List Is \n");
   while(temp!=NULL)
	{ printf("%d ",temp->data);
	temp=temp->nlink;
	}
  printf("\n Enter The Location From After Which Data Is To Be Deleted");
  scanf("%d",&n);
  temp=first;
  k=0;
  while(temp!=NULL)
	 {  temp=temp->nlink;
	 k++;
	 }
  temp=first;
  if(n<=k)
	  {     k=1;
   while(k<n)
	{
   temp=temp->nlink;
   k++;
	}
   temp=temp->nlink;
   printf("\n the data is %d %d ",temp->data,k);
   temp1=malloc(size);
   new1=malloc(size);
   new1=temp->plink;
   temp1=temp->nlink;
   new1->nlink=temp1;
   temp1->plink=new1;
   free(temp);
  temp=first;
  printf("\n List After The Deletion \n");
  while(temp!=NULL)
	 {
   printf("%d  ",temp->data);
   temp=temp->nlink;
	 }
  }
  else
  printf("\n Data Not Found");
 }
  getch();

 return 0;
 }
  search()
  {    int k=0,l=0;
	temp=first;
  printf("\n Enter The Data To Be Found ");
  scanf("%d",&n);
  temp=first;
	while(temp!=NULL)
  {    l++;
	 if(temp->data==n)
 {
	k=1;
   break;
  }
	 temp=temp->nlink;
  }
	   if(k==1)
	   printf("\n Data Is Found At %d Location ",l);
	else
	printf("\n Data Is Not Found");
  getch();
  return 0;
  }