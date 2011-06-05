		/* Assignment No :   */

/* Program For Creating And Displaying A Generalised Linked List
	And To Perform Copy ,Depth ,Equivalence Operation */

#include<stdio.h>
/* Structure Declaration */
 struct node
 {
  char data;
  int tag;
  struct node *link,*next;
 }*start,*start1,*start2;
 int n,x=27;

/* Function Prototypes */

 struct node *form(char g[20]);
 void display(struct node*r,int y);
 int equal(struct node*,struct node*);
 struct node *copy(struct node*);
 int depth(struct node*);

/* Beginning Of Main */

 void main()
 {
 char gll[20],gll1[20];
 char ch;
 int choice,flag;
 int z;

/* User's Choices */

 do
 {
 clrscr();
 printf("\n______MENU______");
 printf("\n 1: Create ");
 printf("\n 2: Display ");
 printf("\n 3: Equivalence ");
 printf("\n 4: Copy ");
 printf("\n 5: Depth ");
 printf("\n 6: Exit ");
 printf("\n Please enter your choice : ");
 scanf("%d",&choice);

/* Switch Case Starts*/

 switch(choice)
 {
  case 1: /* Creation */
	 printf("\n Enter Expression : ");
	 scanf("%s",gll);
	 n=1;
	 start=form(gll);
	 break;

  case 2: /* Display */
	 printf("The Expression Is....\n");
	 display(start,12);
	 getch();
	 break;

  case 3: /* Equivalence */
	 printf("\n Enter Expression : ");
	 scanf("%s",gll);
	 n=1;
	 start1=form(gll);
	 printf("\n Enter Expression : ");
	 scanf("%s",gll1);
	 n=1;
	 start2=form(gll1);
	 z=equal(start1,start2);
	 if(z==1)
	 printf("\nThe Given Gll's Are Equal....");
	 else
	 printf("\nThe Given Gll's Are Not Equal....");
	 break;

  case 4: /* Copy */
	 printf("\n Enter Expression....");
	 scanf("%s",gll);
	 n=1;
	 start=form(gll);
	 start1=copy(start);
	 printf("\nEntered Expression Is....\n");
	 display(start,15);
	 printf("\nCopied Expression Is....\n");
	 display(start1,18);
	 break;

  case 5: /* Depth */
	 printf("\n Enter Expression Is....");
	 scanf("%s",gll);
	 n=1;
	 start=form(gll);
	 z=depth(start);
	 printf("\nDepth of gll=%d",z);
	 break;

  case 6: /* Exit */
	 exit(0);

  default: /* Default */
	  printf("Invalid Choice....Try Again!!");
 }
 printf("\n\nDo You Wish To Continue ? (Yes/No) : ");
 flushall();
 scanf("%c",&ch);
 }
 while(ch=='y');
 getch();
}

/* Function For Creation */
 struct node *form(char gll[20])
 {
 struct node *start,*s,*q;
 start=NULL;
 while(gll[n]!='\0' && gll[n]!=')')         /*Checking For End*/
 {
   if(gll[n]!=',' && gll[n]!='(')           /*Checking For Other Char*/
	 {
	s=(struct node*)malloc(sizeof(struct node));
	s->data=gll[n];
	s->next=NULL;                            /*For An Atom*/
	s->link=NULL;
	s->tag=0;

	if(start==NULL)                         /*For 1st Atom*/
	start=s;
	else
	{
	 q=start;                                /*For More Atoms*/
	 while(q->next!=NULL)
	 q=q->next;
	 q->next=s;
	}
   }

  if(gll[n]=='(')                           /* Sublist */
  {
	n++;
	s=(struct node*)malloc(sizeof(struct node));
	s->next=NULL;
	s->tag=1;
	s->link=form(gll);
	if(start==NULL)
	start=s;
	else
	{
	 q=start;
	 while(q->next!=NULL)                    /* Elements In Sublist */
	 q=q->next;
	 q->next=s;
	}
  }
  n++;
  }
  return(start);
  }

/* Function For Display */
 void display(struct node *r,int y)
 {
 while(r!=NULL)
 {
  if(r->tag==0)                              /*For An Atom*/
  {
   gotoxy(x,y);
   printf("%c",r->data);
   if(r->next!=NULL)
   {
   gotoxy(x+1,y);
   printf("->");
	 }
   x+=4;
  }
  if(r->tag==1)                              /*For A Sublist*/
  {
	gotoxy(x,y);
	printf("|");
	if(r->next!=NULL)
	{
	  gotoxy(x+1,y);
	  printf("->");
	}
	display(r->link,y+1);                    /*For Sublist*/
  }
  r=r->next;
  }
}

/* Function For Equivalence */
 int equal(struct node *start,struct node *start1)
 {
  if(start==NULL &&start1==NULL)
  return 1;
  if(start==NULL && start1!=NULL||start!=NULL && start1==NULL)
  return 0;
  if(start->tag==0)
  {
	if(start1->tag==1)
  return 0;
  if(start->data!=start1->data)
  return 0;
  }
  else
  {
  if(start1->tag==0)
  return 0;
  if(!equal(start->link,start1->link))
  return 0;
  }
  return(equal(start->next,start1->next));
}

/* Function For Copy */
struct node *copy(struct node*start)
{
 struct node*temp;
 temp=NULL;
 if(start!=NULL)
 {
 temp=(struct node*)malloc(sizeof(struct node));
 if(start->tag==0)
 {
 temp->data=start->data;
 temp->link=NULL;
 }
 else
 {
 temp->data=NULL;
 temp->link=copy(start->link);
 }
 temp->tag=start->tag;
 temp->next=copy(start->next);
 }
 return temp;
}

/* Function For Depth */
int depth(struct node*start)
{
 int d,d2;
 if(start==NULL)
 return 0;
 if(start->tag==1)
 d=depth(start->link)+1;
 else
 d=1;
 d2=depth(start->next);
 return(d<d2?d2:d);
}

