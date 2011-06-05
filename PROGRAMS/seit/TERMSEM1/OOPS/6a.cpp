//ASSIGNMENT 6A
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
  cout<<"\nThe date is:"<<dd<<" "<<mm<<" "<<yy;
 }
};
void main()
{
 clrscr();
 date p1;
 p1.read();
 p1.print();
 getch();
}
/*OUTPUT
Enter the date:31
10
83

The date is:31 10 83
*/

                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
