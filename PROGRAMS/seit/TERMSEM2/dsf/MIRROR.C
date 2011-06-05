#include<stdio.h>
#include<graphics.h>
#include<math.h>
struct tree {  int data;
struct tree *left,*right;
};
struct tree *root,*temp,*trav;
int no,flag=0,k=0;
menu()
{  clrscr();
   printf("\n\n\n THE PROGRAM TO PRINT BINARY SEARCH TREE\n\n");
   printf("\n 1. DATA ENTRY INTO THE TREE");
   printf("\n 2. DISPLAY OF THE TREE");
   printf("\n 3. CREATE THE MIRROR IMAGE OF TREE");
   printf("\n 4. EXIT \n\n");
   printf("\n ENTER YOUR CHOICE");
   return;
}

main()
{   int ch,gd=DETECT,gm,h;
	while(1)
	{	menu();
		scanf("%d",&ch);
		switch(ch)
		{   case 1:  printf("\n ENTER THE NUMBER YOU WANT TO INSERT");
			  scanf("%d",&no);
			  if(root==NULL)
			  {   temp=(struct tree *)malloc(sizeof(struct tree));
				  temp->left=NULL;
				  temp->right=NULL;
				  temp->data=no;
				  root=temp;}
			  else
				 insert(root);
			  break;
			case 2:
			  if(root==NULL)
				 printf("\n THE TREE IS EMPTY ");
			  else
			   { initgraph(&gd,&gm,"E:\\tc\\bgi");
				 display(root,1,getmaxx()+1,15,1);  // 640 is the getmaxx
				 setcolor(14);
				 outtextxy(370,15,"<--- ROOT");
				 setcolor(4);
				 settextstyle(4,0,3);
				 outtextxy(200,430,"Fig :-  BINARY TREE ");
				 setcolor(getmaxcolor());
				 getch();
				 closegraph();
			   } break;
			case 3:
				tree(root);
				break;
			case 4:
				exit(0);
}	}	}
// DISPLAYING THE GRAPHICAL REPRESENTATION OF THE TREE

display(struct tree *trav,int lval,int hval,int y,int level)
{
	char msg[10];
	int n,i;
	sprintf(msg,"%d",trav->data);
	circle((lval+hval)/2+4,y+4,10);
	outtextxy((lval+hval)/2,y,msg);
	n=pow(2,level);
	if(trav->left!=NULL)
	{
		line((lval+hval)/2-4,y-4,(lval+hval-(640/n))/2,y+40);
		display(trav->left,lval,hval-(640/n),y+40,level+1);
	}
	if(trav->right!=NULL)
	{
		line((lval+hval)/2+4,y-4,(lval+hval+640/n)/2,y+40);
		display(trav->right,lval+640/n,hval,y+40,level+1);
	}
}

/*
display(struct tree *trav,int lval,int hval,int y,int level)
{  char msg[10];
   int n=1,i;
   sprintf(msg,"%d",trav->data);
   outtextxy((lval+hval)/2,y,msg);
   circle(((lval+hval)/2)+4,y+4,10);
   n=pow(2,level);
   if(trav->left!=NULL)
   {
	  line((lval+hval)/2-4,y-4,(lval+(hval-(640/n)))/2,y+40);
	  display(trav->left,lval,hval-(640/n),y+40,level+1);
   }
   if(trav->right!=NULL)
   {
	  line((lval+hval)/2+4,y-4,((lval+(640/n))+hval)/2,y+40);
	  display(trav->right,lval+(640/n),hval,y+40,level+1);
   }
   return;
}  */
/* INSERTION FUNCTION */
insert(struct tree *trav)
{   if(no<trav->data)
	{   if(trav->left==NULL)
		{   temp=(struct tree *)malloc(sizeof(struct tree));
			temp->left=NULL;
			temp->right=NULL;
			temp->data=no;
			trav->left=temp;
		}
		else
		insert(trav->left);
	}
	else
	{  if(trav->right==NULL)
		{   temp=(struct tree *)malloc(sizeof(struct tree));
			temp->left=NULL;
			temp->right=NULL;
			temp->data=no;
			trav->right=temp;
		}
		else
		 insert(trav->right);
}	  return; }

 tree(struct tree *r)

{
struct tree *q;
if(r!=NULL)
{
tree(r->left);
tree(r->right);
q=r->left;
r->left=r->right;
r->right=q;
}
return 0;
}
