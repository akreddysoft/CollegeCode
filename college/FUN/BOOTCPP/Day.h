char* weak(int dd,int mm,int yy)
{
int ryrs,day,yrs;
		char *week[]={"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	 long n;
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
 return week[day+1];
}
char* suffix(int dd)
{
 int d1,d2;
 char *ch="st";
 char *ch1="th";
 char *ch2="nd";
 if(dd>9)
	dd=dd%10;
 if(dd==0||dd==4||dd==5||dd==6||dd==7||dd==8||dd==9)
	 return ch1;
 if(dd==1)
	return ch;
 if(dd==2)
	return ch2;
}
char* month(int mm)
{
 char *ch[]={"January","February","March","April","May","June","July","August","september","October","November","December"};
 return ch[mm-1];
}