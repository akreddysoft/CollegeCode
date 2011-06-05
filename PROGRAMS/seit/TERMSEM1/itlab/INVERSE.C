/////////////////////ASSIGNMENT NO 12///////////////////////
void main()
{
 float a[3][3],h[3][3],d=0.0;
 int i,j,k,l,b,c;
 clrscr();
 puts("Enter the elements of a[3][3] matrix:\n ");
 for(i=0;i<3;i++)
	for(j=0;j<3;j++)
		scanf("%f",&a[i][j]);
 for(i=0;i<3;i++)
	for(j=0;j<3;j++)
	{
	 if(i==0)
	 {
		b=1;
		c=2;
	 }
	 if(i==1)
	 {
		b=0;
		c=2;
	 }
	 if(i==2)
	 {
		b=0;
		c=1;
	 }
	 if(j==0)
	 {
		k=1;
		l=2;
	 }
	 if(j==1)
	 {
		k=0;
		l=2;
	 }
	 if(j==2)
	 {
		k=0;
		l=1;
	 }
	 h[j][i]=a[b][k]*a[c][l]-a[b][l]*a[c][k];
	 if(i==0)
		d=d+a[b][k]*a[c][l]-a[b][l]*a[c][k];
	}
 for(i=0;i<3;i++)
	for(j=0;j<3;j++)
	 h[i][j]=h[i][j]/d;
 puts("THE INVERSE OF THE MATRIX IS AS FOLLOWS");
 for(i=0;i<3;i++)
 {
	puts("\n");
	for(j=0;j<3;j++)
		printf("%9.1f",h[i][j]);
 }
 getch();
}
