//				ASSIGNMENT NO. 6
//		       To Find The DERAVTIVES Of Equation
//				Suraj Shankar
//				 ROLL NO. 48
//*************************************************************************

#include<stdio.h>
#include<conio.h>
#include<math.h>

  void main()
  {
   int o,i,n,a[6],p[6],j,c[6],k,d[6]; /* DECLARING VARIABLES*/
   char x;
   clrscr();
   printf("Enter the no. of terms"); /*TAKING NO. OF TERMS FROM USER*/
   scanf("%d",&n);
   printf("\nEnter the coefficients of equation"); /*STORING THE COEFFICIENT
						 OF EACH TERM IN ARRAY*/
   for(i=0;i<n;i++)
   {
   scanf("%d",&a[i]);
   }
   printf("\nEnter the power of each term");/*STORING THE POWER OF
					 EACH TERM IN DIFF. ARRAY*/
   for(i=0;i<n;i++)
   {
   scanf("%d",&p[i]);}
   for(i=0,j=0;i<n-1,j<n-1;i++,j++)
   {
   printf("%d*x^%d+",a[i],p[j]);

   }
   printf("%d*x^%d",a[n-1],p[n-1]);/*PRINTING THE EQUATION ENTERED*/

   for(i=0,j=0,k=0;i<n,j<n,k<n;i++,j++,k++)
   {
   c[i]=(a[j]*p[k]);
   }         /*STORING COEFFICIENTS OF DERIVATIVE IN
				  ARRAY*/

   for(i=0,j=0;i<n,j<n;i++,j++)
   {
	   d[i]=p[j]-1;
   }  /*STORING POWERS OF DERIVATIVE IN ARRAY*/

   printf("\nDerivative of equation is -\n");
   for(i=0,j=0;i<n-1,j<n-1;i++,j++)
   {
	   printf("%d*x^%d +",c[i],d[j]);
   }  /*PRINTING THE DERIVATIVE OF FUNCTION*/
   printf("%d*x^%d",c[n-1],d[n-1]);
   getch();
  }

  /*   OUTPUT
		  Enter the no. of terms3

		  Enter the coefficients of equation2
		  3
		  4

	Enter the power of each term2
	3
	2
	2*x^2+3*x^3+4*x^2
	Derivative of equation is -
	4*x^1 +9*x^2 +8*x^1
  */









                                                                                
                                                                                
                                                                                
                                                                                
