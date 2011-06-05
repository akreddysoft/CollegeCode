void swap(int *x,int *y);
void qsort(int list[30],int low,int high);
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
 qsort(list,0,n-1);
 printf("\nThe sorted numbers are:");
 for(i=0;i<n;++i)
  printf("%d ",list[i]);
 getch();
}


int partition(int list[30],int low,int high)
{
	int a,down,temp,up,pivotloc;
	a=list[low];
	down=low;
	up=high;
	while(down<up)
	{
		while(list[down]<=a)
			down++;
		while(list[up]>a)
			up--;
		if(down<up)
			swap(&list[down],&list[up]);
	}

	swap(&list[up],&list[low]);
	list[up]=a;
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

void qsort(int list[30],int low,int high)
{
	int pivot=list[low];
	if(low<high)
	{
		pivot=partition(list,low,high);
		qsort(list,low,pivot-1);
		qsort(list,pivot+1,high);
	}
}
