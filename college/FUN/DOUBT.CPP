#include<iostream.h>
#include<conio.h>
void main()               //how to break both loops
{
 clrscr();
 int i,j,flag1=1,flag2=1,k=1;
 int a[3][3];
 for(i=0;i<3;++i)
 {
 for(j=0;j<3;++j)
 a[i][j]=k++;
 }

for( i=0;i<3;++i)

 {
	for( j=0;j<3;++j)
	{
	 if((a[i][j])==(a[j][i]))
	 flag1=1;
	 else
	 {
		flag1=0;
		break;
	 }
	}
 }
}