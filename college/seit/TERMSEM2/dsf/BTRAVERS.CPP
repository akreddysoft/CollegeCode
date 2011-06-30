/* TITLE: PROGRAM TO  CREATE A  BINARY TREE , DISPLAY IT PICTORIALLY  AND TO
	 TRAVERSE  IT BY  RECURSIVE  AND  NON-RECURSIVE  METHOD   ****


#include<stdio.h>     /*   HEADER FILES  */
#include<conio.h>
#include<string.h>
#include<dos.h>
#include<stdlib.h>
 struct node                   /* STRUCTURE OF EACH  NODE */
  {
    int data;
    struct node*left,*right;
    };
    struct node*s,*root,*r,*q,*w,*stack[20];
   void insert(struct node*,struct node*);
   void tree(struct node*,int);
   void pretrav(struct node*);         /* FUNCTION  DECLARATION */
   void intrav(struct node*);
   void posttrav(struct node*);
   void npretrav(struct node*);
   void nintrav(struct node*);
   void display(struct node*);
   int cont=0;
   void main()
   {
    int choice,c,i,d,flag;
    char temp='N',temp1[15];
      root=NULL;
     do
     {
      clrscr();
      printf("\n\n\n\t\t     *****  THE  CHOICE - MENU  IS  *****");
      printf("\n\n\n\t\t1> ENTER");
      printf("\n\t\t2>TRAVERSE");
      printf("\n\t\t3>DISPLAY");
      printf("\n\t\t4>EXIT");
      printf("\n\n\t\t ENTER  YOUR  CHOICE :");
      scanf("%d",&choice);
      switch(choice)
       {
	case 1:
	 root= NULL;         /* INSERTION  OF  NODE */
	 root->left=NULL;
	 root->right=NULL;
	 printf("\n\t ******************  DATA  ENTRY ********************");
	 do
	 {
	  s= (struct node*)malloc (sizeof(struct node));
	  s->left=NULL;
	  s->right=NULL;
	  printf("\n Enter The Data:");
	  scanf("%d",&s->data);
	  cont++;
	  if(root==NULL)
	    root=s;           /*  TREE IS  EMPTY */
	  else
	    insert(root,s);
	    fflush(stdin);
	    printf("\n Enter More Elements(Y/N):");
	    scanf("%c",&temp);
	    }while(temp=='y'||temp=='Y');
	  break;

	 case 2:
	  clrscr();
	   do
	   {
	    clrscr();
	   printf("\n\n\n\n\t\t ****  THE  CHOICE - MENU IS ****");
	    printf("\n\n\n\n\t\t 1.RECURSIVE TRAVERSING\n\n\t\t 2.NON-RECURSIVE TRAVERSING\n\n\t\t 3.EXIT");
	    printf("\n\n\t\tEnter Your  Choice:");
	    scanf("%d",&d);
	    switch(d)
	    {
	    case 1:
	       clrscr();
	       do
	       {
		clrscr();
		printf("\n\n\n\n\t\t  ****  THE  CHOICE - MENU  IS ****" );
		printf("\n\n\n\t\t1.PREORDER\n\t\t2.INORDER\n\t\t3.POST-ORDER\n\t\t4.Exit");
		printf("\n\n\tEnter Your Choice:");
		scanf("%d",&c);
		if(root==NULL)
		 printf("\n\n   Tree  Not Started Yet !!");
	       else
		{
		  switch(c)
		  {
		   case 1:
		     pretrav(root);
		     break;
		   case 2:
		     intrav(root);
		     break;
		   case 3:
		     posttrav(root);
		     break;

		   }
	    printf("\n Press Any Key  To Continue !!!");
	    getch();
	   }
	    }while(c!=4);
	    break;

	  case 2:
	   clrscr();
	   do
	   {
		clrscr();
		printf("\n\n\n\n\t\t   **** THE  CHOICE MENU IS  ****");
		printf("\n\n\n\t\t1.PREORDER\n\t\t2.INORDER\n\t\t3.POST-ORDER\n\t\t4.Exit");
		printf("\n\n\tEnter Your Choice:");
		scanf("%d",&c);
		if(root==NULL)        /*  TREE  EMPTY  CONDITION */
		 printf("\n\n   Tree  Not Started Yet !!");
	       else
		{
		  switch(c)
		  {
		   case 1:
		     npretrav(root);
		     break;
		   case 2:
		     nintrav(root);
		     break;
		   case 3:
		     posttrav(root);
		     break;
		   }
	    printf("\n Press Any Key  To Continue !!!");
	    getch();
	   }
	    }while(c!=4);
	    break;
	   }
	  }while(d!=3);
	    break;

	  case 3:
	     display(root);
	     break;

	  }
	  getch();
	 }while(choice!=4);
	}

	/*               END OF THE   MAIN - FUNCTION                 */

	  void insert(struct node*r,struct node*p)
	  {                    /* FUNCTION  FOR  INSERTION  */
	   char ans;
	   fflush(stdin);
	   printf("\n  Wish To Insert Left/Right of %d:",r->data);
	   scanf("%c",&ans);
	  if((ans=='r')||(ans=='R'))
	   {
	    if(r->right==NULL)
	     {
	      r->right=p;
	      }
	     else
	      insert(r->right,p);
	     }
	     else
	     {
	      if(r->left==NULL)
	      {
	       r->left=p;
	      }
	      else
		insert(r->left,p);    /* RECURSIVE CALL */
	     }
	   }
	   void pretrav(struct node*r) /* FUNCTION FOR RECURSIVE PRE-ORDER
							TRAVERSAL  */
	   {
	    if(r!=NULL)
	    {
	     printf("%d\t",r->data);
	     pretrav(r->left);
	     pretrav(r->right);
	    }
	   }
	   void intrav(struct node*r)  /* FUNCTION FOR RECURSIVE IN-ORDER
							TRAVERSAL  */
	   {
	    if(r!=NULL)
	    {
	     intrav(r->left);
	     printf("%d\t",r->data);
	     intrav(r->right);
	     }
	    }
	   void posttrav(struct node*r) /* FUNCTION FOR RECURSIVE POST-ORDER
							TRAVERSAL  */
	   {
	    if(r!=NULL)
	    {
	     posttrav(r->left);
	     posttrav(r->right);
	     printf("%d\t",r->data);
	    }
	   }

	    void nintrav(struct node*r)/* FUNCTION FOR NON-RECURSIVE IN-ORDER
							TRAVERSAL  */
	     {
		int top=0;
		w=r;
		int flag=0;
		printf("\n\n\t");
		while(top!=-1&&w!=NULL)
		{
		 while(flag==0&&w->left!=NULL)
		 {
		  stack[top]=w;
		  top++;
		  w=w->left;
		 }
		 printf("  %d  ",w->data);
		 if(w->right!=NULL)
		 {
		   w=w->right;
		   flag=0;
		 }
		 else
		 {
		  top--;
		  w=stack[top];
		  flag=1;
		  }
		 }
	       }
	  void npretrav(struct node*r)/* FUNCTION FOR NON-RECURSIVE PRE-ORDER
							TRAVERSAL  */
	     {
		int top=0;
		w=r;
		int flag=0,flag1=-1;
		printf("\n\n\t");
		while(top!=-1&&w!=NULL)
		{
		 while(flag==0&&w->left!=NULL)
		 {
		  flag1=-1;
		  printf("%d\t",w->data);
		  stack[top]=w;
		  top++;
		  w=w->left;
		}
		if(flag1==-1)
		{
		 printf("%d\t",w->data);
		 flag1=0;
		 }
		 if(w->right!=NULL)
		 {
		   w=w->right;
		   printf("%d\t",w->data);
		   flag=0;
		 }
		 else
		 {
		  top--;
		  w=stack[top];
		  flag=1;
		  }
		 }
	       }

	   void display(struct node*p)
	   {
	     /* clrscr();
	      int i,m=0,n=0,q,t;
	      gotoxy(10,40);
	      printf("%d",root->data);
	      printf("/");
	      for(p=root;p!=NULL;p=p->left)
		m++;
	      for(p=root;p!=NULL;p=p->right)
		n++;

	      for(p=root,q=1;p!=NULL,q<m;p=p->left,q++)
	      {
		if(p->left!=NULL)
		{
		 gotoxy(6*q,40-3*q);
		 printf("%d",p->data);
		 printf("\\");
		}
		if(p->right!=NULL)
		{
		 gotoxy(6*q,40+3*q);
		 printf("%d",p->data);
		 printf("/");
	       }
	      }  */
		    clrscr();
		    int sum,a[20];
	       for(int i=1;i<=cont;i++)
	       {
	     /*	gotoxy(3*i,24-3*i);
		if(i<cont) printf("(");
		for(int j=0;j<cont-i;j++)
		 printf("0");
	       if(i<cont) printf(")");
		 gotoxy(3*i+17,24-3*i);
	       if(i<cont) printf("(");
	       for(j=0;j<cont-i-1;j++)
		printf("0");
	       if(i<cont) printf("1)");
		 gotoxy(3*i+5,25-3*i);
		  // if(i==n)printf("%d",sum);   */
		  if(i!=cont)

	       {
	       // printf("%d",sum);
	       printf("      ");
		printf("%d",a[i]);
		 gotoxy(3*i+6,24-3*i);
		 printf("/");
		gotoxy(3*i+11,24-3*i);
		printf("\\");
		gotoxy(3*i+10,23-3*i);
		printf("\\");
		gotoxy(3*i+7,23-3*i);
		printf("/");
	       }
		    sum+=a[i];
	     }
	    getch();
	  }