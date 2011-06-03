#include<time.h>
#include<stdlib.h>
void main()
{
 char far *s;
 int row,col;
 char ch;
 char far *v;
 s=0xb0008000;
	row=random(24);
	col=random(79);
	for(row;row<24;row++)
	{
		 v=row*160+col*2+s;
		 ch=*v;
		 *(v-160)=ch;
		 delay(100);
		 *v=' ';
		}
}