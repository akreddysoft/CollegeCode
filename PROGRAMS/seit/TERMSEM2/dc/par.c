#include<iostream.h>
#include<conio.h>
void main()
{
	clrscr();
	int a[10],n,i,count=0;
	cout<<"Enter the length of message...";
	cin>>n;
	cout<<"Enter the message in binary code...";
	for(i=0;i<n;i++)
	{
		cin>>a[i];
		if(a[i]==1)
			count++;
	}
	if(count%2==0)
		cout<<"Even Parity";
	else
		cout<<"Odd Parity";
	getch();
}
