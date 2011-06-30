/************************************
PROGRAM FOR FINDING HAMMING DISTANCE
NAME : MADHUR AHUJA
ROLLNO: 22
**************************************/
#include<stdio.h>
void main()
	 {
	   int c,x=0,i,flag=0;
	   char a[128],b[128];
	   clrscr();
	   printf("\n ENTER THE BIT RNAGE FOR BOTH THE CODES : ");
	   printf("\n\t MUST BE SAME (IN DIGITAL FORM)");
	   scanf("%d",&c);
	   printf("\n ENTER THE TRANSMITTED CODE:");
	   fflush(stdin);
	   gets(a);

	   for(i=0;i<c;i++)
	  {
		if((a[i]!='0')&&(a[i]!='1'))
		{
			printf("\n WRITE THE TRANSMITTED CODE IN DIGITAL FORM ");
			getch();
			exit(1);
		}
	  }
	   printf("\n ENTER THE THE RECIEVED CODE:");
	   gets(b);

	   for(i=0;i<c;i++)
	  {
		if((b[i]!='0')&&(b[i]!='1'))
		{
		 printf("\n WRITE THE RECIEVED CODE IN DIGITAL FORM ");
		 getch();
		 exit(1);
		}
	   }

	   for(i=0;i<c;i++)
	  {
		if(a[i]!=b[i])
		  {
		   x++;
		   flag = 1;
		  }
	  }

	   if(flag)
	 {
	   printf("\n BOTH THE CODES AREN'T SAME ");
	   printf("\n HAMMING DISTANCE IS : ");
	   printf("\n%d",x);
	 }
	  else
	   printf("\n BOTHE THE CODES ARE SAME ");
	   getch();
	  }

/*OUTPUT
 ENTER THE BIT RNAGE FOR BOTH THE CODES :
         MUST BE SAME (IN DIGITAL FORM)4

 ENTER THE TRANSMITTED CODE:1011

 ENTER THE THE RECIEVED CODE:1011

 BOTHE THE CODES ARE SAME


 ENTER THE BIT RNAGE FOR BOTH THE CODES :
         MUST BE SAME (IN DIGITAL FORM)4

 ENTER THE TRANSMITTED CODE:1011

 ENTER THE THE RECIEVED CODE:1001

 BOTH THE CODES AREN'T SAME
 HAMMING DISTANCE IS :
1

*/