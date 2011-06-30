/*PROGRAM FOR GENERATION OF PULSE AMPLITUDE MODULATION
 MADHUR AHUJA
 ROLL NO 22
*/
#include<graphics.h>
#include<stdio.h>
#include<math.h>
#include<conio.h>
void main (void)
{
 float a,f,y,i,fs,y1,ts;
 int g=DETECT,m,fl=0;
 printf("\nEnter the amplitude of the signal:");
 scanf("%f",&a);
 printf("\nEnter the frequency of the signal:");
 scanf("%f",&f);
 printf("\nEnter the frequency of the square wave:");
 scanf("%f",&fs);
 initgraph(&g,&m,"e:\\tc\\bgi");
 line(0,100,600,100);
 line(0,220,600,220);
 line(0,330,600,330);
 line(0,0,0,479);
 a=a*(-1);
 ts=1000.0/fs;
 for(i=0;i<600;i=i+0.5)
 {
  y=a*sin(2*3.14*f*i);
  putpixel(i,100-y,YELLOW);
  if((int(i)/int(ts))%2)
  {
   if(!fl)
   {
	setcolor(RED);
	line(i-0.5,210,i-0.5,230);
	setcolor(BLUE);
	line(i-0.5,330,i-0.5,330-y);
	fl=1;
	y1=y;
   }
   putpixel(i,210,RED);
   putpixel(i,330-y1,BLUE);
  }
  else
  {
   if(fl)
   {
	setcolor(RED);
	line(i-0.5,210,i-0.5,230);
	setcolor(BLUE);
	line(i-0.5,330,i-0.5,330-y1);
	fl=0;
   }
   putpixel(i,230,RED);
   putpixel(i,330,BLUE);
  }
 }
 closegraph();
 getch();
}