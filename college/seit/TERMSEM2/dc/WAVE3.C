
// PROGRAM FOR PULSE MODULATION
// MADHUR AHUJA
#include<graphics.h>
void main()
{
 const l1=80,l2=240,l3=360;
 const linecolor=YELLOW,barcolor=LIGHTCYAN;
 int gd = DETECT,gm;
 float w,f,t,a,y,interval=20,width=10;
 int i,x1=0;
 printf("\nEnter the frequency:");
 scanf("%f",&f);
 printf("\nEnter the amplitude:");
 scanf("%f",&a);
 printf("\nEnter the sampling interval:");
 scanf("%f",&interval);
// printf("\nEnter the width:");
// scanf("%f",&width);
 w=2*3.14*f;
 t=0.1;
 initgraph(&gd,&gm,"e:\\tc\\bgi");
 line(0,l1,639,l1);    //x axis
 line(0,l2,639,l2);
 line(0,l3,639,l3);
 line(0,0,0,479);         //y axis
 for(i=0;i<640;++i)
 {
  y=a*sin(w*t);
  putpixel(i,l1+y,YELLOW);
  setcolor(barcolor);
  rectangle(x1,l2,x1+width,l2-a);
//  line(x1,l2,x1,l2-a);

  putpixel(i,l3+y,YELLOW);
  if(x1==i)
  {
	  setcolor(barcolor);
	  rectangle(x1,l3,x1+width,l3+y);
//	  line(x1,l3,x1,l3+y);
	  x1=x1+interval;
  }
  t=t+.1;
  delay(5);
 }
 getch();
 closegraph();
}
