#include<conio.h>
#include<graphics.h>
#include<iostream.h>
class point
{
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
void main()
{
 int driver,mode;
 driver=DETECT;
 initgraph(&driver,&mode,"e:\\tc\\bgi");
 point p1;
 p1.read();
 p1.draw();
 getch();
 closegraph();
}