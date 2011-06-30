/* PROGRAM TO SORT USING BUBBLE SORT*/
void sort(int [],int);
void main()
{
 int i,n,list[20];
 clrscr();
 printf("\nEnter the size of list:");
 scanf("%d",&n);
 printf("\nEnter the list:\n");
 for(i=0;i<n;++i)
	scanf("%d",&list[i]);
	printf("\nThe sorted array is:\n");
 sort(list,n);
 for(i=0;i<n;++i)
	printf("%d  ",list[i]);
 getch();
}
void sort(int list[20],int n)
{
 int i,pass,flag=1,temp;
 for(pass=0;pass<n-1&&flag;++pass) //n-1 passes
 {
	flag=0;
	for(i=0;i<n-pass-1;++i)
	{
	 if(list[i]>list[i+1])
	 {
		temp=list[i];
		list[i]=list[i+1];
		list[i+1]=temp;
		flag=1;
	 }
	}
 }
}

