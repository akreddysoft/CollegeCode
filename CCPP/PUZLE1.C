#include<stdio.h>
#include<stdlib.h>
char nums[100][7];
int numi=0;
int main()
{

	int s,m,l,i;

	func();
}

int func(int s,int m)
{
	int i;
	for(s=0;s<10;++s)//iterate thru y
	{
		for(m=10;m<100;++m)
		{
			if(i=checknum(s,m)!=1)
				continue;
			else
				break;

		}
	}
}


int checknum(int s,int m)
{

	char a[2],b[3],c[4];
	int i=0,j,flag,sum,k;
	sum=s*m;
	if(sum<100)
		return -1;
	else
		itoa(sum,c,10);

	itoa(s,a,10);
	itoa(m,b,10);

	if(!checknum1(a)||!checknum1(b)||!checknum1(c))
		return -1;


	for(i=0;i<strlen(a);++i)
	{
		for(j=0;j<strlen(b);++j)
		{
			for(k=0;k<strlen(c);++k)
			{
				if(a[i]==b[j]||a[i]==c[k]||b[j]==c[k])
				{
					flag=0;
					return -1;
				}
				else
					flag=1;
			}
		}
	}
	if(flag)
	{
		for(i=0;i<numi;++i)
		{
			int a1,b1,c1;
			a1=search(nums[i],a);	//search the chars of first num
			b1=search(nums[i],b);   //search the chars of second num
		 //	c1=search(nums[i],c);
			if(a1==0&&b1==0)
				printf("%s %s %s",a,b,nums[i]);
		}
		strcpy(nums[numi],a);
		strcat(nums[numi],b);
		strcat(nums[numi],c); //nums[numi] contains the characters of the first pair
		numi++;
		return 1;
	}
	else
		return 0;
}

int checknum1(char *number)
{
	int i=0,j;
	for(i=0;i<strlen(number);++i)
	{
		for(j=0;j<strlen(number);++j)
		{
			if(i!=j)
			if(number[i]==number[j])
			{
				return 0;
			}
			else
				continue;

		}
	}
	return 1;
}


int search(char *source,char *str)
{
	int i,j,flag;
	for(i=0;i<strlen(str);++i)
	{
		for(j=0;j<7;++j)
		{
			if(str[i]==source[j])
			{
				flag=0;
				break;
			}
			else
				flag=1;

		}
		if(!flag)
			break;
	}
	if(flag)
		return 0;
	else
		return -1;
}