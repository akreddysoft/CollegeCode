/*PROGRAM TO IMPLEMENT QUICK SORT AND HEAP SORT

  MADHUR AHUJA
  ROLL NO 22
*/
#define max 100
void main()
{
 int ch;
 clrscr();
 printf("\n1 Heap Sort");
 printf("\n2 Quick Sort");
 printf("\n0 Exit");
 printf("\nEnter choice:");
 scanf("%d",&ch);
 switch(ch)
 {
  case 1:
	heap();
	break;
  case 2:
   quick();
   break;
  case 0:
   exit(1);
 }
 getch();
}


 int stk[30],top=-1,b[20];

 readara( )
 {    int i,m;
     printf("Give the number of elements in an array : ");
      scanf("%d",&m);
      for(i=0;i<m;i++)
	{  printf("%d position : ",i);
	   scanf("%d",&b[i]);
	}
     return(m);
 }

 printara( int m)
 {    int i;
     for(i=0;i<m;i++)
	printf("%d\t",b[i]);
 }

 swap(int p,int q)
 {    int temp;
      temp=b[p];
      b[p]=b[q];
      b[q]=temp;
 }

 qsort( int m)
 {    int l,r,e,f;
     push(0);
     push(m-1);
     do{      r = pop( );
	    l = pop( );
	   printf("\n********** after poping  ********\n");
	   printf("left = %d       right  = %d\n",l,r);
	   getch( );
            printf("____________________________________________\n");
	   if( l < r )
	    {  f = l + 1;
	       e = r;
	       do{     while( b[l] > b[f]&& f<=e)
			   f++;
		       while( b[l] < b[e] && f<=e)
			   e--;
		       if( f < e )
			   swap( f , e );
		 }while( f < e );
	       swap( f - 1 , l );
	      printf("Swapping %d position with %d\n", f - 1 , l );
	       printara(m);
	       printf("\n");
	       getch();
	       if( l < f - 2 )
		{   push( l );
		    push( f - 2 );
		}
	      if( f < r )
		{   push(f);
		    push(r);
		 }
	   }
	   }while(!stkempty());
 }

 stkempty( )
 {    return(top==-1);
 }

 push(int val)
 {    top++;
	 stk[top]=val;
 }

 pop( )
 {    top--;
	 return(stk[top+1]);
 }

 quick( )
 {    int n;
	  clrscr();
	  n=readara();
	  qsort(n);
	  printf("\n\n*************** s o r t e d  a r r a y  i s   ...   *******\n");
	  printara(n);
 }


 void heapsort(int stud[],int n)
{
int i,element,h_pos,loc,value;
for(i=1; i<n; i++)
{
 element=stud[i];
 h_pos=i;
 loc=(h_pos-1)/2;
 while(h_pos&&stud[loc]<element)
{
 stud[h_pos]=stud[loc];
 h_pos=loc;
 loc=(h_pos-1)/2;
 }
 stud[h_pos]=element;
 }

 for(i=n-1;i>0; i--)
 {
  value=stud[i];
  stud[i]=stud[0];
  loc=0;
  if(i==1)
  h_pos=-1;
  else
  h_pos=1;
  if( i&&stud[2]>stud[1])
  h_pos=2;
  while((h_pos==0)&&(value<stud[h_pos]))
  {
   stud[loc]=stud[h_pos];
   loc=h_pos;
   h_pos=2*loc+1;
   if(h_pos+1<i-1 && stud[h_pos]<stud[h_pos+1])
   h_pos++;
   if(h_pos>i-1)
   h_pos=-1;
   }
   stud[loc]=value;
   }
   }

   heap()
   {
   int n,i;
   int stud[max];
   int ch;
   do
   {
   clrscr();
   printf("\n enter how many students..");
   scanf("%d",&n);
   if(n>max)
   printf("\n\t\t sorry.. array size is less\n");
   else
   {
   printf("\n\t enter the records of %d students:",n);
   for(i=0; i<n; i++)
   {
	printf("\n enter the roll number");
	scanf("%d",&stud[i]);
	}
	clrscr();
	heapsort(stud,n);
	for(i=0; i<n; i++)
	printf("\n %d",stud[i]);
	printf("\n\t\t do you wish to sort again");
	}
	}
	while(getche()=='y');
	getche();
	}
