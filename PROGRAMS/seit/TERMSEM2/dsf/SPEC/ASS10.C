/*CREATION OF BINARY TREE AND PERFORM RECURSIVE AND
  NON RECURSIVE TRAVERSALS

  MADHUR AHUJA
  ROLL NO 22
*/
#include<stdio.h>
struct node
	{
	   int data;
	   struct node *left,*right;
	}  *root,*node,*root1,*r,*c,*t,*f,*stack[20];
  void attach(struct node *r,struct node *n)
	 {
	     int data;
		  char place;
	     clrscr();
	     printf("\nattach to left or right of %d (l/r) ?",r->data);
		 fflush(stdin);
	     scanf("%c",&place);
		   if(place=='l')
			{
			   if(r->left==NULL)  r->left=n;
			   else         attach(r->left,n);
			}
		    else
				 {

			   if(r->right==NULL)  r->right=n;
			   else         attach(r->right,n);
			}
	 }
  void tree(struct node *t1,int x,int y)
     {
	  if(t1!=NULL)
	    {
	    gotoxy(x-3,y+1) ;
		  printf("%d ",t1->data);

	  tree(t1->left,x-3,y+1);
	  if(t1!=NULL)
	    gotoxy(x+3,y);
	  tree(t1->right,x+3,y+1);
	     }
    }
   void preorder(struct node *c)
	 {
	    if(c!=NULL)
	       {
		  printf("%d ",c->data);
		  preorder(c->left);
		  preorder(c->right);
			}
	 }
   void inorder(struct node *c)
	 {
	    if(c!=NULL)
	       {
		  inorder(c->left);
		  printf("%d ",c->data);
		  inorder(c->right);
	       }
	 }
   void postorder(struct node *c)
	 {
	    if(c!=NULL)
		   {
		  postorder(c->left);
		  postorder(c->right);
		  printf("%d ",c->data);
		   }
	 }
	void nonrec(struct node *t)
	  {
	   int choose,i=0,end=0;
	   clrscr();
	   printf("\n\n1 inorder\n2 preorder\n3 postorder\n");
	 printf("\nenter choice :");
	 fflush(stdin);
	 scanf("%d",&choose);
	   switch(choose)
	    {
	      case 1:
	     printf("\nthe inorder form without recursion\n");
		 while(end==0)
		 {
				goto left;
			left :
		      while(t!=NULL)
				  {
					stack[i]=t;
				    i++;
					t=t->left;
				  } ;

	    if(i!=0)
		{
		   printf("%d ",stack[i-1]->data);
		   i--;
		   if(stack[i]->right!=NULL)
		   t=stack[i]->right;
		    goto left;
		}
		else end=1;
	       }
	       break;
	 case 2:
	      printf("\nthe preorder form without recursion\n");
	      while(end==0)
			{
			  goto left1;
				 left1 :
				  while(t!=NULL)
				  {
				    stack[i]=t;
				    i++;
				     printf("%d ",stack[i-1]->data);
				    t=t->left;
				  } ;

		 if(i!=0)
		{
		   i--;
		   if(stack[i]->right!=NULL)
		   t=stack[i]->right;
		    goto left1;
		}
		else end=1;
	  }
	 break;
		 case 3:
	      printf("\nthe postorder form without recursion\n");
		  while(end==0)
		    {
		      goto left2;
		       left2 :
			      while(t!=NULL)
				  {
				    stack[i]=t;
				    i++;
				    t=t->left;
				  } ;

	    if(i!=0)
		{
		   i--;
			 if(stack[i]!=root1)
		    printf("%d ",stack[i]->data);
		   if(stack[i]->right!=NULL)
		   t=stack[i]->right;
			goto left2;
		}
	else
		     {
		       end=1;
		      printf("%d ",root1->data);
			  }

	  }
	 break;
	  }
	getch();
     }
       void main()
		{
	 int data,choice,f,n=20,m=20;
	 char ch;
	 root=NULL;
	 clrscr();
  while (1)
	   {
	  printf("\n\nmain menu ");
	 printf("\n\n1 create\n2 recursive traverse\n3 display tree\n4 non recursive traverse\n5 exit\n");
	 printf("\nenter choice :");
	 fflush(stdin);
	 scanf("%d",&choice);
	 switch(choice)
	    {
	      case 1:
		while(ch!='n')
		   {
		     node=(struct node*)malloc(sizeof(struct node ));
		     node->right=NULL;
		     node->left=NULL;
		     printf("\nenter data :");
		     scanf("%d",&node->data);
			 if(root==NULL)
			    {
			      root=node;
				  root1=node;
				  printf("\nroot node created\n") ;
			    }
			 else attach(root,node) ;
		     printf("\nwant to attach more nodes (y/n) :");
		     fflush(stdin);
		  scanf("%c",&ch);

		   }
		   break;
		case 2 :
		      clrscr();
		      printf("\n1 preorder\n2 inorder\n3 postorder\n");
		      printf("\nenter the format :");
			fflush(stdin);
		      scanf("%d",&f);
			   switch(f)
				  {
				case 1:
				clrscr();
				printf("\nthe preorder form \n");
				preorder(root1);  break;
				case 2:
				clrscr();
				printf("\nthe inorder form \n");
				inorder(root1) ;  break;
				case 3:
				clrscr();
				printf("\nthe postorder form \n");
				postorder(root1); break;
			      }
		      break;
		 case 3 :
		 tree(root1,n,m); break;
		 case 4 :
		 nonrec(root1);
		 break;
		 case 5 : exit(0);
	    }
	}
	  }

/*  OUTPUT
main menu

1 create
2 recursive traverse
3 display tree
4 non recursive traverse
5 exit

enter choice :1

enter data :4

root node created

want to attach more nodes (y/n) :y

enter data :5

attach to left or right of 4 (l/r) ?l

want to attach more nodes (y/n) :y

enter data :45

attach to left or right of 4 (l/r) ?r

want to attach more nodes (y/n) :y

enter data :7

attach to left or right of 5 (l/r) ?l

want to attach more nodes (y/n) :n



1 create
2 recursive traverse
3 display tree
4 non recursive traverse
5 exit

enter choice :2



the inorder form
7 5 4 45

main menu

1 create
2 recursive traverse
3 display tree
4 non recursive traverse
5 exit

enter choice :3




										  4
									  5     45
									7


main menu
1 create
2 recursive traverse
3 display tree
4 non recursive traverse
5 exit

enter choice :5


*/
