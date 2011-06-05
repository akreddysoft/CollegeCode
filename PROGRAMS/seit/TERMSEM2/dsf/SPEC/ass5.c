/*WRITE A MENU DRIVEN PROGRAM TO PERFORM THE FOLLWING
  OPERATIONS ON DOUBLY LINKED LIST.INSERT,DELETE,TRAVERSE USING
  LINKED LIST
     
  MADHUR AHUJA
  ROLL NO 22
*/
#include <alloc.h>
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
 {
  clrscr();
  printf("\n 1 INSERTION AT THE BEGINNING");
  printf("\n 2 INSERTION AT THE END");
  printf("\n 3 INSERTION AFTER THE SPECIFIC LOCATION ");
  printf("\n 4 DELETION AT THE BEGINNING");
  printf("\n 5 DELETION AT THE END");
  printf("\n 6 DELETION AFTER THE SPECIFIC LOCATION.");
  printf("\n 7 TRAVERSAL OF THE LIST");
  printf("\n 0 EXIT");
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
   case 7: trav();
	break;
   case 0: exit(1);
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
 temp=first;
 printf("\n List After Insertion Is \n");
 while(temp!=NULL)
 {
   printf("%d  ",temp->data);
   temp=temp->nlink;
 }
 getch();
 return 0;
}

insert_end()  //insertion at the end
{
 int k=0;
 temp=first;
 if(temp!=NULL)
	k=1;
 if(k==1)
 {
	 temp=first;
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
		 while(temp!=NULL)
		  {
		   printf("%d  ",temp->data);
		   temp=temp->nlink;
		  }
  }
  else
	  printf("\n List Is Empty \n");
  getch();
return 0;
}

insert_spec()  //insertion at specific location
{
  int k=0;
  new1=malloc(size);
  temp=first;
  if(temp!=NULL)
	 k=1;
  if(k!=1)
	printf("\n List Is Empty \n");
  else
 {
  temp=first;
  printf("\n The Given List Is \n");
  while(temp!=NULL)
  {
	printf("%d ",temp->data);
	temp=temp->nlink;
  }
  printf("\n Enter The Location From After Which Data Is To Be Inserted ");
  scanf("%d",&n);
  temp=first;
  k=0;
  while(temp!=NULL)
  {
   temp=temp->nlink;
   k++;
  }
  temp=first;
  if(n<=k)
  {
	  k=1;
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
	  printf("\n List After The Insertion \n");
	  while(temp!=NULL)
	 {
	   printf("%d  ",temp->data);
	   temp=temp->nlink;
	 }
 }

  else
  printf("\n Location Not Found");
 }
 getch();
 return 0;
}

  delete_beg()  //deletion at beginning
  {         int l=0;
  temp1=malloc(size);
  temp=first;
  if(temp!=NULL)
  l=1;
  if(l==1)
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
     printf("\n List After Deletion \n");
     while(temp!=NULL)
     {
     printf(" %d ",temp->data);
     temp=temp->nlink;
     }
   }
   }
      else
     printf("\n list is empty");

     getch();
     return 0;
     }
  delete_end()   // deletion at the end
  {            int k=0;
  temp=first;
  if(temp!=NULL)
  k=1;

  if(k==1)
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
  temp1=first;
  while(temp1!=NULL)
  {
   printf("%d  ",temp1->data);
   temp1=temp1->nlink;
  }
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

trav()
{
	temp=first;
	while(temp!=NULL)
	{
	    printf("%d ",temp->data);
	    temp=temp->nlink;
	}
	getch();
	return ;

}

