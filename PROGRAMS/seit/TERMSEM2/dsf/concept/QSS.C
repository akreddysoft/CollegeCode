void swap(int *x,int *y);
void sort(int list[30],int low,int high);
int partition(int list[30],int low,int high);

void main()
{
 int n,i,list[30];
 clrscr();
 printf("\nEnter the size of list:");
 scanf("%d",&n);
 printf("\nEnter the list:");
 for(i=0;i<n;++i)
  scanf("%d",&list[i]);
 sort(list,0,n-1);
 printf("\nThe sorted numbers are:");
 for(i=0;i<n;++i)
  printf("%d ",list[i]);
 getch();
}

int partition(int list[30],int low,int high)
{
	int pivotloc,down,up,a;
	down=low;
	up=high;
	a=list[low];

	while(down<up)
	{
		while(list[down]<=a&&down<up)
			down++;
		while(list[up]>a)
			up--;
		if(down<up)
			swap(&list[down],&list[up]);
	}
	swap(&list[low],&list[up]);
	pivotloc=up;
	return pivotloc;
}

void swap(int *x,int *y)
{
	int t;
	t=*x;
	*x=*y;
	*y=t;
}

void sort(int list[30],int low,int high)
{
	int pivot;
	if(low<high)
	{
		pivot=partition(list,low,high);
		sort(list,low,pivot-1);
		sort(list,pivot+1,high);
	}
}
