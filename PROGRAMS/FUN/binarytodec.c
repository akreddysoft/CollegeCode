#include<math.h>
long bina(long);
void main()
{
 long bin,bin1,dec;
 int rem[8];
 clrscr();
 printf("Enter the bcd:");
 scanf("%ld",&bin);
 dec=bina(bin);
 printf("\nThe decimal is:%ld",dec);
 getch();
}
long bina(long bin)
{
 long bin1,dec=0;
 int i=0,c=0,rem[8];
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