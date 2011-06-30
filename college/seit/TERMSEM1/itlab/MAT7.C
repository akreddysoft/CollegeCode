//PROGRAM TO  ACCEPT 3X3 MATRIX AND DISPLAY ADDITION,SUBTRACTION,MULTIPLICATION
void dispmat(int[3][3]);
void main()
{
 int  mat1[3][3],mat2[3][3],mat3[3][3],i,j,choice,k;
 clrscr();
 printf("1 Addition\n");
 printf("2 Subtraction\n");
 printf("3 Multiplication\n");
 do
 {
	printf("Enter the choice:");
	scanf("%d",&choice);
	printf("%s","Enter the matrix:\n");
	for(i=0;i<3;++i)
	{
	 for(j=0;j<3;++j)
		scanf("%d",&mat1[i][j]);
	}
	printf("%s","Enter the matrix:\n");
	for(i=0;i<3;++i)
	{
	 for(j=0;j<3;++j)
		scanf("%d",&mat2[i][j]);
	}
	switch(choice)
	{
	 case 1:
	 for(i=0;i<3;++i)
	 {
		for(j=0;j<3;++j)
		 mat3[i][j]=mat1[i][j]+mat2[i][j];
	 }
	 dispmat(mat3);
	 break;

	 case 2:
	 for(i=0;i<3;++i)
	 {
		for(j=0;j<3;++j)
		 mat3[i][j]=mat1[i][j]-mat2[i][j];
	 }
	 dispmat(mat3);
	 break;

	 case 3:
	 for(i=0;i<3;++i)
	 {
		for(j=0;j<3;++j)
		{
		 mat3[i][j]=0;
		 for(k=0;k<3;++k)
			mat3[i][j]=mat3[i][j]+mat1[i][k]*mat2[k][j];
		}
	 }
	 dispmat(mat3);
	 break;
	}
	printf("\nDo you want to continue(y/n):");
 }
 while(getch()=='y');
}

void dispmat(int mat[3][3])
{
 int i,j;
 printf("The result is:\n");
 for(i=0;i<3;++i)
 {
	for(j=0;j<3;++j)
		printf("%d   ",mat[i][j]);
	printf("\n");
 }
}

