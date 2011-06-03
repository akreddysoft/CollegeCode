#include<iostream.h>
#include<conio.h>
#include<dos.h>
#define D delay(1000);
#include<stdio.h>
class count
{
	int i;
	int dd,mm,yy,hours,min;
	public:
		count()
		{
		 dd=mm=yy=0;
		 i=1;
		}
	void inc(){++i;}
	void clear()
	{
	 i=1;
	 remove("c:\\counter.dat");
	}
	void print();
	void getdat();
	void printlist();
};
void count::print()
{
	 textcolor(YELLOW);
	 cout<<"This computer has been booted ";
	 cprintf("%d",i);
	 cout<<" times";
	 cout<<"\nLast boot on:";
	 cprintf("%d/%d/%d",dd,mm,yy);
	 cout<<" at ";
	 cprintf("%d:%d",hours,min);
	 cout<<endl;
	 for(int i=0;i<80;++i)
		cout<<"=";
	 cout<<"\t\t\t\tHISTORY\n";
	 cout<<"S.No\t\tDate\t\t\t\tTime\n";
	 for(i=0;i<80;++i)
	 cout<<"=";
}
void count::getdat()
{
	struct date d;
	union REGS x,y;
	getdate(&d);
	dd = d.da_day ;
	mm = d.da_mon ;
	yy = d.da_year ;
	struct time t;
	gettime(&t);
	hours=t.ti_hour;
	min=t.ti_min;
}
void count::printlist()
{
	int hours1=hours;
	if(hours>12)
	hours1=hours-12;
	char *a[]={"AM","PM"};
	cout<<i;
	cout<<"\t\t";
	cout<<dd<<"/"<<mm<<"/"<<yy;
	cout<<"\t\t\t";
	cprintf("%d:%d %s",hours1,min,a[hours/12]);
	cout<<endl;
}