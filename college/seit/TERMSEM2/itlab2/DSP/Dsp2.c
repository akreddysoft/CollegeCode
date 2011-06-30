#include<graphics.h>
#include<math.h>
/* THE DIFF EQUATION FOR THE LOW PASS FILTER IS
   y(n)=(x(n)+x(n-1))/2
   OBTAIN MAGNITUDE  AND PHASE TRANSFER FUNCTION
   PLOT FOR THIS FILTER.
*/
   void main()
   {
	 float real,img ,realden,imgden ;
	 float mag[640],phase[640],pi,w,wstep;
	 float static a[10],b[10],yMag,yPhase;
	 int  m,n,i,k,gd=DETECT,gm;
	 clrscr();
	 printf(" \n This program displays the magnitude and phase"
		 " transfer function plots \n from given coeff. of  "
		 "difference equation \n\ ");
	 printf(" \n Enter the coeff. of x(n) ,m= ");
	 scanf("%d",&m);
	 for(i=0;i<m;i++)
	 {
		printf("b%d= ",i);
		scanf("%f",&b[i]);
	 }
	 printf("\nenter the number of coeff of y(n),n= ");
	 scanf("%d",&n);
	 a[0]=1.0;
	 for(i=1;i<=n;i++)
	 {
		printf("a%d= ",i);
		scanf("%f",&a[i]);
	 }
	 pi=22.0/7.0;
	 wstep=pi/640.0;
	 for(k=0;k<640;k++)
	 {
		w=w+wstep;
		real=b[0];
		img=0;
		for(i=1;i<m;i++)
		{
			real=real+b[i]*cos(i*w);
			img=img+b[i]*sin(i*w);
		}
		img=img*(-1.0);
		realden=a[0];
		imgden=0;
		for(i=1;i<=n;i++)
		{
			realden=realden+a[i]*cos(i*w);
			imgden=imgden+a[i]*sin(i*w);
		}
		imgden=imgden*(-1.0);
		mag[k]=sqrt(real*real+img*img)/sqrt(realden*realden+imgden*imgden);
		phase[k]=atan2(img,real)-atan2(imgden,realden);
	  }
		initgraph(&gd,&gm,"e:\\tc\\bgi");
		setlinestyle(DOTTED_LINE,1,1);
		line(0,150,640,150);
		line(0,350,640,350);
		line(320,0,320,480);
		for(k=0;k<640;k++)
		{
			yMag=150-mag[k]*25;
			putpixel(320+0.5*k,yMag,WHITE);
			putpixel(320-0.5*k,yMag,WHITE);
			yPhase=350-phase[k]*50;
			putpixel(320+0.5*k,yPhase,WHITE);
			putpixel(320-0.5*k,2*350-yPhase,WHITE);
		}
		outtextxy(500,200,"Magnitude plot");
		outtextxy(500,450,"phase plot");
		getch();
		closegraph();
	}

