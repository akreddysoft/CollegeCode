//ASSIGNMENT NO.1
#include<iostream.h>
#include<conio.h>
class complex
{
 private:
 float real;
 float img;

 public:
 void read();
 void print();
 void add(complex,complex);
 void subtract(complex,complex);
 void divide(complex,complex);
 void mult(complex,complex);
};

void complex::read()
{
 cout<<"\nEnter the values of a,b:";
 cin>>real>>img;
}
void complex::print()
{
 cout<<endl;
 if(img==0)
 cout<<real;
 else
 {
	if(img>0)
	cout<<real<<"+"<<img<<"i";
	else
	cout<<real<<img<<"i";
 }
}
void complex::add(complex c1,complex c2)
{
 real=c1.real+c2.real;
 img=c1.img+c2.img;
}
void complex::subtract(complex c1,complex c2)
{
 real=c1.real-c2.real;
 img=c1.img-c2.img;
}
void complex::mult(complex c1,complex c2)
{
 real=c1.real*c2.real -c1.img*c2.img;
 img=c1.real*c2.img+c1.img*c2.real;
}
void complex::divide(complex c1,complex c2)
{
 real=(c1.real*c2.real+c1.img*c2.img)/(c2.real*c2.real+c2.img*c2.img);
 img=-(c1.real*c2.img-c2.real*c1.img)/(c2.real*c2.real+c2.img*c2.img);
}
void main()
{
 clrscr();
 complex c1,c2,c3,c4,c5,c6;
 c1.read();
 c2.read();
 c3.add(c1,c2);
 c4.subtract(c1,c2);
 c5.mult(c1,c2);
 c6.divide(c1,c2);
 cout<<"The result is:\n";
 cout<<"\nAddition";
 c3.print();
 cout<<"\nSubtraction";
 c4.print();
 cout<<"\nMultiplication";
 c5.print();
 cout<<"\nDivison";
 c6.print();
 getch();
}

/*OUTPUT
Enter the values of a,b:7
4

Enter the values of a,b:2
2
The result is:

Addition
9+6i
Subtraction
5+2i
Multiplication
6+22i
Divison
2+0i
*/
