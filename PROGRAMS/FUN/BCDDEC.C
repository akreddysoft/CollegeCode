#include<math.h>
bina(long,int);
void main()
{
 long bcd;
 int decimal;
 clrscr();
 printf("Enter the bcd:");
 scanf("%ld",&bcd);
 decimal=bina(bcd,decimal);
 if(decimal!=999)
 printf("\nThe decimal is:%d",decimal);
 getch();
}
bina(long bcd,int decimal)
{
 long bcd1;
 int i=0,j=0,c=0,rem[8],k=0;
 static int dec[4];
 bcd1=bcd;
 while(bcd1!=0)
 {
	bcd1=bcd1/10;
	++c;
 }
 while(k<c)
	{
	 if(i==4)
	 {
		++j;
		i=0;
	 }
	 rem[k]=bcd%10;
	 k++;
	 bcd=bcd/10;
	 dec[j]=dec[j]+rem[i]*pow(2,i);
	 ++i;
	}
	if(dec[0]>9||dec[1]>9)
	{
	 printf("\nInvalid Bcd");
	 return 999;
	}
	else
	{
	 decimal=dec[0];
	 decimal=decimal+dec[1]*10;
	 printf("\n%d %d",dec[0],dec[1]);
	 return decimal;
	}
}