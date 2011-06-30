/* TITLE: PROGRAM TO  CREATE A  BINARY TREE , DISPLAY IT PICTORIALLY  AND TO
	 TRAVERSE  IT BY  RECURSIVE  AND  NON-RECURSIVE  METHOD   ****

       1> RECURSIVE METHOD
	  A>IN-ORDER
	  B>PRE-ORDER
	  C>POST-ORDER

       2> NON-RECURSIVE METHOD
	  A>IN-ORDER
	  B>PRE-ORDER
	  C>POST-ORDER

       NAME:     HARSHIT RASTOGI.
       CLASS:    S.E COMP.(II).
       ROLL NO.: 66 .                                                 */


#include<string.h>
#include<math.h>
#include<malloc.h>
#include<stdio.h>
#include<graphics.h>
 struct node                   /* STRUCTURE OF EACH  NODE */
  {
    char data[15];
    struct node*left,*right;
    };
   struct node*s,*root,*r,*q,*w,*stack[20];
   void insert(struct node*,struct node*);
   void pretrav(struct node*);         /* FUNCTIONS  DECLARATION */
   void intrav(struct node*);
   void posttrav(struct node*);
   void npostrav(struct node*);
   void npretrav(struct node*);
   void nintrav(struct node*);
   void display();
   int cont=0,i=0,gm,gd,flag;
   char *a[15],*b[4][8];
   void main()
   {
    int choice,c,d,flag;
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
	 do
	 {
	  s= (struct node*)malloc (sizeof(struct node));
	  s->left=NULL;
	  s->right=NULL;
	  printf("\n Enter The Data:");
	  scanf("%s",&s->data);
	  cont++;
	  if(root==NULL)
	    root=s;                         //ASSIGNING VALUE TO ROOT NODE
	  else
	    insert(root,s);
	    fflush(stdin);
	    printf("\n Enter More Elements(Y/N):");
	    scanf("%c",&temp);
	    }while(temp=='y'||temp=='Y');
	  break;

	 case 2:
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
		   case 1:                //CALLING OF RECURSIVE FUNCTIONS
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
		     npretrav(root);   //CALLING OF  NON-RECURSIVE
		     break;            //FUNCTIONS
		   case 2:
		     nintrav(root);
		     break;
		   case 3:
		     npostrav(root);
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
				  if(root==NULL)
				 printf("\n THE TREE IS EMPTY ");
			  else
			   { initgraph(&gd,&gm,"d:\\tc");
			  //CALLING FUNCTION FOR DISPLAY
				 display(root,1,getmaxx()+1,15,1);  // 640 is the getmaxx
				 getch();
				 closegraph();
			   } break;

	  }

	 }while(choice!=4);
	}

	/*               END OF THE   MAIN - FUNCTION                 */

void  display(struct node *trav,int lval,int hval,int y,int level)
{
   char msg[10];
   int n=1,i;
   sprintf(msg,"%s",trav->data);
   outtextxy((lval+hval)/2,y,msg);
   circle(((lval+hval)/2)+3,y+3,10);	//FOR DISPLAY OF CIRCLE
   getch();
   for(i=0;i<level;i++)
   n=n*2;
   if(trav->left!=NULL)
   {  flag=1;
	  line((lval+hval)/2-4,y-4,(lval+(hval-(640/n)))/2,y+40);  //FOR DISPLAY OF LINE
	  display(trav->left,lval,hval-(640/n),y+40,level+1);
   }
   if(trav->right!=NULL)
   {  flag=0;
	  line((lval+hval)/2+4,y-4,((lval+(640/n))+hval)/2,y+40);
	  display(trav->right,lval+(640/n),hval,y+40,level+1);
   }

}




	  void insert(struct node*r,struct node*p)
	  {                    /* FUNCTION  FOR  INSERTION  */
	   char ans;
	   fflush(stdin);
	   printf("\n  Wish To Insert Left/Right of %s:",r->data);
	   scanf("%c",&ans);
	  if((ans=='r')||(ans=='R'))
	   {
	    if(r->right==NULL)
	      r->right=p;
	     else
	      insert(r->right,p);        // RECURSIVE CALL
	     }
	     else
	     {
	      if(r->left==NULL)
	       r->left=p;
	      else
		insert(r->left,p);    /* RECURSIVE CALL */
	     }
	   }
	   void pretrav(struct node*r) /* FUNCTION FOR RECURSIVE PRE-ORDER
							TRAVERSAL  */
	   {
	    if(r!=NULL)
	     {
	     printf("%s\t",r->data);
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
	     printf("%s\t",r->data);
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
	     printf("%s\t",r->data);
	    }
	   }

     void nintrav(struct node*r)/* FUNCTION FOR NON-RECURSIVE IN-ORDER
							TRAVERSAL  */
	     {  	int flag=0;
		int top=0;
		w=r;

		printf("\n\n\t");
		while(top!=-1&&w!=NULL)
		{
		 while(flag==0&&w->left!=NULL)
		 {
		  stack[top]=w;
		  top++;
		  w=w->left;
		 }
		 printf("  %s  ",w->data);

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
	       }                // INORDER FUNCTION ENDS

     void npretrav(struct node*r)/* FUNCTION FOR NON-RECURSIVE PRE-ORDER
							TRAVERSAL  */
	     {  int sptr=0;
	      int flag=0;
	      struct node *stk[50];
	      while(flag==0)
		{
		 while(r!=NULL)
		 {
		 printf( "  %s   ",r->data);
		 stk[++sptr]=r;
		     r=r->left;
		 }
		 if(sptr!=0)
		 {
		 r=stk[sptr--];
		 r=r->right;
		 }
		 if(r==NULL&&sptr==0)
				  flag=1;

				  }
				  getch();
				  }
void npostrav(struct node*r)/* FUNCTION FOR NON-RECURSIVE Post-ORDER
							TRAVERSAL  */
		 {         struct node *temp[50];
			   int j=0,ret[20];
		 loop1:
			   if(r!=NULL)
			   {
			   ret[j]=30;
			   temp[j++]=r;
			   r=r->left;
			   goto loop1;
		 loop2:
			  ret[j]=60;
			  temp[j++]=r;
			  r=r->right;
			  goto loop1;
		loop3:
			  printf(" %s  ",r->data);
			  }
			  if(j>0)
			  {
			  r=temp[--j];
			  if(ret[j]==30)
			  goto loop2;
			  else if(ret[j]==60)
			  goto loop3;
		   }

				}             //POSTORDER FUNCTION ENDS

