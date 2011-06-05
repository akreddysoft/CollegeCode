/* PROGRAM TO SEARCH USING FIBONACCI SEARCH*/
void createfibo(int fibo[50]);
void main()
{
 int fibo[20],f1=0,j,k,n,list[20],fk,f2,q,t,mid,ki;
 clrscr();
 createfibo(fibo);
 printf("\nEnter the size of list:");
 scanf("%d",&n);
 printf("\nEnter the list:");
 for(j=0;j<n;++j)
	scanf("%d",&list[j]);
 printf("\nEnter the element to be searched:");
 scanf("%d",&k);
 j=0;
 while(fibo[j]<n+1)
	j++;
 fk=fibo[j-1];
 f1=fibo[j-2];
 f2=fibo[j-3];
 q=fibo[j-4];
 mid=n+1-fk;
 if(k>list[f1])
	f1=f1+mid;
 while(f1!=0)
 {
	if(k<list[f1])
	{
		if(q==0)
			f1=0;
		else
		{
			f1=f1-q;
			t=f2;
			f2=q;
			q=t-f2;
		}
	}

	if(k==list[f1])
	{
		printf("\nTarget found at %d position",f1+1);
		getch();
		exit(1);
	}
	if(k>list[f1])
	{
		if(f2==1)
			f1=0;
		else
		{
			f1=f1+q;
			f2=f2-q;
			q=q-f2;
		}
	}
 }
 printf("\nElement not found");
 getch();
}

void createfibo(int fibo[50])
{
 int a,b,c,i=0;
 a=0;
 b=1;
 c=0;
 do
 {
	fibo[i++]=c;
	c=a+b;
	a=b;
	b=c;
 }while(i<20);
}
