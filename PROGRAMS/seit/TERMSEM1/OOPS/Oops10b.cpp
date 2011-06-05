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
 private:
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

void main()
{
 int driver,mode;
 driver=DETECT;
 initgraph(&driver,&mode,"e:\\TC\\BGI");
 lin l1;
 l1.read();
 l1.draw();
 getch();
 closegraph();
}
