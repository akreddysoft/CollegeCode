//ASSIGNMENT 6E
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
class employee:private person
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
class student:private person
{
 char branch[10];
 int perc;
 public:
 void read()
 {
  person::read();
  cout<<"Enter the branch,percentage:";
  cin>>branch>>perc;
 }
 void print()
 {
  person::print();
  cout<<"\nbranch:"<<branch<<"\npercentage:"<<perc;
 }
};
class studentemp:public person,public employee
{};

void main()
{
 clrscr();
 student p1;
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
Enter the branch,percentage:IT
66

The data is:
Date:31 10 83
name:MADHUR
date of birth:31
branch:IT
percentage:66
*/
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
