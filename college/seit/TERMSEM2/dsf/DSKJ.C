	 /*to find sortest path using djks*/
#define inf 1000
void main()
{
	int a[30][30],l[30],per[30],i,j,k,flag,small,t,m,n,s,d;
	clrscr();
	printf("\n Enter the number of nodes :");
	scanf("%d",&n);
	printf("\n Enter the number of edges :");
	scanf("%d",&m);
	for(i=1;i<=n;i++)
	{
		for(j=1;j<=n;j++)
			a[i][j]=inf;
	}
	for(i=1;i<=m;i++)
	{
		printf("\n Edge %d",i);
		printf("\n Node :");
		scanf("%d",&j);
		printf(" Node :");
		scanf("%d",&k);
		printf("\n Enter the corressponding weight :");
		scanf("%d",&a[j][k]);
		a[k][j]=a[j][k];
	}
	printf("\n Enter the source & destination edge..");
	printf("\n Source  Node : ");
	scanf("%d",&s);

	printf("\n Destination Node : ");
	scanf("%d",&d);
	for(i=1;i<=n;i++)
		l[i]=per[i]=inf;
///////////////////////////////////////////////////////////////
	l[s]=0;
	small=inf;

	for(m=1;m<=n;m++)
	{
		per[s]=0;
		flag=0;
		for(j=1;j<=n;j++)
		{
			if(j!=s)
			{
				if(per[j]==inf)
				{
					t=l[s]+a[s][j];
					if(l[j] > t)
						l[j]=t;
					if(flag==0)
					{
						small=l[j];
						flag=1;
					}
					if(small > l[j])
						small=l[j];
				}
			}
		}
		for(j=1;j<=n;j++)
		{
			if(small== l[j])
			{
				s = j;
				if (s == d)
					goto b;
				break;
			}
		}
	}
	/////////////////////////////////////////////////////////
	b:
	printf("\n The smallest distance is :%d",small);
	getch();
}
