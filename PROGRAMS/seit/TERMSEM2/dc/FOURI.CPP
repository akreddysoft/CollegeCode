/*PROGRAM FOR COMPUTATION OF FOURIER TRANSFORM
 MADHUR AHUJA
 ROLL NO 22
*/
#include<math.h>
#include<stdio.h>
#include<conio.h>
double integ(double,double,double,int,int);
double f1value(int x,int y){ return sin(x)*sin(y);}
double f2value(int x,int y){ return sin(x)*cos(y);}

void main()
{
 int x,y;
 double start,end,delta,res1,res2;
 clrscr();
 printf("\nThe input function is:sint");
 printf("\nThe fourier transform to be calculated is:Intg sint e^-jwt");
 printf("\nEnter the value of w:");
 scanf("%d",&x);
 start=-10000;
 end=10000;
 delta=(end-start)/100000;
 res1=integ(start,end,delta,x,0);
 res2=integ(start,end,delta,x,1);
 printf("%f+i%f",res1,res2);
 getch();
}

double integ(double start,double end,double deltax,int w,int check)
{
 double x1,x2,y1,y2,da;
 double ta=0;
 for(x1=start;x1<end-deltax;x1=x1+deltax)
 {
  x2=x1+deltax;
  if(check==0)
  {
   y1=f1value(x1,w*x1);
   y2=f1value(x2,w*x2);
  }
  else
  {
   y1=f2value(x1,w*x1);
   y2=f2value(x2,w*x2);
  }
  da=0.5*(y1+y2)*deltax;
  ta=ta+da;
 }
 return ta;
}

/*OUTPUT
The input function is:sint
The fourier transform to be calculated is:Intg sint e^-jwt
Enter the value of w:10
-0.233016+i-0.239498
*/


                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
