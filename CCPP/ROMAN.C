main()
{
	int a;
	printf("\nEnter the number:");
	scanf("%d",&a);
	roman (a);
	}

/*
** Print an Arabic number in Roman numerals.
*/
roman(int arabic)

	{
	arabic = romanize(arabic,1000,'m');
	arabic = romanize(arabic,500,'d');
	arabic = romanize(arabic,100,'c');
	arabic = romanize(arabic,50,'l');
	arabic = romanize(arabic,10,'x');
	arabic = romanize(arabic,5,'v');
	arabic = romanize(arabic,1,'i');
	romanize(arabic,1,'i');
	printf("\n");
	}

/*
** Print the character c as many times as there are
** j's in the number i, then return i minus the j's
*/
romanize (int i,int j,char c)
{
	while (i>=j)
		{
		putch(c);
		i = i - j;
		}
	return i;
	}
