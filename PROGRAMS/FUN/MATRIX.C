#include<stdio.h>
#include<dos.h>
#include<stdlib.h>
#include<time.h>
void dispmat(int [4][4]);
void init(int mat[4][4]);
void getkey();
void main()
{
 static	int mat[4][4],i,j;
 clrscr();
 init(mat);
// dispmat(mat);
 getch();
}



void init(int mat[4][4])
{
 int i,j,k;
	randomize();
 for(i=0;i<4;++i)
 {

	for(j=0;j<4;++j);
	{
		mat[i][j]=rand()%10;
	}
 }
 for(i=0;i<4;++i)
 {
	for(j=0;j<4;++j)
	printf("%d  ",mat[i][j]);
	printf("\n");
 }

}
void dispmat(int mat[4][4])
{
 int i,j,k=9;
 for(i=0;i<4;++i)
 {
	gotoxy(25,k=k+2);
	for(j=0;j<4;++j)
	 printf("%d        ",mat[i][j]);
	 printf("\n");
 }
}