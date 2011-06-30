
		/* PROGRAM ON CIRCULAR CONVOLUTION */
#include<stdio.h>
#include<iostream.h>
#include<conio.h>

main()
{
	int x1[10],x2[10],x3[10],n1,n2,i,j,m,s;
	clrscr();

	for(i=0;i<10;i++)
	x1[i]=x2[i]=0;

	cout<<"\n\t Enter the number of elements in the sample space:\t";
	cin>>n1>>n2;

	cout<<"\n\t Enter the first sample space:\n";
	for(i=0;i<n1;i++)
	cin>>x1[i];

	cout<<"\n\t Enter the second sample space:\n";
	for(i=0;i<n2;i++)
	cin>>x2[i];

	if(n1>n2)
	n2=n1;
	else
	n1=n2;

	m=0;
	for(i=n2-1;i>=0;i--)
	{
	x3[m]=x2[i];
	m++;
	}

	for(i=0;i<n2;i++)
	x2[i]=x3[i];

	int sum=0;
	for(i=0;i<n2;i++)
	sum+=x1[i]*x2[i];
	x3[0]=sum;

	m=1;
	for(i=0;i<n2;i++)
	{
	sum=0;
	s=x2[n2-1];

	for(j=n2-2;j>=0;j--)
	x2[j+1]=x2[j];
	x2[0]=s;

	for(j=0;j<n2;j++)
	sum+=x1[j]*x2[j];
	x3[m]=sum;
	m++;
	}

	cout<<"\n\t The resultant sequence of circular convolution is:\n";
	for(i=0;i<n2;i++)
	cout<<"\t"<<x3[i];

	getch();
}







