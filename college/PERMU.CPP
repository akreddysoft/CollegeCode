#include<conio.h>
#include<stdio.h>
#include<string.h>
void permu(char str1[20]);
long fact(int);
char newstr[20];
int i,n,len,m;
long count=1;
char am;
void main (void)
{
	char str[20],ret[20];
	clrscr();
	printf("Enter the string:\n");
	gets(str);
	len=strlen(str);
	for(int i=0;i<fact(len)-1;++i)
	{
		permu(str);
		count++;
	}
	printf("\nThe count is:%ld",count);
	getch();
}

void permu(char str1[20])
{
	for(i=len-1;i>=0;--i)
		 if(str1[i-1]<str1[i])
		 {
			  m=i;
			  break;
		 }
	for(i=0;i<m-1;++i)
		newstr[i]=str1[i];
	int index=i;

	am=str1[m-1];
	char bm=str1[m];
	for(i=m;i<len;++i)
		 if(bm>str1[i])
			 if(str1[i]>am)
				  bm=str1[i];
	newstr[index]=bm;

	for(i=m-1;i<len;++i)
		 if(str1[i]!=bm)
			  newstr[++index]=str1[i];

	for(i=m;i<len;++i)
		 for(int j=m;j<len-1;++j)
			  if(newstr[j]>newstr[j+1])
			  {
				   char t=newstr[j];
				   newstr[j]=newstr[j+1];
				   newstr[j+1]=t;
			  }

	newstr[++index]=0;
	printf("%s ",newstr);
	strcpy(str1,newstr);
}

long fact(int n)
{
	long fac=1;
	while(n>0)
	{
		  fac=fac*n;
		  n--;
	}
	return fac;
}
