//ASSIGNMENT NO.4
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
 complex operator +(complex);
 complex operator -(complex);
 complex operator *(complex);
 complex operator /(complex);
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

complex complex::operator+ (complex c2)
{
 complex temp;
 temp.real=real+c2.real;
 temp.img=img+c2.img;
 return temp;
}

complex complex:: operator- (complex c2)
{
 complex temp;
 temp.real=real-c2.real;
 temp.img=img-c2.img;
 return temp;
}
complex complex:: operator* (complex c2)
{
 complex temp;
 temp.real=real*c2.real -img*c2.img;
 temp.img=real*c2.img+img*c2.real;
 return temp;
}

complex complex:: operator/ (complex c2)
{
 complex temp;
 temp.real=(real*c2.real+img*c2.img)/(c2.real*c2.real+c2.img*c2.img);
 temp.img=-(real*c2.img-c2.real*img)/(c2.real*c2.real+c2.img*c2.img);
 return temp;
}

void main()
{
 clrscr();
 complex c1,c2,c3,c4,c5,c6;
 c1.read();
 c2.read();
 c3=c1+c2;
 c4=c1-c2;
 c5=c1*c2;
 c6=c1/c2;
 cout<<"The result is:\n";
 cout<<"\nAddition ";
 c3.print();
 cout<<"\nSubtraction ";
 c4.print();
 cout<<"\nMultiplication ";
 c5.print();
 cout<<"\nDivision ";
 c6.print();
 getch();
}

/* OUTPUT
Enter the values of a,b:9
7

Enter the values of a,b:3
2
The result is:

Addition 12+9i
Subtraction 6+5i
Multiplication 13+39i
Division 3+0i
*/









                                                                                
                                                                                
                                                                                
