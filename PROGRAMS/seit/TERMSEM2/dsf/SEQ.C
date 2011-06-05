/*****************************************
 PROGRAM TO SEARCH USING SEQUENTIAL SEARCH
 NAMEE : MADHUR AHUJA
 ROLL NO. 22
*****************************************/
void main()
{
 int list[20];
 int flag,temp,i,x,n;
 clrscr();
 printf("\nEnter the size of the list:");
 scanf("%d",&n);
 printf("\nEnter the list is:");
 for(i=0;i<n;++i)
  scanf("%d",&list[i]);
 printf("\nEnter the element to search:");
 scanf("%d",&x);
 for(i=0;i<n;++i)
 {
  if(x==list[i])
  {
   flag=1;
   printf("\nElement found at %d position",i+1);
  }
 }
 if(!flag)
 printf("\nElement not found");
 getch();
}
/*OUTPUT

Enter the size of the list:5

Enter the list is:1
2
2
3
4

Enter the element to search:2

Element found at 2 position
Element found at 3 position
*/











