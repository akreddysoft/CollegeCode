//WARSHALL ALGORITHM
main()
{
int a[4][4],b[4][4];
int i,j,k;
clrscr();
printf("enter array elements\n");
for(i=0;i<4;i++)
{
	for(j=0;j<4;j++)
	{
		scanf("%d",&a[i][j]);
		if(a[i][j]==1)
		{

			b[i][j]=1;
		}
		else
		{
			b[i][j]=0;
		}
	}

}
printf("original array\n");
for(i=0;i<4;i++)
{
	for(j=0;j<4;j++)
	{
	       printf("%d   ",a[i][j]);
	}
	printf("\n");
}



for(i=0;i<4;i++)
{
	for(j=0;j<4;j++)
	{
		if(a[i][j]==1)
		{
			for(k=0;k<4;k++)
			{
						if(a[j][k]==1)
								b[i][k]=1;

			}
		}
	}
}
	printf(" resultant array\n");
	for(i=0;i<4;i++)
	{
	 for(j=0;j<4;j++)
		printf("%d   ",b[i][j]);
	 printf("\n");
	}
	getch();
}

/*OUTPUT
enter array elements
1 1 0 0
1 0 0 1
1 0 0 0
1 0 0 1
original array
1   1   0   0
1   0   0   1
1   0   0   0
1   0   0   1
 resultant array
1   1   0   1
1   1   0   1
1   1   0   0
1   1   0   1
*/



                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
