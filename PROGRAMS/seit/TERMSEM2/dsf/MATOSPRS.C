/*Program to find sparse matrix of a given matrix*/
#include<stdio.h>
#include<conio.h>
void main()
{
 int mat[3][3],sprse[10][10];
 int row,col,spr=0,count=0,sprow;
 clrscr();
 printf("Enter the elements of the matrix\n");
 for(row=0;row<3;row++)
  {
   for(col=0;col<3;col++)
    scanf("%d",&mat[row][col]);
  }
 printf("The matrix entered is\n");
 for(row=0;row<3;row++)
  {
   for(col=0;col<3;col++)
    printf("\t%d\t",mat[row][col]);
   printf("\n");
  }
 for(row=0;row<3;row++)
  {
   for(col=0;col<3;col++)
    {
     if(mat[row][col]!=0)
       count++;
    }
  }
 printf("\nThe number of non-zero elements are %d\n",count);
 sprow=count+1;
 printf("The order of the sparse matrix is %d*%d",sprow,col);
 spr=0;
 sprse[spr][0]=row;
 sprse[spr][1]=col;
 sprse[spr][2]=sprow;
 spr++;
 for(row=0;row<3;row++)
  {
   for(col=0;col<3;col++)
    {
     if(mat[row][col]!=0)
      {
       sprse[spr][0]=row;
       sprse[spr][1]=col;
       sprse[spr][2]=mat[row][col];
       spr++;
      }
    }
  }
 printf("\nThe sparse matrix of the given matrix is \n");
 for(row=0;row<spr;row++)
  {
   for(col=0;col<3;col++)
    printf("\t%d\t",sprse[row][col]);
   printf("\n");
  }
 getch();
}
