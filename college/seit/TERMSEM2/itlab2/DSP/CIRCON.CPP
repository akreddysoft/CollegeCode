/* ASSIGNMENT NO 2  */
/* PROGRAM FOR CIRCULAR CONVOLUTION   */

#include<iostream.h>
#include<conio.h>
#include<graphics.h>
#include<process.h>
#include<stdlib.h>
#include<math.h>

class SEQUENCE
{
  char id;
  float *array;
  public:
    int samples;
    int radius;
    SEQUENCE()
      {
	samples=1;
	id=' ';
	radius=100;
	array=new float;
      }
    SEQUENCE(int n,int rad,char i)
      {
	samples=n;
	id=i;
	radius=rad;
	array=new float[n];
      }
    ~SEQUENCE()
      {
	delete [] array;
      }
    void additem(int index,float value)
      {
	array[index]=value;
      }
    float getitem(int index)
      {
	return(array[index]);
      }
    void draw()
      {
	char* a;
	int i;
	float theta;
	cleardevice();
	setcolor(BLUE);
	settextjustify(CENTER_TEXT,CENTER_TEXT);
	line(0,getmaxy()/2,getmaxx(),getmaxy()/2);
	line(getmaxx()/2,0,getmaxx()/2,getmaxy());
	circle(getmaxx()/2,getmaxy()/2,100);
	setcolor(YELLOW);
	for(theta=0,i=0;theta<6.28318;theta+=6.28318/samples,i++)
	  {
	    line(getmaxx()/2+(radius-5)*cos(theta),getmaxy()/2-(radius-5)*sin(theta),getmaxx()/2+(radius+5)*cos(theta),getmaxy()/2-(radius+5)*sin(theta));
	    itoa(array[i],a,10);
	    outtextxy(getmaxx()/2+(radius+25)*cos(theta),getmaxy()/2-(radius+25)*sin(theta),a);
	  }
	setcolor(WHITE);
      }
};

void main()
{
  void initgrfx();
  void exitgrfx();
  int ch,points=0;
  SEQUENCE xn(10,100,'x');
  SEQUENCE hn(10,100,'h');
  while(1)
    {
      clrscr();
      cout << "PROGRAM TO IMPLEMENT CIRCULAR CONVOLUTION";
      cout << "\nอออออออออออออออออออออออออออออออออออออออออ";
      cout << "\n\n MAIN MENU :\n";
      cout << "\n1. ENTER SEQUENCES x(n) & h(n).";
      cout << "\n2. CIRCULARLY CONVOLE x(n) & h(n).";
      cout << "\n3. EXIT.";
      cout << "\n\nENTER YOUR CHOICE : ";
      cin >> ch;
      switch(ch)
	{
	  case 1:
	    {
	      clrscr();
	      int s,i;
	      float val;
	      cout << "ENTER SEQUENCE x(n)";
	      cout << "\nอออออออออออออออออออ";
	      cout << "\n\nENTER THE NUMBER OF SAMPLES FOR x(n) : ";
	      cin >> s;
	      xn.samples=s;
	      hn.samples=s;
	      points=s;
	      for(i=0;i<s;i++)
		{
		  cout << "ENTER x[" << i << "] : ";
		  cin >> val;
		  xn.additem(i,val);
		}
	      initgrfx();
	      xn.draw();
	      settextjustify(CENTER_TEXT,CENTER_TEXT);
	      settextstyle(7,0,3);
	      outtextxy(getmaxx()/2+20,getmaxy()/2-10,"x(n)");
	      getch();
	      exitgrfx();
	      clrscr();
	      cout << "ENTER SEQUENCE h(n)";
	      cout << "\nอออออออออออออออออออ\n\n";
	      for(i=0;i<s;i++)
		{
		  cout << "ENTER h[" << i << "] : ";
		  cin >> val;
		  hn.additem(i,val);
		}
	      initgrfx();
	      hn.draw();
	      settextjustify(CENTER_TEXT,CENTER_TEXT);
	      settextstyle(7,0,3);
	      outtextxy(getmaxx()/2+20,getmaxy()/2-10,"h(n)");
	      getch();
	      exitgrfx();
	      break;
	    }
	  case 2:
	    {
	      int i,j,k,sum;
	      SEQUENCE yn(points,100,'y');
	      for(i=0;i<points;i++)
		{
		  sum=0;
		  for(j=i,k=0;k<points;j--,k++)
		    {
		      if(j<0)
			j=points-1;
		      sum+=xn.getitem(k)*hn.getitem(j);
		    }
		  yn.additem(i,sum);
		}
	      initgrfx();
	      settextjustify(CENTER_TEXT,CENTER_TEXT);
	      yn.draw();
	      outtextxy(getmaxx()/2+20,getmaxy()/2-10,"y(n)");
	      getch();
	      exitgrfx();
	      break;
	    }
	  case 3:
	    exit(0);
	}
   }
}

void initgrfx()
{
  int gd=DETECT,gm;
  initgraph(&gd,&gm,"e:\\langua~1\\turboc~1\\bgi");
}

void exitgrfx()
{
  closegraph();
  restorecrtmode();
}