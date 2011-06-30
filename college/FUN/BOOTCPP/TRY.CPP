#include<iostream.h>
#include<conio.h>
#include<stdio.h>
#include<e:\school\seit\fun\bootcpp\day.h>
void main()
{
 int mm,dd,yy,yrs,ryrs,day;
 char *week[]={"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
 long n;
 clrscr();
 printf("Enter the date as dd mm yyyy:\n");
 scanf("%d %d %d",&dd,&mm,&yy);
 printf("%s %d%s %s %d",weak(dd,mm,yy),dd,suffix(dd),month(mm),yy);
 getch();
}