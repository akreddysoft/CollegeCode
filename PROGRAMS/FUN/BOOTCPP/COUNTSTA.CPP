#include "e:\school\seit\fun\bootcpp\class.h"
#include<fstream.h>
void main()
{
 count c1;
 int size=sizeof(count);
 fstream myfile("c:\\counter.dat",ios::in|ios::binary|ios::nocreate);
 if(myfile)
 {
	myfile.seekg(-size,ios::end);
	myfile.read((char*)&c1,size);
	c1.print();
	myfile.seekg(0);
	while(myfile.read((char*)&c1,size))
	 c1.printlist();
	myfile.close();
	fstream myfile("c:\\counter.dat",ios::app|ios::binary);
	c1.inc();
	c1.getdat();
	myfile.write((char*)&c1,size);
	myfile.close();
 }
 else
 {
	cout<<"\nYou are using this program for the first time...";D
	cout<<"\nCounter initialised...";
	fstream myfile("c:\\counter.dat",ios::out|ios::binary);
	c1.getdat();
	myfile.write((char*)&c1,size);
	myfile.close();
	cout<<"\nYou are now ready to use this program";
 }
}
