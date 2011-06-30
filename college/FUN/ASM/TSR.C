#include<dos.h>
#include<stdlib.h>
void interrupt (*prev)();
void interrupt irst();
void main()
{
	prev=getvect(9);
	setvect(9,irst);
	keep(0,1000);
}

void interrupt irst()
{
 int i,j=0;
 char far *s;
 s=0xb8000000;
 randomize();
 while(j<4000)
 {
	for(i=1;i<4000;i=i+2)
		 *(s+i)=random(16);
 (*prev)();
 ++j;
 }
}
