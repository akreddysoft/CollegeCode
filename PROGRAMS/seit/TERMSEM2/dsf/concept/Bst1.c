#include<malloc.h>
#include<graphics.h>
struct tree
{
	int data;
	struct tree *left,*right;
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
	printf("3 delete\n");
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
				if(root==NULL)
				{
					root=malloc(size);
					root->data=n;
					root->right=root->left=NULL;
				}
				else
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

insert(struct tree *temp,int n)
{
	struct tree *newnode;
	if(n<temp->data)
	{
		if(temp->left==NULL)
		{
			newnode=malloc(size);
			newnode->data=n;
			newnode->left=newnode->right=NULL;
			temp->left=newnode;
		}
		else
			insert(temp->left,n);
	}
	else
	{
		if(temp->right==NULL)
		{
			newnode=malloc(size);
			newnode->data=n;
			newnode->left=newnode->right=NULL;
			temp->right=newnode;
		}
		else
			insert(temp->right,n);
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
	  line((lval+hval)/2+4,y-4,(lval+hval+(640/n))/2,y+40);
	  display(trav->right,lval+(640/n),hval,y+40,level+1);
   }
}

delet(struct tree **root,int num)
{
	struct tree *xsucc,*par,*x;
	int found;
	par=x=NULL;
	if(*root==NULL)
	{
		printf("\nEmpty");
		return ;
	}
	search(root,num,&x,&par,&found);
	if(found==0)
	{
		printf("\nnode not exist");
		return;
	}
	//doesnt deletes,shift the x and parent pointer to the child node
	//which is to be replaced by the deleted node,before shifting,
	//copies the data of node to be replace to the delted node
	if(x->left!=NULL&&x->right!=NULL)
	{
		par=x;
		xsucc=x->right;
		while(xsucc->left!=NULL)
		{
			par=xsucc;
			xsucc=x->left;
		}
		x->data=xsucc->data;
		x=xsucc;
	}
	if(x->left==NULL&&x->right==NULL)
	{
		if(par->left==x)
			par->left=NULL;
		else
			par->right=NULL;
		free(x);
	}

	if(x->left!=NULL&&x->right==NULL)
	{
		if(par->left==x)
			par->left=x->left;
		else
			par->right=x->left;
	}
	if(x->left==NULL&&x->right!=NULL)
	{
		if(par->left==x)
			par->left=x->right;
		else
			par->right=x->right;
	}
}

search(struct tree **root,int n,struct tree **x,struct tree **par ,int *found)
{
	struct tree *temp=*root;
	*found=0;
	*par=NULL;
	while(temp!=NULL)
	{
		if(temp->data==n)
		{
			*x=temp;
			*found=1;
			return;
		}
		if(n<temp->data)
		{
			*par=temp;
			temp=temp->left;
		}
		else
		{
			*par=temp;
			temp=temp->right;
		}
	}
}