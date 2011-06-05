/////////////////ASSIGNMENT NO 5////////////
#include<iostream.h>
#include<conio.h>
#include<string.h>
class string
{
	public:
	char str1[25];
	string(){str1[0]=0;}
	string(char *s)
		{
			int i=0;
			 while(*s)
			{
				str1[i]=*s;
				s++;
				i++;
			}
			str1[i]=0;
		}
	~string(){}
		void read();
		void print(){cout<<str1;};
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
 s3.str1[i]=0;
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
 int i,j,k,n,l=0,flag=0;
 string s1[50];
 char temp[25];
 cout<<"Enter the number of strings:";
 cin>>n;
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
 getch();
 cout<<"sorted array is\n";
 for(i=0;i<n;i++)
 {
	s1[i].print();
	cout<<"\n";
 }
 getch();
}
/*OUTPUT
Enter the number of strings:3
Enter a string:computer
Enter a string:bvp
Enter a string:it
sorted array is
String is:bvp
String is:computer
String is:it
*/
