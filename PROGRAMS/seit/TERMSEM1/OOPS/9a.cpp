//////////ASSIGNMENT 9(B)///////////
#include<iostream.h>
#include<conio.h>
class node
{
	public:
		int data;
		node *next;
};
void main()
{
 clrscr();
 node *ptr,*x,*list,*back;
 int i,n,found,data;
 cout<<"Enter the size of list to be created:\n";
 cin>>n;
 list=new node;
 cout<<"\nEnter value:";
 cin>>list->data;
 list->next=NULL;
 ptr=list;
 for(i=1;i<n;++i)
 {
	x=new node;
	cout<<"\nEnter value:";
	cin>>x->data;
	x->next=NULL;
	ptr->next=x;
	ptr=x;
 }
 cout<<"\nEnter the value to be deleted:";
 cin>>data;
 if(list->data==data)
 {
	ptr=list;
	list=list->next;
	delete ptr;
 }
 else
 {
	ptr=list->next;
	back=list;
	while(ptr!=NULL)
	{
	 if(ptr->data==data)
	 {
		back->next=ptr->next;
		delete ptr;
		break;
	 }
	 back=ptr;
	 ptr=ptr->next;
	}
 }
 cout<<"\nthe list after deletion is:";
 ptr=list;
 while(ptr!=NULL)
 {
	cout<<ptr->data<<"  ";
	ptr=ptr->next;
 }

 getch();
}

/*OUTPUT
Enter the size of list to be created:
5
Enter value:1
Enter value:2
Enter value:3
Enter value:4
Enter value:5
Enter the value to be deleted:2
the list after deletion is:1  3  4  5
*/






                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                

