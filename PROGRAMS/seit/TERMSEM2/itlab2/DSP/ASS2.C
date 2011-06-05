/********************************
 PROGRAM FOR LINEAR CONVOLUTION
 NAME : MADHUR AHUJA
 ROLL : 22
*********************************/
#include<graphics.h>
void init();
const int SCALEY=50,SCALEX=30;
void main()
{
 int x[20],h[20],y[20],i,j,k,n,n1,n2,z1,z2,nxh,nyl,nhh,nxl,nhl,nyh,n3;
 int gd=DETECT,gm;
 clrscr();
 for(i=0;i<20;++i)
   x[i]=h[i]=y[i]=0;
 printf("\nEnter the number of elements for x[n]:");
 scanf("%d",&n1);
 printf("\nEnter the elements for x[n]:");
 for(i=0;i<n1;++i)
  scanf("%d",&x[i]);
 printf("Enter the position of first sample starting from zero:");
  scanf("%d",&z1);
 printf("\nEnter the number of elements for h[n]:");
 scanf("%d",&n2);
  printf("\nEnter the elements for h[n]:");
 for(i=0;i<n2;++i)
  scanf("%d",&h[i]);
 printf("Enter the position of first sample starting from zero:");
 scanf("%d",&z2);
 nxh=n1-1-z1;
 nhh=n2-1-z2;
 nxl=-z1;
 nhl=-z2;
 nyl=nxl+nhl;
 nyh=nxh+nhh;
 i=0;
 for(n=nyl;n<=nyh;++n)
 {
  for(k=nxl;k<=nxh;++k)
   y[i]=y[i]+x[z1+k]*h[n-k+z2];
  ++i;
 }
 printf("\nThe y[n] is:");
 printf("{ ");
 n3=i;
 for(j=0;j<n3;++j)
      printf("%d,",y[j]);
 printf("\b");
 printf(" }");
 getch();
 initgraph(&gd,&gm,"e:\\tc\\bgi");
 init();
 setcolor(YELLOW);
 j=350;
 for(i=0;i<n3;++i)
 {
	 setcolor(YELLOW);
	 line(j,240,j,240-y[i]*SCALEY);
	 j=j+SCALEX;
  }
  getch();
  closegraph();
}

void init()
{
  cleardevice();
  setcolor(LIGHTRED);
  line(320,0,320,450);  //yt axis
  line(10,240,600,240); // x axis
  setcolor(WHITE);
  outtextxy(280,450,"Sequence y[n]");
  setcolor(YELLOW);
  outtextxy(110,250,"-7");
  outtextxy(110+SCALEX,250,"-6");
  outtextxy(110+2*SCALEX,250,"-5");
  outtextxy(110+3*SCALEX,250,"-4");
  outtextxy(110+4*SCALEX,250,"-3");
  outtextxy(110+5*SCALEX,250,"-2");
  outtextxy(110+6*SCALEX,250,"-1");
  outtextxy(110+7*SCALEX,250,"0");
  outtextxy(110+8*SCALEX,250,"1");
  outtextxy(110+9*SCALEX,250,"2");
  outtextxy(110+10*SCALEX,250,"3");
  outtextxy(110+11*SCALEX,250,"4");
  outtextxy(110+12*SCALEX,250,"5");
  outtextxy(110+13*SCALEX,250,"6");
  outtextxy(310,240-SCALEY,"1");
  outtextxy(310,240-2*SCALEY,"2");
  outtextxy(310,240-3*SCALEY,"3");
  outtextxy(310,240-4*SCALEY,"4");
  outtextxy(310,240-5*SCALEY,"5");
  outtextxy(310,240-6*SCALEY,"6");
  outtextxy(310,240-7*SCALEY,"7");
  outtextxy(310,240-8*SCALEY,"8");
  outtextxy(310,240-9*SCALEY,"9");
  outtextxy(310,240-10*SCALEY,"10");
  outtextxy(310,240-11*SCALEY,"11");
}