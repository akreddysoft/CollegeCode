#include <graphics.h>
int    GraphDriver;		/* The Graphics device driver		*/
int    GraphMode;		/* The Graphics mode value		*/
void DrawCircle(int color,int size,int xpos,int ypos,int boardxpos,int boardypos,int distance);
void DrawSquare(int row,int col,int side);
void initialize(void);
void DrawBoard(int row,int col,int xpos,int ypos,int size);
void initialize(void)
{
  GraphDriver = DETECT; 		/* Request auto-detection	*/
  initgraph( &GraphDriver, &GraphMode, "egavga.bgi" );
  setcolor(14);
//  setbkcolor(3);
}


void DrawCircle(int color,int size,int xpos,int ypos,int boardxpos,int boardypos,int distance)
{
int newxpos=size;
int newypos=size;
xpos*=distance;
ypos*=distance;
xpos+=boardxpos;
ypos+=boardypos;
    setfillstyle(1,color);
    fillellipse(newxpos+xpos,newypos+ypos,size,size);
}
void DrawSquare(int row,int col,int side)
{
rectangle(row,col,side,side);
}
void DrawBoard(int row,int col,int xpos,int ypos,int size)
{
 int i;
 int j;
 for(i=0;i<=col;i++)
 {
  for(j=0;j<=row;j++)
  {
   DrawSquare(size*i+xpos,size*j+ypos,size);
  }
 }
}


