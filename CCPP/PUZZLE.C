#include<stdio.h>
#include<stdlib.h>
#include<graphics.h>
#define ROWINDEX 8
#define COLINDEX 8
/*int matrix[8][8]=	{ 0,1,0,0,0,0,1,0,
					  1,1,1,0,1,0,1,1,
					  1,1,1,1,1,0,0,0,
					  0,0,1,0,1,0,1,1,
					  1,1,1,1,1,0,1,1,
					  0,0,0,0,1,0,0,0,
					  1,1,0,0,1,1,1,1,
					  0,1,0,1,0,0,0,0
					};*/

int matrix[8][8]=	{ 0,0,0,0,0,0,1,0,
					  1,1,1,0,1,0,1,1,
					  1,1,0,1,1,0,0,0,
					  0,0,1,0,1,0,1,1,
					  1,1,1,1,1,0,1,1,
					  0,0,0,0,1,0,0,0,
					  1,1,0,0,1,1,1,1,
					  0,1,0,1,0,0,0,0
					};
int flag=0;
int path[100],pathindex=0;

int main()
{

	int start[]={1,1};
	int path[8][8];
	int i,j,k;
	clrscr();
	func(start[0],start[1]);
	return EXIT_SUCCESS;
}


func(int row,int col)
{
	int col1=col+1;
	int i=0;

	if(col==7)
	{
		for(i=0;i<pathindex;i=i+2)
		{
			printf("%d %d\n",path[i],path[i+1]);
		}
		printit();
		exit(1);
	}


	if(matrix[row][col1]==1)
	{
		path[pathindex++]=row;
		path[pathindex++]=col1;
		func(row,col1);
	}

	if(matrix[row][col1]==0)
	{
		if(row==start[0]&&col==start[1])
			func(
		else
			func(++row,--col);

	return 0;
}

int printit()
{
	int i,j,res;
	for(i=0;i<COLINDEX;++i)
	{
		for(j=0;j<ROWINDEX;++j)
		{
			if(matrix[i][j]==0)
				printf("0 ");
			else
			{
				if(checkinpath(i,j))
					printf("* ");

				else
					printf("1 ");
			}
		}
		printf("\n");
	}

	return 0;
}

int checkinpath(int row,int col)
{
	int i;
	for(i=0;i<pathindex;i=i+2)
	{
		if(row==path[i]&&col==path[i+1])
			return 1;
		else
			continue;
	}
	return 0;
}