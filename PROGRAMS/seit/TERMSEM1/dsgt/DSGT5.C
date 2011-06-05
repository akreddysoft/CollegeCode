//ASSIGNMENT NO5
void ld();
void rd();
void displayl(int);
void displayr(int);
void displayu(char);
int ct;
void main()
{
 int a[20],i,n,j,s,b;
 clrscr();
 printf("Enter no of elements:");
 scanf("%d",&n);
 ct=n-2;
 printf("Enter the elements:\n");
 for(i=0;i<n;i++)
	scanf("%d",&a[i]);
 for(i=0;i<n-1;i++)
	for(j=0;j<n-1-i;j++)
	if(a[j]>a[j+1])
	{
	s=a[j];a[j]=a[j+1];a[j+1]=s;}
	printf("\nTHE SORTED ELEMENTS ARE\n ");
 for(i=0;i<n;i++)
	printf(" %d",a[i]);
 getch();
 b=a[0];
 gotoxy(25,24);
 for(i=1;i<n;i++)
 {
	delay(50);
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
 int x,y,i;
 x=wherex();
 y=wherey();
 gotoxy(x,y-1);
 displayu('/');
 printf("\b\b)");
 for(i=0;i<=ct;i++)
 {
	printf("\b\b");
	printf("0");
 }
 printf("\b\b(");
 gotoxy(x+1,y-2);
 displayu('/');
 gotoxy(x+5,y);
}

void rd()
{
 int x,y,i;
 x=wherex();
 y=wherey();
 gotoxy(x-2,y-1);
 displayu('\\');
 printf("(");
 for(i=0;i<ct;i++)
 printf("0");
 printf("1");
 printf(")");
 ct--;
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
Enter no of elements:4
Enter the elements:
1
2
3
4

THE SORTED ELEMENTS ARE
	1 2 3 4





																 10
																/ \
														(0)/   \(1)
															6     4
														 / \
												(00)/   \(01)
													 3     3
													/ \
										(000)/   \(001)
												1     2

*/