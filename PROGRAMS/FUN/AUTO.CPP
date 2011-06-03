//PROGRAM TO INSERT STAT IN text file - by madhur
#include<fstream.h>
#include<conio.h>
#include<process.h>
#include<dos.h>
void nofile(char [80]);
void main()
{
 clrscr();
 char str[80]="this is the statement to insert";
 char dump[80];
 char ch;
 int i=0,j=0,flag=0;
 fstream myfile("c:\\autoexec.bat",ios::in|ios::out|ios::nocreate);
 if(!myfile)
 {
	nofile(str);
	exit(1);
 }
////////////////////////////////////////////////
 while(myfile&&!flag)
 {
		 myfile.get(ch);   //scan char
		 ++j;
		 if((ch>=65&&ch<=90)||(ch>=97&&ch<=122)) //if char is regular jump
		 {                                       //next line and read first char.
			myfile.getline(dump,80-j);    //shift pointer to next line.
			continue;
		 }
		 else
		 {
			 if(ch==10)         //if the first char is a newline
			 {                 //then this must be the last line of autoexec
													//voilla!, we'll insert our statement here.
					 myfile.seekg(-2,ios::cur);
					 while(str[i])
					 {
							myfile.put(str[i]);         //insert our statement
							++i;
					 }
					 break;
			 }
		 }
 }
	myfile.seekg(ios::beg);
	while(myfile)                           //display the autoexec.bat
   {
	 myfile.get(ch);
	 cout<<ch;
   }
 myfile.close();
 getch();
}

void nofile(char str[80]) //function if autoexec.bat doesnt exist
{
	 int i=0;char ch;
	 fstream myfile("c:\\autoexec.bat",ios::out|ios::in);
	 while(str[i])
	 {
		myfile.put(str[i]);         //insert our statement
		++i;
	 }

	myfile.seekg(ios::beg);
	while(myfile)                           //display the autoexec.bat
	{
	 myfile.get(ch);
	 cout<<ch;
	}
	myfile.close();
	getch();
}