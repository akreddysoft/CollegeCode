#include<stack.h>
#include<conio.h>
void main (void)
{
int i,n;
enum boolean
{
	false=0,true=1,
};
struct tree
{
	int data;
	struct tree *left,*right;
	enum boolean lt,rt;
};
typedef struct tree tree;
int size=sizeof(struct tree);
void main (void)
{
	struct tree *root=NULL,*temp;
	int i,n,ch;
	int gd=DETECT,gm,flag;
	clrscr();
	printf("1 insert\n");
	printf("2 display\n");
	printf("3 traverse\n");
	printf("0 exit\n");
	while(1)
	{
		printf("\nEnter choice:");
		scanf("%d",&ch);
		switch(ch)
		{
			case 1:
				printf("\nEnter the data:");
				scanf("%d",&n);
				insert(root,n);
				break;
			case 2:
				initgraph(&gd,&gm,"e:\\tc\\bgi");
				display(root,1,640,15,1);
				getch();
				closegraph();
				break;
			case 3:
				printf("\nEnter the node to delte:");
				scanf("%d",&n);
				delet(&root,n);
				break;
			case 0:
				exit(0);
		}
	}
}

insert(struct tree **temp,int n)
{
	struct tree *newnode;
	struct tree *temp1=*temp;
	struct tree  *z,*prev;
	struct tree *head;
	z=malloc(size);
	z->data=n;
	z->lt=true;
	z->rt=true;
	if(*temp==NULL)
	{
		head=malloc(size);
		head->data=999;
		head->left=root;
		head->right=head;

		z->left=head;
		z-right=head;
		*temp=head;
	}
	else
	{
		temp1=head->left;
		while(temp1!=head)
		{
			if(n<temp1->data)
			{
				if(temp1->lt=true)
					temp1=temp1->left;
				else
				{
					z->left=temp1->left;
					temp1->left=false;
					z->lt=false;
					z->rt=true;
					z->right=temp1;
					return;
				}
			}
			else
			{
				if(n>temp1->data)
				{
					if(temp1->rt=true)
						temp1=temp1->right;
				else
				{
					z->right=temp1->right;
					temp1->right=z;
					temp->rt=false;
					z->lt=true;
					z->left=p;
				}
			}
		}
	}
}

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
   {
	  line((lval+hval)/2-4,y-4,(lval+(hval-(640/n)))/2,y+40);  //FOR DISPLAY OF LINE
	  display(trav->left,lval,hval-(640/n),y+40,level+1);
   }
   if(trav->right!=NULL)
   {
	  line((lval+hval)/2+4,y-4,((lval+(640/n))+hval)/2,y+40);
	  display(trav->right,lval+(640/n),hval,y+40,level+1);
   }
}
