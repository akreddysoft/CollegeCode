#include<stdlib.h>
#include<time.h>
void main()
{
 char far *s;
 int i;
 s=0xB0008000;
 while(1)
 {
	for(i=0;i<4000;i=i+2)
	{
	 if(*(s+i)>='a'&&*(s+i)<='z')
		*(s+i)=*(s+i)-32;
	 else
	 {
		if(*(s+i)>='A'&&*(s+i)<='Z')
		*(s+i)=*(s+i)+32;

	 }
	}
 }
}