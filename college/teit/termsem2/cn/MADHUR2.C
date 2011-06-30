//PROGRAM FOR STOP AND WAIT
#include<graphics.h>
#include<stdlib.h>
#define GAP 20
#define TIME 5
#define COLOR YELLOW
#define COLORA RED
#define TIMEOUT 10
#define INITY TOPGAP+TOPGAP
#define LEFTGAP 10
#define TOPGAP 10
#define RECTWIDTH 100
#define RECTHEIGHT Y-Y*.166
int count=0,X,Y;
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
	X=getmaxx();
	Y=getmaxy();
	X++;
	Y++;

	rectangle(LEFTGAP,TOPGAP,RECTWIDTH,RECTHEIGHT);
	rectangle(X-RECTWIDTH-LEFTGAP,TOPGAP,X-LEFTGAP,RECTHEIGHT);
	outtextxy(2*LEFTGAP,RECTHEIGHT/2,"Sender");
	outtextxy(X-RECTWIDTH+LEFTGAP,RECTHEIGHT/2,"Receiver");
	count=INITY;
	while(count<RECTHEIGHT-GAP)
	{
		outtextxy(RECTWIDTH-LEFTGAP,count,frame);
		drawline(RECTWIDTH,X-RECTWIDTH-LEFTGAP,1);
		framenum=atoi(frame);
		count=count+GAP;
/////////////////////
		retval=wait(30,count);
		switch(retval)
		{
			case 1:    //ACKNOWLEDGEMENT RECEIVED
			framenum++;
			itoa(framenum,frame,10);
			drawline(X-RECTWIDTH-LEFTGAP,RECTWIDTH,0);
			count=count+GAP;
			break;

			case 0:
			//resend the frame
			outtextxy(30,count,"Timeout");
			outtextxy(RECTWIDTH-LEFTGAP,count,frame);
			drawline(RECTWIDTH,X-RECTWIDTH-LEFTGAP,1);
			break;

			case 2:
			outtextxy(30,count,"Damped");
			outtextxy(RECTWIDTH-LEFTGAP,count,frame);
			drawline(RECTWIDTH,X-RECTWIDTH-LEFTGAP,1);
			break;
		}
	}

	getch();
	closegraph();
	return 0;
}


wait()
{
	int i=TIMEOUT,j;
	randomize();
	while(i!=0)   //wait timout no of times for .1 sec
	{
		delay(100);
		j=random(10);
		if(j==9)
			return 1;
		if(j==9)
			return 2;
		i--;
	}
	return 0;
}

drawline(int x,int y,int j)
{
		int i;
		int rnd;
 //		int damp=1,dampflag=0;
		if(j)
		{
		for(i=x;i<=y;i++)
		{
			putpixel(i,count,COLOR);
			if(i==X/2)
			{
				setcolor(YELLOW);
				outtextxy(X/2,count-3,">");
				setcolor(WHITE);
			}
/*			rnd=random(1000);
			if(rnd==1||dampflag)
			{   		//DAMP THE SIGNAL
				dampflag=1;
//				damp=damp+5;
				i=i+5;
				delay(TIME);
			}*/


			delay(TIME);
		}
}
else
{
			for(i=x;i>=y;--i)
			{
				putpixel(i,count,COLORA);
				if(i==X/2)
				{
					setcolor(COLORA);
					outtextxy(X/2,count-3,"<");
					setcolor(WHITE);
				}
				delay(TIME);
			}
		 }
return 0;
}