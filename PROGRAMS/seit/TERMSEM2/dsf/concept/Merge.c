void mergesort(int list[30],int n);

void main()
{
 int n,i,list[30];
 clrscr();
 printf("\nEnter the size of list:");
 scanf("%d",&n);
 printf("\nEnter the list:");
 for(i=0;i<n;++i)
  scanf("%d",&list[i]);
 mergesort(list,n);
 printf("\nThe sorted numbers are:");
 for(i=0;i<n;++i)
	printf("%d ",list[i]);
 getch();
}

void mergesort(int list[30],int n)
{
	int l1,l2,u1,u2,size,result[30],i,j,k=-1;
	size=1;
	while(size<n)
	{
		l1=0;
		k=0;
		while(l1+size<n)
		{
			l2=l1+size; //l1 +size=next lower bound
			u1=l1+size-1;         //prev 2 second lower bound=upper bound of 1
			if(l2+size-1<n)
				u2=l2+size-1;     //upper bound of 2= lowerbound+size-1
			else
				u2=n-1;

			for(i=l1,j=l2;i<=u1&&j<=u2;++k)
				if(list[i]<list[j])
					result[k]=list[i++];
				else
					result[k]=list[j++];
			for(;i<=u1;++k)
				result[k]=list[i++];
			for(;j<=u2;++k)
				result[k]=list[j++];
			l1=u2+1;
		}
		for(i=l1;k<n;++i)
			result[++k]=list[i];
		for(i=0;i<n;++i)
			list[i]=result[i];
		size=size*2;
	}
}