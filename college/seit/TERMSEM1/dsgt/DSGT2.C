//ASSIGNMENT NO2
int s12(int[],int[],int[],int,int);
int s21(int[],int[],int[],int,int);
int symdifs(int[],int[],int[],int,int);
int compl(int[],int[],int[],int,int);
void main()
{
 int set1[20],set2[20],uni[20],d12[50],d21[50],symdif[50],comp[20];
 int counter1,counter2,counter3,counter4,a,b,c,flag,i;
 clrscr();
 printf("Enter the number of elements in universal set:\n");
 scanf("%d",&c);
 printf("Enter the universal set:\n");
 for(i=0;i<c;++i)
	 scanf("%d",&uni[i]);
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
 counter1=s12(set1,set2,d12,a,b);
 counter2=s21(set1,set2,d21,a,b);
 counter3=symdifs(d12,d21,symdif,counter1,counter2);
 counter4=compl(set1,uni,comp,a,c);
 printf("The elements of set1-set2 are:\n");
 for(i=0;i<counter1;++i)
	printf("%d\n",d12[i]);
 printf("The elements of set2-set1 are:\n");
 for(i=0;i<counter2;++i)
	printf("%d\n",d21[i]);
	printf("The symmetric difference is:\n");
 for(i=0;i<counter3;++i)
	printf("%d\n",symdif[i]);
 printf("The complement of set1 is:\n");
 for(i=0;i<counter4;++i)
	 printf("%d\n",comp[i]);
 getch();
}

int s12(int set1[20],int set2[20],int d12[50],int a,int b)
{
 int i,j,flag,counter1;
 for(i=0;i<a;++i)
	d12[i]=set1[i];
 for(i=0;i<a;++i)
 {
	for(j=0;j<b;++j)
	{
	 flag=1;
	 if(d12[i]==set2[j])
	flag=0;
	 if(flag==0)
	d12[i]=0;
	}
 }
 counter1=0;
 for(i=0;i<a;++i)
 {
	if(d12[i]!=0)
	{
	 d12[counter1]=d12[i];
	 counter1++;
	}
 }
return(counter1);
}

int s21(int set1[20],int set2[20],int d21[50],int a,int b)
{
 int flag,counter2,i,j;
 for(i=0;i<b;++i)
	d21[i]=set2[i];
 for(i=0;i<b;++i)
 {
	for(j=0;j<b;++j)
	{
	 flag=1;
	 if(d21[i]==set1[j])
	flag=0;
	 if(flag==0)
	d21[i]=0;
	}
 }
 counter2=0;
 for(i=0;i<a;++i)
 {
	if(d21[i]!=0)
	{
	 d21[counter2]=d21[i];
	 counter2++;
	}
 }
return(counter2);
}

symdifs(int d12[50],int d21[50],int symdif[50],int counter1,int counter2)
{
 int flag,counter3,i,j,k;
 for(i=0;i<counter1;++i)
	symdif[i]=d12[i];
 flag=1;
 for(j=0;j<counter2;++j)
 {
	flag=1;
	for(k=0;k<counter1;++k)
	{
	 if(symdif[k]==d21[j])
		flag=0;
	}
	if(flag==1)
	{
	 symdif[i]=d21[j];
	 ++i;
	}
 }
 counter3=i;
 return(counter3);
}

int compl(int set1[20],int uni[20],int comp[20],int a,int c)
{
 int i,j,k=0,counter4;
 for(i=0;i<c;++i)
 {
	if(uni[i]!=set1[i])
	{
	 comp[k]=uni[i];
	 ++k;
	}
 }
 counter4=k;
 return(counter4);
}

/*OUTPUT
Enter the number of elements in universal set:
3
Enter the universal set:
1
2
3
Enter the number of elements of set 1:
2
Enter the elements:1
2
Enter the number of elements of set 2:
2
Enter the elements:2
3
The elements of set1-set2 are:
1
The elements of set2-set1 are:
3
The symmetric difference is:
1
3
The complement of set1 is:
3
*/

