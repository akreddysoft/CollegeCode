//////////////////ASSIGNMENT NO 2//////////////////////////
#include<iostream.h>
#include<conio.h>
class string
{
	char str1[25];
	public:
		string() {}
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
		void print(){cout<<str1;}
		void concat(string,string);
		void substring(string,int,int);
		string less(string,string);
		string greater(string,string);
		void equal(string,string);

};
void string::read()
{
 cout<<"Enter a string:";
 cin>>str1;
}
void string::concat(string s1,string s2)
{
	int i=0;
	while(s1.str1[i])
	{
		str1[i]=s1.str1[i];
		i++;
	}
	int k=0;
	while(s2.str1[k])
	{
	 str1[i]=s2.str1[k];
	 i++;
	 k++;
	}
 str1[i]=0;
}
void string::substring(string s1,int i,int j)
{
 int k,m=0;
 for(k=i-1;k<j;k++)
 {
	 str1[m]=s1.str1[k];
	 m++;
 }
 str1[m]=0;
}
void string::equal(string s1,string s2)
{
 int i=0,a,b;
 while(s1.str1[i])
	 i++;
 a=i;
 i=0;
 while(s2.str1[i])
	 i++;
 b=i;
 i=0;
 int flag=0;
 if(a==b)
	{
		while(s1.str1[i])
		{
			if(s1.str1[i]!=s2.str1[i])
			{
			 flag=1;
			 break;
			}
			i++;
			flag=0;
		}
	if(flag==1) cout<<"Not equal"; else cout<<"Equal";
	}
if(a!=b)cout<<"Not equal";
}
string string::less(string s1,string s2)
{
 int i=0,asc=0,asc1=0;
 while(s1.str1[i])
 {
	asc=asc+s1.str1[i];
	i++;
 }
 cout<<"\n";
 i=0;
 while(s2.str1[i])
 {
	asc1=asc1+s2.str1[i];
	i++;
 }
 if(asc<asc1) return s1; else if(asc1<asc) return s2;
}
string string::greater(string s1,string s2)
{
 int i=0,asc=0,asc1=0;
 while(s1.str1[i])
 {
	asc=asc+s1.str1[i];
	i++;
 }
 cout<<"\n";
 i=0;
 while(s2.str1[i])
 {
	asc1=asc1+s2.str1[i];
	i++;
 }
 if(asc>asc1) return s1; else if(asc1>asc) return s2;
}

void main()
{
 clrscr();
 int i,j;
 string s1,s2,s3,s4,s5;
 s1.read();
 s2.read();
 s3.concat(s1,s2);
 cout<<"\nConcat is:";
 s3.print();
 cout<<"\nEnter starting and ending position:";
 cin>>i>>j;
 s5.substring(s3,i,j);
 cout<<"\nSubstring is:";
 s5.print();
 s4=s1.greater(s1,s2);
 cout<<"\nGreater is:";
 s4.print();
 getch();
}
/*OUTPUT
Enter a string:madhur
Enter a string:ahuja
String is:madhurahuja
641
521
String is:madhur
*/

