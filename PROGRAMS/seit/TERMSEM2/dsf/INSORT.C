/* PROGRAM TO SORT USING INSERTION SORT*/
void main()
{
 int list[20],n,i,j,t;
 clrscr();
 printf("\nEnter the size of array:");
 scanf("%d",&n);
 printf("\nEnter the list:");
 for(i=0;i<n;++i)
  scanf("%d",&list[i]);

 for(i=1;i<n;++i)
 {
	t=list[i];
	for(j=i-1;j>=0&&t<list[j];j--)
		list[j+1]=list[j];
	list[j+1]=t;
 }

 printf("\nThe sorted array is:");
 for(i=0;i<n;++i)
  printf("%d ",list[i]);
 getch();
}
