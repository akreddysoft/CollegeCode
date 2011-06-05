#include<math.h>
void main()
{
 float r1,r2;
 int a,b,c;
 float rd,d;
 clrscr();
 printf("Enter a b c:\n");
 scanf("%d %d %d",&a,&b,&c);
 d=b*b-4*a*c;
 if(d>=0)
 {
	rd=sqrt(b*b-4*a*c);
	r1=(-b+rd)/(2*a);
	r2=(-b-rd)/(2*a);
	printf("\nThe roots are:%.1f %.1f",r1,r2);
 }
 else
 printf("Imaginary roots");
 getch();
}