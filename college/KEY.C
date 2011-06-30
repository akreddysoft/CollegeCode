int c=9;
void inc(char str[10],int c);

void main()
{
	static char str[10];
	int i;
	for(i=0;i<1000;++i)
	{
		inc(str,c);
	}
	getch();
}

void inc(char str[10],int c)
{
	int i;
	for(i=c;i>0;--i)
	{
		if(str[i]=='9')
		{
			str[i]='0';
		}
		else
		{
			++str[i];
		}
	}
}

