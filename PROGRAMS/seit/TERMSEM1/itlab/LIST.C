void sort(char list[20][20],int n);
void main()
{
 char list[20][20];
 int i=0,k,n;
 clrscr();
 printf("Enter the no. of strings:\n");
 scanf("%d",&n);
 printf("Enter the strings:\n");
 for(i=0;i<n;++i)
	scanf("%s",list[i]);
 sort(list,n);
	printf("The result is:\n");
 for(i=0;i<n;++i)
	 printf("%s\n",list[i]);
 getch();
}
void sort(char list[20][20],int n)
{
 int i=0,l=0,j,flag=0;
 int temp;
 while(i<n-1&&!flag)
 {
	flag=1;
	i++;
	for(j=0;j<n-i;++j)
	{
	 while(list[j][l]==list[j+1][l])
		++l;
	 if(list[j][l]>list[j+1][l])
	 {
		strcpy(temp,list[j]);
		printf("\n%s",temp);
		strcpy(list[j],list[j+1]);
		strcpy(list[j+1],temp);
		flag=0;
	 }
	l=0;
	}
 }
}