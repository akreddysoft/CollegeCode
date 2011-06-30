//ASSIGNMENT NO. 5
#include<graphics.h>
#include<math.h>
void main()
{
	int amp,fq;
	float y,i;
	int gdriver=DETECT,gmode;         //INITIATING GRAPHICS
	int j=0,cnt=0,t;
	float t1;
	initgraph(&gdriver,&gmode,"C:\\TCpp\\BGI");   //DRIVER
	line(50,10,50,550);
	line(50,130,500,130);
	line(50,260,500,260);
	line(50,390,500,390);

	for(i=50;i<500;i++)                   //PLOTTING SINE WAVE
	{
		y=50*sin(2*3.14*10*(i-50));
		putpixel(i,y+130,WHITE);
		delay(5);
	}
	t1=1000/(2*50);

	do
	{
		if(cnt==0)
		{
			line(j+50,210,j+t1+50,210);
			line(j+t1+50,210,j+t1+50,260);
			cnt=1;
			j+=t1;
		}
		if(cnt==1)
		{
			line(j+50,260,j+t1+50,260);
			line(j+t1+50,260,j+t1+50,210);
			j=j+t1;
			cnt=0;
		}
	} while(j<450);

	for(i=50;i<500;i+=20)
	{
		y=50*sin(2*3.14*10*(i-50));
		line(i,390+y,i+10,390+y);
		line(i+10,390+y,i+10,390);
		line(i,390+y,i,390);
	}
	getch();
}