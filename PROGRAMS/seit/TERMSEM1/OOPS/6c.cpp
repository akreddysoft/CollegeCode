//ASSIGNMENT 6C
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
	cout<<"\nEnter the dob:";
	cin>>dob;
 }
 void print()
 {
	ddmmyy.print();
	cout<<"\nname:"<<name<<"\ndate of birth:"<<dob;
 }
};
class employee:public person
{
 char compname[20],desig[10],depart[10];
 int salary;
 public:
 void read()
 {
	person::read();
	cout<<"Enter companyname,designamtion,department:";
	cin>>compname>>desig>>depart;
 }
 void print()
 {
	person::print();
	cout<<"\ncompany name:"<<compname<<"\ndesignation:"<<desig<<"\ndepartment:"<<depart;
 }
};
void main()
{
 clrscr();
 employee p1;
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
Enter companyname,designamtion,department:BVP
STUDENT
it

The data is:
Date:31 10 83
name:MADHUR
date of birth:31
company name:BVP
designation:STUDENT
department:it
*/




                                                                                
