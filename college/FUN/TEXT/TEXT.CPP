#include<conio.h>
#include<fstream.h>
#include<stdio.h>
#include<e:\school\seit\fun\text\decbin.cpp>
void main()
{
 clrscr();
 char text[65535],cha,fname;
 long bin;
 int ch;
 cout<<"File Encoder\n";
 cout<<"Press Escape to stop";
// cout<<"\nEnter the filename to write:";
// cin>>fname;
 ofstream myfile("madhur.txt");
 if(!myfile)
	cout<<"\nFatal error,Cannot create file";
 cout<<"\nEnter the text:\n";
/* cin.get(text,80,'z');
 int i=0;
 while(text[i])
 {
	ch=text[i];
	bin=decbin(ch);
	cout<<bin<<" ";
	myfile<<bin;
	myfile<<" ";
	++i;
 }
 myfile<<char(26);*/
 char space=32;
 while(ch!=27)
 {
	ch=getch();
//	bin=decbin(ch);
	cout<<ch<<" ";
	myfile<<ch;
	myfile<<" ";
 }
 myfile<<char(0);
 myfile.close();
}
