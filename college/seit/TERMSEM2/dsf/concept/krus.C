void swap(int *x,int *y);

void main()
{
	int arr[20][3],edge[10],edges,ver,count,i,j;
	printf("\nEnter the number of vert:");
	scanf("%d",&ver);
	printf("\nEnter the number of edges:");
	scanf("%d",&edges);
	for(i=0;i<edges;++i)
	{
		printf("\nEnter edge %d",i+1);
		scanf("%d %d %d",&arr[i][0],&arr[i][1],&arr[i][2]);
	}

	for(i=0;i<edges-1;++i)
	{
		for(j=0;j<edges-i-1;++j)
		{
			if(arr[j][2]>arr[j+1][2])
				swap(&arr[j][0],&arr[j+1][0]);
		}
	}

	for(i=0;i<edges;++i)
		edge[i]=i;

	for(i=0;i<edges;++i)
	{
		if(edge[arr[i][0]]!=edge[arr[i][1]])
		{
			count++;
			printf("\n%d\t%d\t%d",arr[i][0],arr[i][1],arr[i][2]);
			if(edge[arr[i][0]]==arr[i][0]&&edge[arr[i][1]]==arr[i][1])
				edge[arr[i][1]]=edge[arr[i][0]];
			else
			{
				if(edge[arr[i][1]]!=arr[i][1])
					edge[arr[i][0]]=edge[arr[i][1]];
				else
					edge[arr[i][1]]=edge[arr[i][0]];
			}
		}
		if(count==ver-1)
			break;
	}
	getch();
}

void swap(int *x,int *y)
{
	int temp;
	temp=*x;
	*x=*y;
	*y=temp;
	temp=*(x+1);
	*(x+1)=*(y+1);
	*(y+1)=temp;
	temp=*(x+2);
	*(x+2)=*(y+2);
	*(y+2)=temp;
}