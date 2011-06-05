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
class list
{
 struct node
 {
	point data;
	node *next;
 };
 node *first;
 public:
 list()
 {
	first=NULL;
 }
 void addpoint(point);
 void display();
 void delet(int);
};
void list::addpoint(point x)
{
	node *newlink=new node;
	newlink->data=x;
	newlink->next=first;
	first=newlink;
}
void list::display()
{
	cleardevice();
	int count=220;
	node* current=first;
	cout<<"The output is:";
	while(current!=NULL)
	 {
		putpixel(count,240,YELLOW);
		count=count+50;
		cout<<endl;
		current=current->next;
	 }
}
void list::delet(int loc)
{
 node *back,*temp=first;
 for(int i=0;i<loc;++i)
 {
	back=temp;
	temp=temp->next;
 }
 back->next=temp->next;
 delete temp;
}
void main()
{
 int driver,mode;
 driver=DETECT;
 initgraph(&driver,&mode,"e:\\tc\\bgi");
 int data,choice;
 point x1,x2,x3;
 list s1;
 cout<<"\n1 Add";
 cout<<"\n2 Delete";
 cout<<"\n3 Display";
 cout<<"\n0 Exit";
 while(1)
 {
	cout<<"\nEnter choice:";
	cin>>choice;
	switch(choice)
	{
	 case 1:
	 s1.addpoint(x1);
	 break;
	 case 2:
	 cout<<"\nEnter the location:";
	 cin>>data;
	 s1.delet(data);
	 break;
	 case 3:
	 s1.display();
	 break;
	 case 0:
	 exit(0);
	}
 }
 getche();
 closegraph();
}




