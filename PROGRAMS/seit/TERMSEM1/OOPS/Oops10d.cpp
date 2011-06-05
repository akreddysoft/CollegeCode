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
 cout<<"Enter the center coordinates:";
 cin>>x>>y;
}
void point::draw()
{
 putpixel(x,y,YELLOW);
}
class cercle:public point
{
 int rad;
 public:
 void read();
 void plot();
};
void cercle::read()
{
 point::read();
 cout<<"\nEnter the radius of circle:";
 cin>>rad;
}
void cercle::plot()
{
 circle(x,y,rad);
}
void main()
{
 int driver,mode;
 driver=DETECT;
 initgraph(&driver,&mode,"e:\\tc\\bgi");
 cercle c1;
 c1.read();
 c1.plot();
 getch();
 closegraph();
}