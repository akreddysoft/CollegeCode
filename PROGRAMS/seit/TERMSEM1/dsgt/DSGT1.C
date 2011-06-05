//ASSIGNMENT NO1
int unions(int [20],int [20],int [50],int,int);
int inters(int[20],int[20],int[50],int,int);
void main()
{
 int set1[20],set2[20],uni[50],ints[20],a,b,newa,newa1,i;
 clrscr();
 printf("Enter the number of elements of set 1:\n");
 scanf("%d",&a);
 printf("Enter the elements:");
 for(i=0;i<a;++i)
	scanf("%d",&set1[i]);
 printf("Enter the number of elements of set 2:\n");
 scanf("%d",&b);
 printf("Enter the elements:");
 for(i=0;i<b;++i)
	scanf("%d",&set2[i]);
 newa=unions(set1,set2,uni,a,b);
 newa1=inters(set1,set2,ints,a,b);
 printf("Elements of union set are:\n");
 for(i=0;i<newa;++i)
	 printf("%d\n",uni[i]);
 printf("The elements of intersection are:\n");
 for(i=0;i<newa1;++i)
	printf("%d\n",ints[i]);
	getch();
}
int unions(int set1[20],int set2[20],int uni[50],int a,int b)
{
 int i,j,k,flag=1;
 for(i=0;i<a;++i)
	uni[i]=set1[i];
 for(j=0;j<b;++j)
 {
	flag=1;
	for(k=0;k<a;++k)
	{
	 if(uni[k]==set2[j])
	flag=0;
	}
	if(flag==1)
	{
	 uni[i]=set2[j];
	 ++i;
	}
 }
 a=i;
 return(a);
}

int inters(int set1[20],int set2[20],int ints[50],int a,int b)
{
 int k=0,i,j;
 for(i=0;i<a;++i)
 {
	for(j=0;j<b;++j)
	{
	 if(set1[i]==set2[j])
	 {
		ints[k]=set1[i];
		++k;
	 }
	}
 }
a=k;
return(a);
}
/*OUTPUT
Enter the number of elements of set 1:
5
Enter the elements:1 2 3 4 5
Enter the number of elements of set 2:
5
Enter the elements:3 4 5 6 7
Elements of union set are:
1
2
3
4
5
6
7
The elements of intersection are:
3
4
5
*/






