#include<graphics.h>
void main()
{
 int i,j=1,k=1,gd=DETECT,gm;
 initgraph(&gd,&gm,"e:\\tc\\bgi");
// clrscr();
 for(i=0;i<253;)
 {
	++i;
	printf("%d    %c        ",i,i);
	++i;
	printf("%d    %c        ",i,i);
	++i;
	printf("%d    %c        ",i,i);
	++i;
	printf("%d    %c        ",i,i);
	++i;
	printf("%d    %c\n\r\n\r",i,i);
	j++;
	if(j==12)
	{
	 printf("Page no %d.Press key to Continue",k++);
	 getch();
	 clrscr();
	 j=1;
	}
 }
 getch();
}


