void main()
{
int mat[30][30],sp[10][3],spt[10][3],m,n,i,j,nonzero=0,k,l,ncount;
clrscr();
printf("\nEnter the dimensions of the matrix:");
scanf("%d %d",&m,&n);
printf("\nEnter the matrix:");
for(i=0;i<m;++i)
{
	for(j=0;j<n;++j)
		scanf("%d",&mat[i][j]);
}
for(i=0;i<m;++i)
{
	for(j=0;j<n;++j)
		if(mat[i][j]!=0)
			nonzero++;
}

clrscr();
printf("\nThe matrix is:\n");
for(i=0;i<m;++i)
{
	for(j=0;j<n;++j)
		printf("%d\t",mat[i][j]);
	printf("\n");
}
if(nonzero>(m*n-nonzero))
{
	printf("\nnot a sparse matrix");
	getch();
	exit(1);
}
printf("\nSparse Matrix\n");

sp[0][0]=m;	sp[0][1]=n;	sp[0][2]=nonzero;
k=1;

for(i=0;i<m;++i)
{
	for(j=0;j<n;++j)
		if(mat[i][j]!=0)
		{
			sp[k][0]=i;
			sp[k][1]=j;
			sp[k][2]=mat[i][j];
			++k;       //k is equal to no of rows in sp
		}
}
ncount=k;
printf("\n\nRows\t\tColumns\t\tValue\n");
for(i=0;i<k;++i)
{
	for(j=0;j<3;++j)
		printf("%d\t\t",sp[i][j]);
	printf("\n");
}

l=1;
spt[0][0]=n;	spt[0][1]=m;	spt[0][2]=nonzero;

for(i=0;i<n;++i)    //n is columns
	for(j=1;j<ncount;++j)           //k no of nonzero element
		if(sp[j][1]==i)           //ignore the header
		{
			spt[l][0]=sp[j][1];
			spt[l][1]=sp[j][0];
			spt[l][2]=sp[j][2];
			++l;              //l is equal to no. of rows in sp1
		}

printf("\nTranspose");
printf("\n\nColumns\t\tRows\t\tValue\n");
for(i=0;i<k;++i)
{
	for(j=0;j<3;++j)
		printf("%d\t\t",spt[i][j]);
	printf("\n");
}
getch();
}
