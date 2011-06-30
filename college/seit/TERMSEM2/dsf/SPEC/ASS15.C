#include<stdio.h>
#include<graphics.h>
struct tree {
int data;
struct tree *left,*right;
};
struct tree *root,*temp,*trav;
int no,flag=0,k=0;

main()
{
	int ch,gd=DETECT,gm,h;
	clrscr();
   printf("\n 1. DATA ENTRY INTO THE TREE");
   printf("\n 2. DISPLAY OF THE TREE");
   printf("\n 3. DISPLAY OF THE LEAF NODES & THE HEIGHT");
   printf("\n 0. EXIT \n");
   printf("\n ENTER YOUR CHOICE");
	while(1)
	{
		scanf("%d",&ch);
		switch(ch)
		{
		case 1:  printf("\n ENTER THE NUMBER YOU WANT TO INSERT");
			  scanf("%d",&no);
			  if(root==NULL)
			  {
				  temp=(struct tree *)malloc(sizeof(struct tree));
				  temp->left=NULL;
				  temp->right=NULL;
				  temp->data=no;
				  root=temp;
			  }
			  else
				 insert(root);        //CALLING INSERTION FUNCTION
			  break;
			case 2:
			  if(root==NULL)
				 printf("\n THE TREE IS EMPTY ");
			  else
			   {
				 initgraph(&gd,&gm,"e:\\tc\\bgi");
			  //CALLING FUNCTION FOR DISPLAY
				 display(root,1,getmaxx()+1,15,1);  // 640 is the getmaxx
				 setcolor(14);
				 outtextxy(370,15,"<--- ROOT");
				 setcolor(4);
				 getch();
				 closegraph();
			   }
			   break;
			case 3:
				printf("\n THE LEAF NODES ARE");
				height(root,1);       //CALLING FUNCTION FOR DISPLAY OF HEIGHT
				printf("\n THE HEIGHT IS %d ",k);
				break;
			case 0:
				exit(0);
}	}	}

// DISPLAYING THE GRAPHICAL REPRESENTATION OF THE TREE
display(struct tree *trav,int lval,int hval,int y,int level)
{
   char msg[10];
   int n=1,i;
   sprintf(msg,"%d",trav->data);
   outtextxy((lval+hval)/2,y,msg);
   circle(((lval+hval)/2)+3,y+3,10);	//FOR DISPLAY OF CIRCLE
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
   return;
}
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

// FINDING THE HEIGHT OF THE TREE
height(struct tree *trav,int level)
{
 if(trav!=NULL)
{
if((trav->left==NULL)&&(trav->right==NULL))
{
printf("\n    %d    ",trav->data);         //DISPLAYING THE LEAF NODES
if(level>k)

k=level;
}
else
{
height(trav->left,level+1);
height(trav->right,level+1) ;
}
}
return 0;
}

