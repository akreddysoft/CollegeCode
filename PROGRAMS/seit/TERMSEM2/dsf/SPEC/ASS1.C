/*WRITE A MENU DRIVEN PROGRAM TO CREATE THE MULTIPLE STACKS IN
  THE PRIMARY MEMORY AND PERFORM THE DIFFERENT OPERATIONS OF
  THESE STACKS

  MADHUR AHUJA
  ROLL NO 22
*/
void push();
int pop();
void disp();
int stack[30],top1,top2,top3,st,n;
void main (void)
{
 int i,j,k,ch;
 clrscr();
 top1=-1;
 top2=9;
 top3=19;
 while(1)
 {
 clrscr();
 printf("\n1 Push");
 printf("\n2 Pop");
 printf("\n0 Exit");
  printf("\nEnter choice:");
  scanf("%d",&ch);
  switch(ch)
  {
   case 1:
	printf("\nEnter the stack no.:");
	scanf("%d",&st);
	printf("\nEnter the element to be pushed:");
	scanf("%d",&n);
	push();
	disp();
	break;

   case 2:
	printf("\nEnter the stack no.:");
	scanf("%d",&st);
	pop();
	disp();
	break;

   case 0:
	exit(1);

   default:
	printf("\nInvalid Choice");
  }
  printf("\nPress key to continue");
  getch();

 }
 }

void push()
{
 switch(st)
 {
  case 1:
   if(top1>=-1&&top1<=8)
	stack[++top1]=n;
   else
	printf("\nStack full");
   break;

  case 2:
   if(top2>=9&&top2<=18)
	stack[++top2]=n;
   else
	printf("\nStack full");
   break;

   case 3:
	if(top3>=19&&top3<=28)
	stack[++top3]=n;
   else
	printf("\nStack full");
   break;
   default:
	printf("\Invalid");
  }
 }

int pop()
{
 int temp;
 switch(st)
 {
  case 1:
   if(top1!=-1)
   {
	temp=stack[top1];
	--top1;
	return temp;
   }
   else
	printf("\nStack empty");
   break;

  case 2:
   if(top2!=9)
   {
	temp=stack[top2];
	--top2;
	return temp;
   }
   else
	printf("\nStack empty");
   break;

   case 3:
	if(top3!=19)
   {
	temp=stack[top3];
	--top3;
	return temp;
   }
   else
	printf("\nStack empty");
   break;
  }
  default:
   printf("\ninvalid");
 }


void disp()
{
 int i;
 printf("\nStack1:");
 for(i=0;i<=top1;++i)
  printf(" %d ",stack[i]);

 printf("\nStack2:");
 for(i=10;i<=top2;++i)
  printf(" %d ",stack[i]);

 printf("\nStack3:");
 for(i=20;i<=top3;++i)
  printf(" %d ",stack[i]);
}

/*
1 Push
2 Pop
0 Exit
Enter choice:1

Enter the stack no.:3

Enter the element to be pushed:4

Stack1: 4  2
Stack2: 3
Stack3: 4
Press key to continue
*/

