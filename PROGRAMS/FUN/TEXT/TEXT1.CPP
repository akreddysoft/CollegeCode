#include<conio.h>
#include<fstream.h>
#include<stdio.h>
#include<e:\school\seit\fun\text\decbin.cpp>
void main()
{
 clrscr();
 char text[65535],cha,fname;
 long bin;
 int dec;
 char ch;
 cout<<"File Decoder\n";
 cout<<"\nEnter the filename to read:";
 cin>>fname;
 ifstream myfile(fname);
 if(!myfile)
	cout<<"\nFatal error,Cannot create file";
 cout<<"\nEnter the text:\n";
 dec=1;
 while(dec)
 {
	dec=myfile.get();
//	dec=bina(bin);
	printf("%c",dec);
 }
 myfile.close();
}
