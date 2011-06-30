/* PROGRAM TO SEARCH USING BINARY SEARCH*/
void binary(int list[20],int,int,int x);
void main()
{
 int list[20],i,n,x;
 clrscr();
 printf("\nEnter the size:");
 scanf("%d",&n);
 printf("\nEnter the list:");
 for(i=0;i<n;++i)
  scanf("%d",&list[i]);
 printf("\nEnter the element to be searched:");
 scanf("%d",&x);
 binary(list,0,n-1,x);
 getch();
}
void binary(int list[20],int first,int last,int x)
{
 int flag=0;
 int middle=(first+last)/2;
 if(first<=last&&!flag)
 {
  if(x==list[middle])
  {
	 printf("\nTarget at found at %d position",middle+1);
	 getch();
	 exit(0);
  }
  if(x<list[middle])
   last=middle-1;
  if(x>list[middle])
   first=middle+1;

  middle=(first+last)/2;
  binary(list,first,last,x);
 }
 if(!flag)
  printf("\nTarget not found");
}

