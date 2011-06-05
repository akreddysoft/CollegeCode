#include<string.h>
void convert(char [30],char [30]);
int find(char [30]);
void substr(char *,int ,int ,char *s);
void main()
{
	char prefix[30],postfix[30];
	int i,j,n;
	clrscr();
	printf("\nEnter the prefix:");
	gets(prefix);
	convert(prefix,postfix);
	printf("\nThe postfix is:");
	puts(postfix);
	getch();
}

void convert(char prefix[30],char postfix[30])
{
	char opnd1[30],opnd2[30];
	char post1[30],post2[30];
	char temp[30];
	char op[1];
	int length,i,j,m,n;

	if((length=strlen(prefix))==1)
	{
		if(isalpha(prefix[0]))
		{
			postfix[0]=prefix[0];
			postfix[1]=0;
			return;
		}
		printf("\niffllegal");
		exit(1);
	}

	op[0]=prefix[0];
	op[1]=0;
	substr(prefix,1,length-1,temp);
	m=find(temp);
	substr(prefix,m+1,length-m-1,temp);
	n=find(temp);
	if((op[0]!='+'&&op[0]!='-'&&op[0]!='*'&&op[0]!='/')||(m==0)||(n==0)||(m+n+1!=length))
	{
		printf("\nillegal");
		exit(1);
	}

	substr(prefix,1,m,opnd1);
	substr(prefix,m+1,n,opnd2);
	convert(opnd1,post1);
	convert(opnd2,post2);
	strcat(post1,post2);
	strcat(post1,op);
	substr(post1,0,length,postfix);
}

int find(char str[30])
{
	char temp[30];
	int length;
	int i,j,m,n;

	if((length=strlen(str))==0)
		return 0;
	if(isalpha(str[0])!=0)
		return 1;
	if(strlen(str)<2)
		return 0;
	substr(str,1,length-1,temp);
	m=find(temp);
	if(m==0||strlen(str)==m)
		return 0;
	substr(str,m+1,length-m-1,temp);
	n=find(temp);
	if(n==0)
		return 0;
	return m+n+1;
}

void substr(char *s1,int i,int j,char *s2)
{
	int k;
	int l=0;
	for(k=i;k<=j;++k)
		s2[l++]=s1[k];
//	s2[l]=0;
}