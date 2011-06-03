#include<conio.h>
#include<math.h>
/*long decbin(int);
int bina(long);
void main()
{
 clrscr();
 char ch;
 int as;
 char dec;
 long bin;
 cout<<"Enter the text:";
 cin>>ch;
 as=ch;
 decbin(as);
 cout<<"\nEnter the binary:";
 cin>>bin;
 dec=bina(bin);
 cout<<dec;
 getch();
}*/
long decbin(int dec)
{
	long bin[20],binary=0;
	int i=0,j=0;
	while(dec!=0)
	{
	 bin[i]=dec%2;
	 dec=dec/2;
	 i++;
	}
	for(j=0;j<i;++j)
	 binary=binary+bin[j]*pow(10,j);
	return binary;
}
int bina(long bin)
{
 long bin1;
 int i=0,c=0,rem[8],dec=0;
 bin1=bin;
 while(bin1!=0)
 {
	bin1=bin1/10;
	++c;
 }
 while(i<c)
	{
	 rem[i]=bin%10;
	 bin=bin/10;
	 dec=dec+rem[i]*pow(2,i);
	 ++i;
	}
 return dec;
}