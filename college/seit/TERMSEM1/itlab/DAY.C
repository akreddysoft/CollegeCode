//PROGRAM TO DISPLAY DAY FOR A DATE
void main()
{
 int mm,dd,yy,yrs,ryrs,day;
 char *week[]={"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
 long n;
 do
 {
	clrscr();
	printf("Enter the date as dd mm yyyy:\n");
	scanf("%d %d %d",&dd,&mm,&yy);
	n=(30.42*(mm-1)+dd);
	yy=yy-1900;
	if(mm==2)
		n++;
	if(mm>2&&mm<8)
		n--;
	if(yy%4==0&&mm>2)
		n++;
	yrs=yy/4;
	n=n+yrs*1461;
	ryrs=yy%4;
	if(ryrs>0)
	 n=n+365*ryrs;
	if(n>59)
		n--;
	day=n%7;
	printf("\nThe day is:");
	printf("%s",week[day]);
	printf("\nDo you want to continue(y/n):");
 }
 while(getch()=='y');
}
/*OUTPUT
Enter the date as dd mm yyyy:
31
10
83

Monday
Do you want to continue(y/n):
*/
