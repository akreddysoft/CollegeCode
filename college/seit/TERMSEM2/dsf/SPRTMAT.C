/*Program to find orginal matrix from the given sparse matrix*/
#include<stdio.h>
#include<conio.h>
void main()
{
 int sprse[10][3],mat[3][3];
 int spr,row,col,matrow,matcol;
 clrscr();
 for(row=0;row<3;row++)
  {
   for(col=0;col<3;col++)
    mat[row][col]=0;
  }
 printf("Enter the number of rows of the sparse matrix ");
 scanf("%d",&spr);
 printf("\nThe order of the sparse matrix is %d*3\n",spr);
 printf("Enter the elements of the sparse matrix\n");
 for(row=0;row<spr;row++)
  {
   for(col=0;col<3;col++)
    scanf("%d",&sprse[row][col]);
  }
 matrow=sprse[0][0];
 matcol=sprse[0][1];
 printf("The order of the required matrix is %d*%d\n",matrow,matcol);
 for(row=1;row<spr;row++)
  {
   matrow=sprse[row][0];
   matcol=sprse[row][1];
   mat[matrow][matcol]=sprse[row][2];
  }
 printf("The orginal matrix is \n");
 for(matrow=0;matrow<3;matrow++)
  {
   for(matcol=0;matcol<3;matcol++)
    printf("\t%d\t",mat[matrow][matcol]);
   printf("\n");
  }
 getch();
}