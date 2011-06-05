#include<iostream.h>
#include<conio.h>
#include<graphics.h>
#include<process.h>
class point
{
 int x;
 int y;
 public:
 void read();
 void draw();
};
void point::read()
{
 cout<<"Enter the value of x,y:";
 cin>>x>>y;
}
void point::draw()
{
 putpixel(x,y,YELLOW);
}
struct node
{
		point data;
		node *next;
};
class stack
{
	private:
		node *first;
		int count;
	public:
		stack()
		{
		 first=NULL;
		}
	void push(point d);
	void pop();
	void display();
};
void stack::push(point d)
{
 node *newnode=new node;
 newnode->data=d;
 newnode->next=first;
 first=newnode;
}
void stack::display()
{
 cleardevice();
 count=220;
 node* current=first;
 while(current!=NULL )
	{
	 current=current->next;
	 putpixel(count,240,YELLOW);
	 count=count+50;
	}
}
void stack::pop()
{
	node* current=first;
	if(current!=NULL)
	{
	 current=first;
	 first=first->next;
	 delete current;
	}
	else
	cout<<"\nSTACK EMPTY\n";
}
void main()
{
 clrscr();
 int choice;
 stack s1;
 point d;
 int driver=DETECT,mode;
 initgraph(&driver,&mode,"e:\\tc\\bgi");
 cout<<"\n1 Push";
 cout<<"\n2 Pop";
 cout<<"\n3 Display";
 cout<<"\n0 Exit";
 while(1)
 {
	cout<<"\nEnter choice:";
	cin>>choice;
	switch(choice)
	{
	 case 1:
	 s1.push(d);
	 break;
	 case 2:
	 s1.pop();
	 break;
	 case 3:
	 s1.display();
	 break;
	 case 0:
	 exit(0);
	}
 }
 closegraph();
}

