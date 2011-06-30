/*WRITE A MENU DRIVEN PROGRAM TO PERFORM THE FOLLWING
  OPERATIONS ON QUEUE.INSERT,DELETE,TRAVERSE USING
  LINKED LIST
 
  MADHUR AHUJA
  ROLL NO 22
*/
#include<malloc.h>
void del();
void insert();
void trav();
struct q
{                          //DECLARATION OF STRUCTURE FOR QUEUE
	int info;
	struct q *next;
};
struct q *front=NULL,*rear=NULL,*temp;
char ch;
int size=sizeof(struct q),n;
void main()
{
 int ch;
 while(1)
 {
   clrscr();
   printf("\n1. Insertion Of The Queue");
   printf("\n2. Deletion Of Queue ");
   printf("\n3. Traversal Of The Queue");
   printf("\n0. Exit");
   printf("\n Enter Your Choice:");
   scanf("%d",&ch);
   switch(ch)
   {
	 case 1:
	 insert();                         //INSERTION FUNCTION CALLED
	 trav();
	 break;

	 case 2:
	 del();
	 trav();                           //DELETION FUNCTION CALLED
	 break;

	 case 3:
	 trav();                           //TRAVERSING FUNCTION CALLED
	 break;

	 case 0:
	 exit(0);

	 default:
	 printf("\n Wrong Choice Entered");
	 getch();
	 break;
   }
 getch();
 }
}

void insert()
{
	printf("\n Enter The Data To Be Inserted ");
	scanf("%d",&n);
	if(front==NULL)
	{
		temp=malloc(size);
		temp->info=n;
		temp->next=NULL;
		rear=front=temp;
	}
	else
	{
		temp=malloc(size);
		temp->info=n;
		temp->next=NULL;
		rear->next=temp;
		rear=rear->next;
	}
}

void trav()                        //FUNCTION FOR TRAVERSING
{
	temp=front;
	if(temp==NULL)
	printf("\n Queue Is Empty ");
	else
	{
		printf("\n Queue Is \n");
		while(temp!=NULL)
		{
			printf("%d ",temp->info);
			temp=temp->next;
		}
	}
}

void del()                       //FUCTION FOR DELETION
{
	temp=front;
	if(temp==NULL)
		printf("\n Queue Is Empty \n");
	else
	{
		printf("\n The Deleted Element Is %d",front->info );
		front=front->next;
		free(temp);
	}
}
