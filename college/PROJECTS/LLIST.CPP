#include<iostream.h>
#include<conio.h>
void append(struct node **,int);
void inafter(struct node *,int,int);
void inbefore(struct node**,int,int);
void inbeg(struct node **,int);
void deleted(struct node **,int);
void count(struct node*);
void display(struct node *);
struct node
{
 int val;
 node *link;
};
int size=sizeof(node);
void main()
{
	int i,j,k,choice,data,prevdata;
	char ch;
	node *first=NULL,*last;
	clrscr();
	cout<<"\n1 Append";
	cout<<"\n2 Insert after...";
	cout<<"\n3 Insert before...";
	cout<<"\n4 Insert beginning";
	cout<<"\n5 Delete";
	cout<<"\n6 Count";
	cout<<"\n0 Exit";
	do
	{
	 cout<<"\nEnter choice:";
	 cin>>choice;
	 switch(choice)
	 {
		case 1:
		cout<<"\nEnter the value to be appended:";
		cin>>data;
		append(&first,data);
		display(first);
		break;
		case 2:
		cout<<"\nEnter the value to be inserted";
		cin>>data;
		cout<<"\nEnter the value to be inserted after:";
		cin>>prevdata;
		inafter(first,data,prevdata);
		display(first);
		break;
		case 3:
		cout<<"\nEnter the value to be inserted";
		cin>>data;
		cout<<"\nEnter the value to be inserted before:";
		cin>>prevdata;
		inbefore(&first,data,prevdata);
		display(first);
		break;
		case 4:
		cout<<"Enter the value to be inserted in beginning";
		cin>>data;
		inbeg(&first,data);
		display(first);
		break;
		case 5:
		cout<<"\nEnter the value to be deleted:";
		cin>>data;
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
 node *temp,*x;
 temp=*list;
 if(temp==NULL)
 {
	cout<<"\nList was empty\n";
	temp=new node;
	temp->val=data;
	temp->link=NULL;
	*list=temp;
 }
 else
 {
	while(temp->link!=NULL)
		temp=temp->link;
	x=new node;
	x->val=data;
	x->link=NULL;
	temp->link=x;
 }
}
void inafter(node *list,int data,int prevdata)
{
 node *x;
 if(list==NULL)
	cout<<"List empty,not possible\n";
 else
	{
	 while(list!=NULL)
	 {
		 if(list->val==prevdata)
		 {
			x=new node;
			x->val=data;
			x->link=list->link;
			list->link=x;
			break;
		}
		list=list->link;
	 }
	if(list==NULL)
	 cout<<"\nValue not found\n";
 }
}
//in this func list is passed by address, there is possibility of change of
//pointer first i.e. when we insert the node before the first node.
//otherwise there is no need to send the first by address
void inbefore(node **list,int data,int prevdata)
{
	node *x,*temp,*back;
	int found=0;
	temp=*list;
	if(*list==NULL)
	 cout<<"\nList empty,not possible";
	else
	{
	 while(temp!=NULL)
	 {
		if(temp->val==prevdata)
		{
		 found=1;
		 if(*list==temp)
		 {
			x=new node;
			x->val=data;
			x->link=*list;
			*list=x;
		 }
		 else
		 {
			x=new node;
			x->val=data;
			x->link=temp;
			back->link=x;
		 }
		}
		back=temp;
		temp=temp->link;
	 }
	 if(found==0)
		 cout<<"\nValue not found\n";
	}
}
void inbeg(node **list,int data)
{
 node *x;
 if(*list!=NULL)
 {
	x=new node;
	x->val=data;
	x->link=*list;
	*list=x;
 }
 else
	cout<<"\nList empty,not possible\n";
}
void deleted(node **list,int data)
{
 node *temp,*back;
 int found=0;
 temp=*list;
 if(*list==NULL)
	cout<<"\nList empty,not possible";
 else
 {
	while(temp!=NULL)
	{
	 if(temp->val==data)
	 {
		found=1;
		if(temp==list)
		{
			*list=temp->link;
			delete temp;
		}
		else
		{
		 back->link=temp->link;
		 delete temp;
		}
	 }
	 back=temp;
	 temp=temp->link;
	}
	if(found==0)
	 cout<<"\nValue not found\n";
 }
}
void count(node*list)
{
 int count=0;
 while(list!=NULL)
 {
	list=list->link;
	count++;
 }
 cout<<"\nThe number of nodes is:"<<count;
}
void display(node*list)
{
 while(list!=NULL)
 {
	cout<<list->val<<"  ";
	list=list->link;
 }
}
