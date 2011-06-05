#include<malloc.h>
#include<graphics.h>
#include<stacktre.h>
#include<math.h>
void insert(struct tree * temp,int n);
void preorder(struct tree *temp);
void inorder(struct tree *temp);
void postorder(struct tree *temp);
void display(struct tree *trav,int lval,int hval,int y,int level);
void mirror(struct tree *temp);
void swap(struct tree **a,struct tree **b);
void intrav(struct tree *root);
void pretrav(struct tree *root);
void postrav(struct tree *root);
void postrav1(struct tree*r);
int nrheight(struct tree *);
struct tree
{
	int data;
	struct tree *left,*right;
};

typedef struct tree *tree;
int size=sizeof(struct tree);

void main (void)
{
	struct tree *root=NULL,*temp;
	int i,n,ch,high;
	int gd=DETECT,gm;
	while(1)
	{
	clrscr();
	printf("1 insert\n");
	printf("2 display\n");
	printf("3 inorder traversal\n");
	printf("4 preorder traversal\n");
	printf("5 postorder traversal\n");
	printf("6 print mirror\n");
	printf("7 display height of tree and the leaves\n");
	printf("8 without recur inorder trav\n");
	printf("9 without recur preorder trav\n");
	printf("10 withour recur postorder trav\n");
	printf("11 harshits\n");
	printf("12 without recur height and leaves\n");
	printf("0 exit\n");
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
					root->right=NULL;
					root->left=NULL;
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
			case 4:
				printf("\nThe preorder is:\n");
				preorder(root);
				break;
			case 3:
				printf("\nThe inorder is:\n");
				inorder(root);
				break;
			case 5:
				printf("\nThe postorder is:\n");
				postorder(root);
				break;
			case 6:
				mirror(root);
				initgraph(&gd,&gm,"e:\\tc\\bgi");
				display(root,1,640,15,1);
				getch();
				closegraph();
				break;
			case 7:
				high=height(root,0);
				printf("\nThe height is : %d",high);
				break;
			case 8:
				printf("\nThe inorder is:\n");
				intrav(root);
				break;
			case 9:
				printf("\nThe preorder is:\n");
				pretrav(root);
				break;
			case 10:
				printf("\nThe postorder is:\n");
				postrav(root);
				break;
			case 11:
				printf("\nThe postorder is:\n");
				postrav2(root);
				break;
			case 12:
				nrheight(root);
				break;

			case 0:
				exit(0);
		}
	getch();
	}
}

void insert(tree temp,int n)
{
	int ch;
	struct tree *newnode;
	printf("\nLeft(1) or right(2) of %d:",temp->data);
	scanf("%d",&ch);
	if(ch==1)
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
	if(ch==2)
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
	int n,i;
	sprintf(msg,"%d",trav->data);
	outtextxy((lval+hval)/2,y,msg);
	circle((lval+hval)/2+4,y+4,10);
	n=pow(2,level);
	if(trav->left!=NULL)
	{
		line((lval+hval)/2-4,y-4,(lval+(hval-(640/n)))/2,y+40);
		display(trav->left,lval,hval-640/n,y+40,level+1);
	}
	if(trav->right!=NULL)
	{
		line((lval+hval)/2+4,y-4,(lval+hval+640/n)/2,y+40);
		display(trav->right,lval+640/n,hval,y+40,level+1);
	}
}


void preorder(struct tree *temp)
{
	if(temp!=NULL)
	{
		printf("%d ",temp->data);
		preorder(temp->left);
		preorder(temp->right);
	}
}
void inorder(struct tree *temp)
{
	if(temp!=NULL)
	{
		inorder(temp->left);
		printf("%d ",temp->data);
		inorder(temp->right);
	}
}
void postorder(struct tree *temp)
{
	 if(temp!=NULL)
	 {
		postorder(temp->left);
		postorder(temp->right);
		printf("%d ",temp->data);
	 }
}
void mirror(struct tree *temp)
{
	if(temp!=NULL)
	{
		mirror(temp->left);
		mirror(temp->right);
		if(!(temp->left==NULL&&temp->right==NULL))
			swap(&temp->left,&temp->right);
	}
}

void swap(struct tree **a,struct tree **b)
{
	struct tree *temp;
	temp=*a;
	*a=*b;
	*b=temp;
}

height(struct tree *temp,int hit)
{
	static int htree=0;
	if(temp!=NULL)
	{
		if(temp->left==NULL&&temp->right==NULL)     //height is decided at leaf nodes
		{
			printf("\nThe leaf nodes are: %d",temp->data);
			if(hit>htree)
				htree=hit;
		}
		else
		{
			height(temp->left,hit+1);
			height(temp->right,hit+1);
		}
	}
	return htree;
}

nrheight(struct tree *temp)
{
	int count=0;
	struct tree *curr=temp;
	struct stack s;
	s.top=-1;
	push(&s,temp);
	while(!empty(s))
	{
		if(curr->left==0&&curr->right==0)
		{
			count++;
			printf("\nthe leave is: %d",curr->data);
			curr=pop(&s);
			continue;
		}

		if(curr->left!=0)
			push(&s,curr->left);
		if(curr->right!=0)
			push(&s,curr->right);
		curr=pop(&s);
	}
	printf("\nthe count is: %d",count);
	getch();
	return 0;
}
	

void intrav(struct tree *root)
{
	struct stack s;
	struct tree *temp;
	s.top=-1;
	temp=root;
	do
	{
		while(temp!=NULL)
		{
			push(&s,temp);
			temp=temp->left;
		}
		if(!empty(s))
		{
			temp=pop(&s);
			printf("%d ",temp->data);
			temp=temp->right;
		}
	}while(!empty(s)||temp!=NULL);
}

void pretrav(struct tree *root)
{
	struct stack s;
	struct tree *temp;
	s.top=-1;
	temp=root;
	do
	{
		while(temp!=NULL)
		{
			printf("%d ",temp->data);
			push(&s,temp);
			temp=temp->left;
		}
		if(!empty(s))
		{
			temp=pop(&s);
			temp=temp->right;
		}
	}while(!empty(s)||temp!=NULL);
}

void postrav(struct tree *root)
{
	struct stack s;
	struct tree *temp;
	s.top=-1;
	temp=root;
	do
	{
		while(temp!=NULL)
		{
			push(&s,temp);
			temp=temp->left;
		}
		if(!empty(s))
		{
			temp=pop(&s);
			temp=temp->right;

		}
				printf("%d ",temp->data);
		}while(!empty(s)||temp!=NULL);
}


void postrav1(struct tree*r)/* FUNCTION FOR NON-RECURSIVE Post-ORDER*/
{
			struct tree *temp[20];
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
				  printf(" %d ",r->data);
			  }
			  if(j>0)
			  {
				  if(ret[j]==30)
					  goto loop2;
				  else if(ret[j]==60)
					  goto loop3;
		   }

	 }             //POSTORDER FUNCTION ENDS
postrav2(struct tree *root)
{
	struct stack s;
	struct tree *temp;
	s.top=-1;
	temp=root;
	while(1)
	{
		while(temp!=NULL)
		{
			push(&s,temp);
			temp=temp->left;
		}
		if(s.st[s.top]->right==0)
		{
			temp=pop(&s);
			printf("%d ",temp->data);
		}
		while(s.st[s.top]->right==temp&&s.top!=-1)
		{
			temp=pop(&s);
			printf("%d ",temp->data);
		}

		if(empty(s))
		{
			break;
			temp=s.st[s.top]->right;

		}
	}
}
