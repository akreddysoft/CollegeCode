/////////////////ASSIGNMENT NO 7///////////////
#include<fstream.h>
#include<conio.h>
#include<string.h>
void sort(char list[20][20]);
class string
{
	public:
	char str1[25];
	string(){}
		string(char *s)
		{
			int i=0;
			 while(*s!)
			{
				str1[i]=*s;
				s++;
				i++;
			}
			str1[i]='\0';
		}
		void read();
		void print(){cout<<str1;}
		string operator+(string);
		void substring(string,int,int);
		int operator<(string);
		int operator>(string);
		string operator==(string);
};
void string::read()
{
 cout<<"Enter a string:";
 cin>>str1;
}
string string::operator +(string s1)
{
	string s3;
	int i=0;
	while(str1[i])
	{
		s3.str1[i]=str1[i];
		i++;
	}
	int k=0;
	while(s1.str1[k])
	{
	 s3.str1[i]=s1.str1[k];
	 i++;
	 k++;
 }
 s3.str1[i]='\0';
 return s3;
}
void string::substring(string s1,int i,int j)
{
 int k,m=0;
 string s3;
 for(k=i;k<=j;k++)
 {
	s3.str1[m]=s1.str1[k];
	m++;
 }
 s3.str1[i]='\0';
 s3.print();
}
string string::operator==(string s1)
{
 int i=0,a,b;
 while(str1[i])
		i++;
 a=i;
 i=0;
	while(s1.str1[i])
		i++;
 b=i;
 i=0;
 int flag=0;
 if(a==b)
 {
		while(str1[i])
		{
			if(str1[i]!=s1.str1[i])
			{
			 flag=1;
			 break;
			}
		 i++;
		 flag=0;
		}
	if(flag==1) cout<<"Not equal"; else cout<<"Equal";
	}
 if(a!=b) cout<<"Not equal";
}

int string::operator < (string s1)
{
 int i=0,asc=0,asc1=0;
 while(str1[i])
 {
	asc=asc+str1[i];
	i++;
 }
 i=0;
 while(s1.str1[i])
 {
	asc1=asc1+s1.str1[i];
	i++;
 }
 if(asc<asc1) return 1;
 if(asc1<asc) return 0;
 if(asc==asc1) return 2;
}

int string::operator > (string s1)
{
 int i=0,asc=0,asc1=0;
 while(str1[i])
 {
	asc=asc+str1[i];
	i++;
 }
 i=0;
 while(s1.str1[i])
 {
	asc1=asc1+s1.str1[i];
	i++;
 }
 if(asc>asc1) return 1;
 if(asc1>asc) return 0;
 if(asc==asc1) return 2;
}

void main()
{
 clrscr();
 int i,j,k,n=5,l=0,flag=0;
 string s1[50],s2[50],s3[50],s4[100];
 char temp[25],fname[20],fname1[20],fname2[20];
 int size=sizeof(string);
 for(i=0;i<n;i++)
	s1[i].read();
 i=0;
 while(i<n&&!flag)
 {
	flag=1;
	i++;
	for(j=0;j<n-i;++j)
	{
	 while(s1[j].str1[l]==s1[j+1].str1[l])
		++l;
	 if(s1[j].str1[l]>s1[j+1].str1[l])
	 {
		strcpy(temp,s1[j].str1);
		strcpy(s1[j].str1,s1[j+1].str1);
		strcpy(s1[j+1].str1,temp);
		flag=0;
	 }
	l=0;
	}
 }
 cout<<"\nEnter the filename to write:";
 cin>>fname;
 ofstream myfile(fname);
 for(i=0;i<n;i++)
	myfile.write((char*)&s1[i],size);
 myfile.close();
 cout<<"\nDo you want to merge 2 files:(y/n)";
 if(getch()=='y')
 {
	cout<<"\nEnter the first filename:";
	cin>>fname1;
	cout<<"\nEnter the second filename:";
	cin>>fname2;
	ifstream afile(fname1);
	ifstream bfile(fname2);
	ofstream cfile("sorted.dat");
	i=0;
	j=0;
	while(afile.read((char*)&s2[i++],size));
	while(bfile.read((char*)&s3[j++],size));
	for(i=0;i<5;++i)
	 strcpy(s4[i].str1,s2[i].str1);
	for(i=5,j=0;i<10;++i,++j)
	 strcpy(s4[i].str1,s3[j].str1);
	i=0,flag=0,l=0;
	while(i<10&&!flag)
	{
	 flag=1;
	 i++;
	 for(j=0;j<10-i;++j)
	 {
		while(s4[j].str1[l]==s4[j+1].str1[l])
		++l;
		if(s4[j].str1[l]>s4[j+1].str1[l])
		{
		 strcpy(temp,s4[j].str1);
		 strcpy(s4[j].str1,s4[j+1].str1);
		 strcpy(s4[j+1].str1,temp);
		 flag=0;
		}
	 l=0;
	 }
	}
	cout<<"\nThe contents of a merged file sorted.dat are as follows:";
	for(i=0;i<10;++i)
	 cfile.write((char*)&s4[i],size);
	cfile.close();
	ifstream dfile("sorted.dat");
	for(i=0;i<10;++i)
	{
	 dfile.read((char*)&s4[i],size);
	 cout<<s4[i].str1<<"\n";
	}
 }
 getch();
}

void sort(char list[20][20])
{
 int i=0,l=0,j,temp,flag=0;
 while(i<9&&!flag)
 {
	flag=1;
	i++;
	for(j=0;j<10-i;++j)
	 {
		while(s4[j].str1[l]==s4[j+1].str1[l])
		++l;
		if(s4[j].str1[l]>s4[j+1].str1[l])
		{
		 strcpy(temp,s4[j].str1);
		 strcpy(s4[j].str1,s4[j+1].str1);
		 strcpy(s4[j+1].str1,temp);
		 flag=0;
		}
	 l=0;
	 }
	}
 }
/*OUTPUT
Enter a string:op
Enter a string:er
Enter a string:tr
Enter a string:er
Enter a string:df

Enter the filename to write:b

Do you want to merge 2 files:(y/n)
Enter the first filename:a

Enter the second filename:b

The contents of a merged file sorted.dat are as follows:df
drio
er
er
erio
fdkl
madhur
op
tr
vc
*/

