#include<iostream.h>
#include<graphics.h>
#include<conio.h>
#include<dos.h>
#define D delay(5);
#include<stdlib.h>
void main()
{
	int driver,mode,x,y;
	int i=50,k,j,n=13;
	randomize();
	n=random(n);
	cout<<n;
	driver=VGA;
	mode=VGAHI;
	registerbgidriver(EGAVGA_driver);
	initgraph(&driver,&mode,"");
	for(j=200;j>100;--j)
	{
	 putpixel(i,j,n);
	 D
	}
	while(j<150&&i)
	{
		putpixel(i,j,n);
		++j;
		++i; D
	}
	while(j>100)
	{
	 putpixel(i,j,n);
	 ++i;
	 --j;   D
	}
	while(j<200)
	{
	 putpixel(i,j,n);
	 ++j;    D
	}
	i=i+25;
	///cout<<i<<" "<<j; //i=j=200
	while(j>150)
	{
		putpixel(i,j,n);
		--j;   D
		i=i+1;
	}

	while(j<200)
	{
	 putpixel(i,j,n);
	 ++j;     D
	 ++i;
	}
	for(i=195;i<255;++i)
	{
	 putpixel(i,180,n);D
	}
	i=i+45;
	j=150;
	while(j<200)
	{
	 putpixel(i,j,n);D
	 ++j;
	}
	setcolor(getmaxcolor());
	arc(i,175,270,90,25);
	i=i+50;
	while(j>150)
	{
	 putpixel(i,j,n); D
	 --j;
	}
 j=175;
 i=350;
 while(i<380)
 {
	putpixel(i,j,n);
	++i;           D
 }
 j=150;
 while(j<200)
 {
	putpixel(i,j,n);
	++j;          D
 }
 i=i+25;
 j=150;
 while(j<185)
 {
	putpixel(i,j,n);
	++j;      D
 }
 i=i+15;
 arc(i,j,180,270,15);

 arc(i,j,270,0,15);
 i=i+15;
 while(j>150)
 {
	putpixel(i,j,n);
	--j;       D
 }
 i=i+25;
 while(j<200)
 {
	putpixel(i,j,n);
	++j;        D
 }
 arc(i,165,270,90,15);
 j=175;
 while(i<480)
 {
	putpixel(i,j+5,n);
	++i;         D
	++j;
 }
 getch();
 closegraph();
}

void d()
{
delay(10);
}