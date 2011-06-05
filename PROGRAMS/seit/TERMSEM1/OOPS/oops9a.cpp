//////////////////ASSIGNMENT NO 9a//////////////
#include<iostream.h>
#include<conio.h>
#include<process.h>
class node
{
	public:
		int data;
		node *next;
};
class stack
{
		node *top;      //containership
	public:
		stack()
		{
		 top=NULL;
		}
	void push(int d);
	void pop();
	void display();
};
void stack::push(int d)
{
	node *newnode=new node;
	newnode->data=d;
	newnode->next=top;
	top=newnode;
}
void stack::display()
{
	node* current=top;
	while(current!=NULL )
	{
	 cout<<current->data<<"   ";
	 current=current->next;
	}
}
void stack::pop()
{
	node *current=top;
	if(current!=NULL)
	{
	 current=top;
	 top=top->next;
	 delete current;
	}
	else
	cout<<"\nSTACK EMPTY\n";
}
void main()
{
 clrscr();
 int choice,n;
 stack s1;
 cout<<"\n1 Push";
 cout<<"\n2 Pop";
 cout<<"\n0 Exit";
 while(1)
 {
 cout<<"\nEnter choice:";
 cin>>choice;
 switch(choice)
 {
	case 1:
	cout<<"\nEnter the value to be pushed:";
	cin>>n;
	s1.push(n);
	s1.display();
	break;
	case 2:
	s1.pop();
	s1.display();
	break;
	case 0:
	exit(0);
 }
 }
}
