/*WRITE A MENU DRIVEN PROGRAM TO PERFORM THE FOLLWING
  OPERATIONS ON CIRCULAR QUEUE.INSERT,DELETE,TRAVERSE USING
  LINKED LIST
     
  MADHUR AHUJA
  ROLL NO 22
*/
#define max 5
int qa[max],cnt,rear=-1,front=-1;
void insert();
void trav();
void del();
void main()
{
  char ch;
  clrscr();
  while(1)
  {
   clrscr();
   printf("\n1. insertion operation on the queue");
   printf("\n2. deletion operation on the queue ");
   printf("\n3. traversal of the queue");
   printf("\n0. exit");
   printf("\nenter your choice");
   scanf("%d",&ch);
   switch(ch)
   {
   case 1: insert();
		   trav();
		break;
   case 2:  del();
			trav();
		break;
   case 3:  trav();
		break;
   case 0: exit(1);
	   break;

   default:
	   printf("\n WRONG CHOICE");
   break;
  }
 getch();
 }
}

void insert()
{
 int temp,n;
 printf("\n Enter The Data To Be Inserterd :");
 scanf(" %d",&n);
 temp=rear;
 rear=((rear+1)%max);
 if(cnt<max)
 {
	qa[rear]=n;
	cnt++;
 }
 else
 {
	printf("\nThe Queue Is Alerady Overflow ");
       rear=temp;
 }
}


void del()
{
  int temp;
  temp=front;
  if(cnt!=0)
  {
	front=(front+1)%max;
	printf("\n Data Deleted Is %d ",qa[front]);
	qa[front]=0;
	cnt--;
  }
  else
  {
	printf("\n Queue Is Empty");
	front=temp;
  }
}

void trav()
{
  int i,temp;
  if(cnt!=0)
  {
	printf("\n front ----->  ");
	for(i=front;i<(cnt+front);i++)
	{
		temp=(i+1)%max;
		printf("%d  ",qa[temp]);
	}
	printf(" <-------- rear");
  }
  else
  printf("\n Queue Is Empty \n");
}




