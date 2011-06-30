#include<malloc.h>
#include<graphics.h>
#include<math.h>
#include<stdio.h>
#include<stacktre.h>

void insert(struct tree *temp,int);
void display(struct tree *trav,int lval,int hval,int y,int level);

struct tree
{
	int data;
	struct tree *left,*right;
};
struct tree * delet(struct tree *temp);

int size=sizeof(struct tree);
 struct tree *dlt;

void main()
{
	struct tree *root=NULL,*temp,*dltree;
	int i,j,k,ch,n;
	int gd=0,gm;
	clrscr();
	printf("\n1 insert");
	printf("\n2 disp");
	printf("\n3 delete");
	while(1)
	{
		printf("\n enter choice:");
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
					root->left=root->right=NULL;
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
				delet(root);
				if(dlt->left==NULL&&dlt->right==NULL)
					simple(root,dlt);
				if(dltree->left!=NULL&&dltree->right!=NULL)
 //					complex(&dltree);
//				else
   //					inter(&dltree);
				break;
			case 4:
				break;
			case 0:
				exit(0);
		}
	}
}

void insert(struct tree *temp,int n)
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

void display(struct tree *trav,int lval,int hval,int y,int level)
{
   char msg[10];
   int n=1,i;
   sprintf(msg,"%d",trav->data);
   outtextxy((lval+hval)/2,y,msg);
   circle(((lval+hval)/2)+3,y+3,10);	//FOR DISPLAY OF CIRCLE
   n=pow(2,level);
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

struct tree * delet(struct tree *temp)
{
	static int ch;
	if(temp!=NULL&&ch==0)
	{
		printf("\nwant to delete(1/0) %d: ",temp->data);
		fflush(stdin);
		scanf("%d",&ch);
		if(ch==0)
		{
			delet(temp->left);
			delet(temp->right);
		}
		else
		{
		  dlt=temp;
		}
	}
}

simple(struct tree *root,struct tree *del)
{
	struct tree *temp;
	struct tree *list[30];
	int found=0,j=0,i,count=1;
	struct stack s;
	temp=root;
	s.top=-1;
	do
	{
		while(temp!=NULL&&!found)
		{
			push(&s,temp);
			temp=temp->left;
		}
		if(!empty(s)||temp!=NULL)
		{
			temp=pop(&s);
			printf("%d ",temp->data);
			list[j++]=temp;
			++count;
			temp=temp->right;
		}
	}while(temp!=NULL&&!found&&!empty(s));

	for(i=0;i<count;++i)
	{
		if(list[i]==del)
		break;
	}
	if(i==1)
	temp=list[i-1];
	temp->left=temp->right=NULL;
}






