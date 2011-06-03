#include<e:\school\seit\fun\bootcpp\class.h>
#include<process.h>
void main()
{
	count c2;
	int choice,size=sizeof(count);
	clrscr();
	cout<<"\n1 Settings";
	cout<<"\n2 Clear the counter";
	cout<<"\n0 Exit";
	cout<<"\nEnter choice:";
	cin>>choice;
	switch(choice)
	{
	 case 2:
	 ofstream myfile("c:\\counter.dat");
	 if(!myfile)
		cout<<"\nFatal error";
	 c2.clear();
	 myfile.write((char*)&c2,size);
	 myfile.close();
	 cout<<"\nCounter successfully reset to zero";
	 break;
	 case 0:
	 exit(0);
}
getch();
}