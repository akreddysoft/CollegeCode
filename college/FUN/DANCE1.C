#include<stdlib.h>
#include<time.h>
void main()
{
 char far *s;
 int i,n,j;
 s=0xb8000000;
 randomize();
 while(j<3000)
 {
	for(i=1;i<4000;i=i+2)
	 {
		*(s+i)=random(16);

	 }
	++j;
 }
}