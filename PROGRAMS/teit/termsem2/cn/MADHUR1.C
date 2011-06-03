//PROGRAM FOR SLIDING WINDOW PROTOCOL
#include<graphics.h>
#include<stdlib.h>
#define X1 400
#define GAP 20
#define X2 530
#define TIME 5
#define COLOR YELLOW
#define COLORA RED
#define TIMEOUT 10
#define INITY 20
int count=0;
int main()
{
	int i,j,k,framenum=0;
	int gd=DETECT,gm,retval;
	char *frame="1";
	initgraph(&gd,&gm,"f:\\tc\\bgi");
	i=graphresult();
	if(i!=0)
	{
		printf("\nGraphics Error\n");
		exit(1);
	}

	rectangle(10,10,100,420);
	rectangle(530,10,630,420);
//	outtextxy(530,200,"Receiver");
	count=INITY;
	while(count<400)
	{
		outtextxy(100-10,count,frame);
		drawline(100,530,1);
		framenum=atoi(frame);
		count=count+GAP;
/////////////////////
		retval=wait(30,count);
		if(retval==1)
		{
			framenum++;
			itoa(framenum,frame,10);
			drawline(530,100,0);
			count=count+GAP;
		}
		else
		{
			//resend the frame
			outtextxy(100-10,count,frame);
			drawline(100,530,1);
		}
	}

	getch();
	closegraph();
	return 0;
}


wait(int x,int y)
{
	int i=TIMEOUT,j;
//	char *count;
//	count=malloc(3);
//	count[2]=0;
	randomize();
	while(i!=0)
	{
		delay(100);
		j=random(10);
		if(j==9)
			return 1;
		i--;
	}
	outtextxy(x,y,"Timeout");
	return 0;
}

drawline(int x,int y,int j)
{
		int i;
		if(j)
		{
		outtextxy(10,200,"Sender");
		outtextxy(530,200,"      ");

		for(i=x;i<=y;++i)
		{
			putpixel(i,count,COLOR);
			if(i==320)
			{
				setcolor(YELLOW);
				outtextxy(320,count-3,">");
				setcolor(WHITE);
			}

			delay(TIME);
		}
//		outtextxy(530,200,"      ");
}
else
{
			outtextxy(530,200,"Sender");
			outtextxy(10,200,"      ");

			for(i=x;i>=y;--i)
			{
				if(i<530&&i>430)
					putpixel(i,count,COLORA);
				else
					putpixel(i,count,COLOR);

				if(i==320)
				{
					setcolor(COLORA);
					outtextxy(320,count-3,"<");
					setcolor(WHITE);
				}
				delay(TIME);
			}
		 }
//		outtextxy(10,200,"      ");

return 0;
}