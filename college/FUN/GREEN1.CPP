//#include<fstream.h>
#include<conio.h>
#include<dos.h>
#include<graphics.h>
//#include<stdio.h>
#define cx getmaxx()
#define cy getmaxy()
//#define keyh o.h.ah
class rect
{
	public:
	int x,y,x1,y1,key;
	rect()
	{
	 int driver=DETECT,mode;
	 initgraph(&driver,&mode,"e:\\tc\\bgi");
	 x=getmaxx();
	 y=getmaxy();
	}
	void init();
	void draw();
	void moves();
	void movel();
	void mover();
	void moved();
	void clear();
	void outline();
	int getkey();
};
void rect::init()
{
	x=x/2;x1=x+5;y1=y-79;y=y-3;
}
void rect::draw()
{
	setlinestyle(SOLID_LINE,1,1);
	setcolor(GREEN);
	setfillstyle(1,GREEN);
	rectangle(x,y,x1,y1);
}
void rect::moves()
{
 if(y1>2)   //  2
 {
	delay(10);
	draw();
//	clear();
	--y;
	--y1;
 }
}
void rect::movel()
{
 y=y1-5;
 if(x>2)   //2
 {
	delay(10);
	draw();
	clear();
	--x;
	--x1;
 }
}
void rect::moved()
{
	y++;
	if(y1<cy-2)   //cy-2
	{
	 delay(10);
	 draw();
	 //clear();
	 ++y;
	 ++y1;
	}
}
void rect::mover()
{
 if(x1<cx-2)     //cx-2
 {
	delay(10);
	draw();
//  clear();
	++x1;
	++x;
 }
}
void rect::clear()
{
 setcolor(BLACK);
 line(x,y,x1,y);
}
void rect::outline()
{
 setcolor(YELLOW);
 setlinestyle(SOLID_LINE,5,3);
 rectangle(1,y-1,x-1,1);
}
int rect::getkey()
{
 union REGS i,o;
 i.h.ah=0;
 int86(0x16,&i,&o);
 return o.h.ah;
}
void main()
{
 int key;
 rect r1;
 r1.outline();
 r1.init();
 r1.draw();
 floodfill(r1.x+1,r1.y-1,GREEN);
// getch();
 r1.moves();
 while(!kbhit())
 {
	union REGS i,o;
	i.h.ah=0;
	int86(0x16,&i,&o);
	if(o.h.ah==75)
	{
	 while(!kbhit())
	 r1.movel();
	}
	if(o.h.ah==77)
	{
	 while(!kbhit())
	 r1.mover();
	}
	if(o.h.ah==80)
	{
	 while(!kbhit())
	 r1.moved();
	}
	if(o.h.ah==72)
	{
	 while(!kbhit())
	 r1.moves();
	}
 }
 closegraph();
}