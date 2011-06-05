#include<conio.h>
#include<graphics.h>
#include<iostream.h>
class point
{
 protected:
 int x;
 int y;
 public:
 void read();
 void draw();
};
void point::read()
{
 cout<<"Enter the value of x,y:";
 cin>>x>>y;
}
void point::draw()
{
 putpixel(x,y,YELLOW);
}
class lin:public point
{
 protected:
 int x1,y1;
 public:
 void read();
 void draw();
};
void lin::read()
{
 point::read();
 cout<<"Enter the value of x1,y1:";
 cin>>x1>>y1;
}
void lin::draw()
{
 line(x,y,x1,y1);
}
class triangle:public lin
{
 private:
 int x2,y2;
 public:
 void read();
 void sketch();
};
void triangle::read()
{
 lin::read();
 cout<<"Enter the value of x2,y2:";
 cin>>x2>>y2;
}
void triangle::sketch()
{
	int poly[8];
	poly[0] = x;
	poly[1] = y;

	poly[2] = x1;
	poly[3] = y1;

	poly[4] = x2;
	poly[5] = y2;

	poly[6] = poly[0];
	poly[7] = poly[1];
	drawpoly(4,poly);
}
void main()
{
 int driver,mode;
 driver=DETECT;
 initgraph(&driver,&mode,"e:\\TC\\BGI");
 triangle t1;
 t1.read();
 t1.sketch();
 getch();
 closegraph();
}