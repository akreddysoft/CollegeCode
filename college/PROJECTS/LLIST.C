#include<alloc.h>
void append(struct node **,int );
void inafter(struct node *,int,int);
void inbefore(struct node**,int,int);
void inbeg(struct node **,int);
void deleted(struct node **,int);
void count(struct node*);
void display(struct node *list);
struct node
{
 int val;
 struct node *link;
};
int size=sizeof(struct node);
void main()
{

	int i,j,k,choice,data,prevdata;
	char ch;
	struct node *first=NULL,*last;
	clrscr();
	printf("\n1 Append");
	printf("\n2 Insert after...");
	printf("\n3 Insert before...");
	printf("\n4 Insert beginning");
	printf("\n5 Delete");
	printf("\n6 Count");
	printf("\n0 Exit");
	do
	{
	 printf("\nEnter choice:");
	 scanf("%d",&choice);
	 switch(choice)
	 {
		case 1:
		printf("\nEnter the value to be appended:");
		scanf("%d",&data);
		append(&first,data);
		display(first);
		break;
		case 2:
		printf("\nEnter the value to be inserted");
		scanf("%d",&data);
		printf("\nEnter the value to be inserted after:");
		scanf("%d",&prevdata);
		inafter(first,data,prevdata);
		display(first);
		break;
		case 3:
		printf("\nEnter the value to be inserted");
		scanf("%d",&data);
		printf("\nEnter the value to be inserted before:");
		scanf("%d",&prevdata);
		inbefore(&first,data,prevdata);
		display(first);
		break;
		case 4:
		printf("\nEnter the value to be inserted in beginning");
		scanf("%d",&data);
		inbeg(&first,data);
		display(first);
		break;
		case 5:
		printf("\nEnter the value to be deleted:");
		scanf("%d",&data);
		deleted(&first,data);
		display(first);
		break;
		case 6:
		count(first);
	 }
	}
	while(choice!=0);
}

//first is passed by address when there is no list created
//there is change of node first, else not needed.
void append(struct node **list,int data)
{
 struct node *temp,*x;
 temp=*list;
 if(*list==NULL)
 {
	printf("List was empty\n");
	(*list)=malloc(size);
	(*list)->val=data;
	(*list)->link=NULL;
 }
 else
 {
	while(temp->link!=NULL)
		temp=temp->link;
	x=malloc(size);
	x->val=data;
	x->link=NULL;
	temp->link=x;
 }
}
void inafter(struct node *list,int data,int prevdata)
{
 struct node *x;
 if(list==NULL)
	printf("List empty,not possible\n");
 else
	{
	 while(list!=NULL)
	 {
		 if(list->val==prevdata)
		 {
			x=malloc(size);
			x->val=data;
			x->link=list->link;
			list->link=x;
			break;
		}
		list=list->link;
	 }
	if(list==NULL)
	 printf("\nValue not found\n");
 }
}
//in this func list is passed by address, there is possibility of change of
//pointer first i.e. when we insert the node before the first node.
//otherwise there is no need to send the first by address
void inbefore(struct node**list,int data,int prevdata)
{
	struct node *x,*temp,*back;
	int found=0;
	temp=*list;
	if(*list==NULL)
	 printf("\nList empty,not possible");
	else
	{
	 while(temp!=NULL)
	 {
		if(temp->val==prevdata)
		{
		 found=1;
		 if(*list==temp)
		 {
			x=malloc(size);
			x->val=data;
			x->link=*list;
			*list=x;
		 }
		 else
		 {
			x=malloc(size);
			x->val=data;
			x->link=temp;
			back->link=x;
		 }
		}
		back=temp;
		temp=temp->link;
	 }
	 if(found==0)
	 printf("\nValue not found\n");
	}
}
void inbeg(struct node **list,int data)
{
 struct node *x;
 if(*list!=NULL)
 {
	x=malloc(size);
	x->val=data;
	x->link=*list;
	*list=x;
 }
 else
	printf("\nList empty,not possible\n");
}
void deleted(struct node **list,int data)
{
 struct node *temp,*back;
 int found=0;
 temp=*list;
 if(*list==NULL)
	printf("\nList empty,not possible");
 else
 {
	while(temp!=NULL)
	{
	 if(temp->val==data)
	 {
		found=1;
		if(temp==*list)
		{
			*list=temp->link;
			free(temp);
		}
		else
		{
		 	back->link=temp->link;
		 	free(temp);
		}
	 }
	 back=temp;
	 temp=temp->link;
	}
	if(found==0)
	 	printf("\nValue not found\n");
 }
}
void count(struct node*list)
{
 int count=0;
 while(list!=NULL)
 {
	list=list->link;
	count++;
 }
 printf("\nThe number of nodes is:%d",count);
}
void display(struct node*list)
{
 while(list!=NULL)
 {
	printf("%d ",list->val);
	list=list->link;
 }
}
