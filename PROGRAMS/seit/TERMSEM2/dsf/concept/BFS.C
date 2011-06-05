#include<qarr.h>
#include<stack1.h>
#include<malloc.h>
struct node
{
	int data;
	struct node *next;
};
int size=sizeof(struct node);
struct node1
{
	int data;
	struct node *next;
	struct node1 *down;
};
int size1=sizeof(struct node1);
void disp(struct node1 *header);
void bfs(struct node1 *head);
void dfs(struct node1 *head);

void main()
{
  int i,k,n,ch,numhead,j;
  struct node1 *head=NULL,*temp,*thead;
  struct node *tempnex,*temp1nex;
  clrscr();
  printf("\nEnter the number of nodes:");
  scanf("%d",&n);
  numhead=n;
  printf("\nEnter the nodes:");
  for(i=0;i<n;++i)
  {
	scanf("%d",&ch);
	if(head==NULL)
	{
		head=malloc(size1);
		head->data=ch;
		head->next=NULL;
		head->down=NULL;
	}
	else
	{
		thead=head;
		while(thead->down!=NULL)
			thead=thead->down;
		temp=malloc(size1);
		temp->data=ch;
		temp->next=NULL;
		temp->down=NULL;
		thead->down=temp;
	}
   }
   thead=head;
   temp=head;
   for(j=0;j<numhead;++j)
   {
	   printf("\nHow many nodes are linked with %d: ",thead->data);
	   scanf("%d",&n);
	   for(i=0;i<n;++i)
	   {
		printf("\nEnter the node that is linked with %d:",thead->data);
		scanf("%d",&ch);
		tempnex=malloc(size);
		tempnex->data=ch;
		tempnex->next=NULL;

		while(temp->next!=NULL)
			temp=temp->next;
		temp->next=tempnex;
	   }
		thead=thead->down;
		temp=thead;
	}
	disp(head);
	bfs(head);
	dfs(head);
}

void disp(struct node1 *header)
{
	struct node *temp=header->next;
	while(header!=NULL)
	{
		printf("%d\t",header->data);
		temp=header->next;
		while(temp!=NULL)
		{
			printf("%d  ",temp->data);
			temp=temp->next;
		}
		header=header->down;
		printf("\n");
	}
}

void bfs(struct node1 *head)
{
	struct node1 *thead=head;
	struct node *temp=head->next;
	int result[30],j=-1,i,item;
	struct queue q;
	q.front=0;q.rear=-1;
	result[++j]=head->data;
	do//////////////////////////////////////////////////
	{
		while(temp!=NULL)
		{
			if(ifnotexist(result,temp->data,j))
				insert(&q,temp->data);
			temp=temp->next;
		}
		item=remove(&q);
		if(ifnotexist(result,item,j))
			result[++j]=item;
		////////////////////////////////////////////////////
		thead=head;
		while(thead->data!=result[j])
			thead=thead->down;
		temp=thead->next;
	}while(!empty(q));/////////////////////////////////////////

	printf("\nThe bfs is:");
	for(i=0;i<=j;++i)
		printf("%d",result[i]);
}

ifnotexist(int result[30],int num,int j)
{
	int i,flag1=1;
	for(i=0;i<=j;++i)
	{
			if(num==result[i])
				flag1=0;
	}
	if(flag1==0)
		return 0;
	else
		return 1;
}


void dfs(struct node1 *head)
{
	struct node1 *temp1=head,*thead=head;
	struct node *temp=head->next;
	int result[30],flag=1,j=-1,i,item,flag1=1;
	struct stack s;
	s.top=-1;

	result[++j]=head->data;
	push(&s,head->data);
	do//////////////////////////////////////////////////
	{
		while(temp!=NULL)
		{
			if(ifnotexist(result,temp->data,j))
			{
				result[++j]=temp->data;
				push(&s,temp->data);
				thead=head;
				while(thead->data!=result[j])
					thead=thead->down;
				temp=thead->next;
			}
			else
				temp=temp->next;
		}

		item=pop(&s);
		thead=head;
		while(thead->data!=item)
			thead=thead->down;
		temp=thead->next;
	}while(!emptystack(s));

	printf("\nThe dfs is:");
	for(i=0;i<=j;++i)
		printf("%d",result[i]);
}

/*
1       2  3
2       1  4  5
3       1  5
4       2  6  7
5       2  3  8
6       4  9
7       4
8       5
9       6

The bfs is:123456789
*/