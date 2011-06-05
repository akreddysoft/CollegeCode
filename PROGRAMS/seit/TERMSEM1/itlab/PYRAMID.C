void main()
{
 int i,x,j,k;
 clrscr();
 for(i=0;i<=10;++i)////to print no.of lines in pyr
 {
	for(x=0;x<=40-i;x++) //to print spaces in decreasing order
	 printf(" ");
	for(j=i;j<2*i;j++)
	 printf("%d",j%10);
	for(k=2*i-2;k>=i;k--)
	 printf("%d",k%10);
	printf("\n");
 }
 getch();
}