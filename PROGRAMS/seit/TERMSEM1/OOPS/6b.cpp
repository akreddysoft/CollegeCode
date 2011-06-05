//ASSIGNMENT 6B
#include<iostream.h>
#include<stdio.h>
#include<conio.h>
class date
{
 private:
 int dd,mm,yy;
 public:
 void read()
 {
	cout<<"\nEnter the date:";
	cin>>dd>>mm>>yy;
 }
 void print()
 {
	cout<<"\nThe data is:\n"<<"Date:"<<dd<<" "<<mm<<" "<<yy;
 }
};
class person
{
 private:
 char name[20];
 date ddmmyy;
 long dob;
 public:
 void read()
 {
	ddmmyy.read();
	cout<<"\nEnter the name:";
	cin>>name;
	cout<<"Enter the dob:";
	cin>>dob;
 }
 void print()
 {
	ddmmyy.print();
	cout<<"\nname:"<<name<<"\ndate of birth:"<<dob;
 }
};
void main()
{
 clrscr();
 person p1;
 p1.read();
 p1.print();
 getch();
}


/*OUTPUT
Enter the date:31
10
83

Enter the name:MADHUR
Enter the dob:31

The data is:
Date:31 10 83
name:MADHUR
date of birth:31
*/



                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
