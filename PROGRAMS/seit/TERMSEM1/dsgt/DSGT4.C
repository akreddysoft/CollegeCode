//ASSIGNMENT NO4
void ld();
void rd();
void displayl(int);
void displayr(int);
void displayu(char);
void main()
{
 int a[20],i,n,j,s,b;
 clrscr();
 printf("Enter no of elements:");
 scanf("%d",&n);
 printf("Enter the elements:\n");
 for(i=0;i<n;i++)
	scanf("%d",&a[i]);
 for(i=0;i<n-1;i++)
 for(j=0;j<n-1-i;j++)
 if(a[j]>a[j+1])
 {
	s=a[j];
	a[j]=a[j+1];
	a[j+1]=s;
 }
 printf("\nThe sorted elements are\n ");
 for(i=0;i<n;i++)
 printf("   %d",a[i]);
 getch();
 b=a[0];
 gotoxy(25,24);
 for(i=1;i<n;i++)
 {
	displayl(b);
	ld();
	displayr(a[i]);
	rd();
	b=b+a[i];
 }
 printf("%d",b);
 getch();
}

void ld()
{
 int x,y;
 x=wherex();y=wherey();
 gotoxy(x,y-1);
 displayu('/');
 gotoxy(x+1,y-2);
 displayu('/');
 gotoxy(x+5,y);
}
void rd()
{
 int x,y;
 x=wherex();
 y=wherey();
 gotoxy(x-2,y-1);
 displayu('\\');
 gotoxy(x-3,y-2);
 displayu('\\');
 gotoxy(x-4,y-3);
}
void displayr(int a)
{
 int x,y,i;
 x=wherex();
 y=wherey();
 for(i=79;i>=x;i--)
 {
	gotoxy(i,y);
	printf("%d ",a);
 }
 gotoxy(x+1,y);
}
void displayl(int a)
{
 int x,y,i;
 x=wherex();
 y=wherey();
 for(i=1;i<x;i++)
 {
	gotoxy(i,y);
	printf(" %d",a);
 }
 gotoxy(x+1,y);
}
void displayu(char a)
{
 int x,y,i;
 x=wherex();
 y=wherey();
 for(i=1;i<y;i++)
 {
	gotoxy(x,i);
	printf(" ");
	gotoxy(x,i+1);
	printf("%c",a);
 }
}
/*OUTPUT
Enter no of elements:5
Enter the elements:
8
5
3
2
6

The sorted elements are
		2   3   5   6   8

																		24
																	 / \
																	/   \
																 16    8
																/ \
															 /   \
															10    6
														 / \
														/   \
													 5     5
													/ \
												 /   \
												2     3

*/
