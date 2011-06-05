/*****************************************
 PROGRAM TO SEARCH USING FIBONACCI SEARCH
 NAMEE : MADHUR AHUJA
 ROLL NO. 22
*****************************************/
void main()
{
 int fibo[20],i=0,j,k,a,b,c,n,ki,list[20],fk,p,q,t,m;
 clrscr();
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
 printf("\nEnter the size of list:");
 scanf("%d",&n);
 printf("\nEnter the list:");
 for(j=0;j<n;++j)
	scanf("%d",&list[j]);
 printf("\nEnter the element to be searched:");
 scanf("%d",&k);
 for(j=0;j<20;++j)
 {
	if(fibo[j]>n+1)
	{
	 ki=fibo[j];
	 break;
	}
 }
 fk=fibo[j-1];
 i=fibo[j-2];
 p=fibo[j-3];
 q=fibo[j-4];
 m=n+1-fk;
 if(k>list[i])
  i=i+m;
 while(i!=0)
 {
  if(k<list[i])
  {
   if(q==0)
	i=0;
   else
   {
	i=i-q;
	t=p;
	p=q;
	q=t-p;
   }
  }
  if(k==list[i])
  {
   printf("\nTarget found at %d position",i+1);
   getch();
   exit(1);
  }
  if(k>list[i])
  {
   if(p==1)
	i=0;
   else
   {
	i=i+q;
	p=p-q;
	q=q-p;
   }
  }
}
 printf("\nElement not found");
 getch();
}
/*OUTPUT

Enter the size of list:6

Enter the list:2
4
6
8
10
12

Enter the element to be searched:8

Target found at 4 position
*/











