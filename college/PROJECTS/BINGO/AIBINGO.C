/*
 programmed by Ritchie Roi Chua
 date submitted:feb 17,1998
 submitted to: Mr. Reginald Cheng
 subjectL: DASTRUC
 description:a thinking bingo chess exhibits the use
	     of multi dimensional array
 dedicated to: Mary dee happy tecson
  for comments or suggestion
  pls email me at devilroi@cyberdude.com
*/

#include <stdio.h>
#include <conio.h>
#include <dos.h>
#include <mem.h>
#include "board.h"
#define MAXROW 9
#define MAXCOL 7
#define MINPAT 3
#define blocx 40
#define blocy 40
#define piece 40
#define p 20

/*function declaration area*/
//2void valboard(int x[MAXCOL][MAXROW]);
void gamedata(int *rowptr,int *colptr,int *winptr);
void disboard(int row);
int game(int row,int col,int winnum);
void clear(void);
int checkwin(int r2,int c2,int board2[MAXCOL][MAXROW],int playin,int winnum);

/*beginning of program*/
void main(void)
{
 int row=0;
 int col=0;
 int win;
 int winnum=0;
 int gam=0;
 char choice=' ';
 while(gam==0)
 {
  clrscr();
  fflush(stdin);
  initialize();
  gamedata(&row,&col,&winnum);
  initialize();
  disboard(row);
  DrawBoard(col,row,blocx,blocy,piece);
  win=game(row,col,winnum);
  switch(win)
  {
   case 1:
    printf("player 1 wins\n");
    break;
   case 2:
    printf("player 2 wins\n");
    break;
   case 3:
    printf("its a draw\n");
  }
  printf("do you want to play another game y/n");
  fflush(stdin);
  scanf("%c",&choice);
  printf("%c",choice);
  if ((choice!='y')&&(choice!='Y'))
  break;
 }
}

void disboard(int row)
{
 int i;
 int x=5;
 for (i=1;i<=row;i++)
 {
  gotoxy(i+x,1);
  printf("%d",i);
  x+=4;
 }
}

int game (int row,int col,int winnum)
{
static int board[MAXCOL][MAXROW];
 int randomer;
 int checkval;
 int comshot;
static int legal[MAXROW];
 int lrow,lcol,i,j;
 int r1=row;
 int maxmove;
 int sw=0;
 int win;
 int ctrtie=0;
 int gam=0;
 memset(legal,0,sizeof(legal));
 memset(board,0,sizeof(board));
 for (i=0;i<row;i++)
 {
  legal[i]=col-1;
 }
 maxmove=row*col;
 while (gam==0)
 {
   while(sw==0)
   {
    gotoxy(1,p);
    printf("Player 1\n");
    printf("Enter a row");
    scanf("%d",&lrow);
    lrow--;
    if ((lrow<r1)&&(legal[lrow]>=0)&&(lrow>=0))
    {
     board[legal[lrow]][lrow]=1;
     DrawCircle(5,piece/2,lrow,legal[lrow],blocx,blocy,piece);
     clear();
     win=checkwin(lrow,legal[lrow],board,1,winnum);
     legal[lrow]--;
     ctrtie++;
     if (win==1)
      return 1;
     else
      break;
    }
    else
    {
     printf("invalid input\n");
     getch();
     clear();
    }
  }
  clear();
  if (ctrtie==maxmove)
  {
   break;
  }
  /*this is my AI area*/
  /*choose a stupid shot*/
  for (randomer=0;randomer<row;randomer++)
  {
   if (legal[randomer]>=0)
   {
    comshot=randomer;
    break;
   }
  }
  /*check if he can block the shot*/
  for (randomer=0;randomer<row;randomer++)
  {
  if (legal[randomer]>=0)
  {
   board[legal[randomer]][randomer]=1;
   checkval=checkwin(randomer,legal[randomer],board,1,winnum);
   if (checkval==1)
   {
    comshot=randomer;
    board[legal[randomer]][randomer]=0;
    break;
   }
   }
    board[legal[randomer]][randomer]=0;
  }
  /*check for possible win*/
  for (randomer=0;randomer<row;randomer++)
  {
   board[legal[randomer]][randomer]=2;
   checkval=checkwin(randomer,legal[randomer],board,2,winnum);
   if (legal[randomer]>=0)
   {
   if (checkval==1)
   {
    comshot=randomer;
    board[legal[randomer]][randomer]=0;
    break;
   }
   }
   board[legal[randomer]][randomer]=0;
   }
   board[legal[comshot]][comshot]=2;
   DrawCircle(1,piece/2,comshot,legal[comshot],blocx,blocy,piece);
   clear();
   win=checkwin(comshot,legal[comshot],board,2,winnum);
   legal[comshot]--;
 ctrtie++;
   if (win==1)
   {
    return 2;
   }
   if (ctrtie==maxmove)
   {
     break;
   }
}
return 3;
}

/*to clear the screen*/
void clear(void)
{
 int i;
 for (i=1;i<=4;i++)
 {

  gotoxy(1,p+i);
  printf("                    ");
 }
 gotoxy(1,p);
}


/*function checkwin
to check for a win
*/
int checkwin(int r2,int c2,int board2[MAXCOL][MAXROW],int playin,int winnum)
{
 int i;
 int win[4];
 int holdboard;
 int col=c2;
 int row=r2;
 memset(win,0,sizeof(win));
 win[0]=1;
 /*horizontal win area*/
 holdboard=board2[c2][r2];
 while(holdboard==playin)
 {
  col++;
  holdboard=board2[col][r2];
  win[0]++;
 }
 /*reset variables*/
 holdboard=board2[c2][r2];
 row=r2;
 col=c2;
 /*vertical win area*/
 holdboard=board2[c2][r2];
 while (holdboard==playin)
 {
  row--;
  holdboard=board2[c2][row];
  win[1]++;
 }
 /*reset variables*/
 holdboard=board2[c2][r2];
 row=r2;
 while (holdboard==playin)
 {
  row++;
  holdboard=board2[c2][row];
  win[1]++;
 }
 /*end of vertical area*/

 /*reset variables*/
 holdboard=board2[c2][r2];
 row=r2;
 col=c2;
 /*diagonal1 area*/
 while (holdboard==playin)
 {
  row--;
  col--;
  holdboard=board2[col][row];

  win[2]++;

 }
 /*reset variables*/
 holdboard=board2[c2][r2];
 row=r2;
 col=c2;
 while (holdboard==playin)
 {
  row++;
  col++;
  holdboard=board2[col][row];
   win[2]++;
 }
 /*reset variables*/
 holdboard=board2[c2][r2];
 row=r2;
 col=c2;

 /*diagonal 2*/
 while (holdboard==playin)
 {
  row++;
  col--;
 holdboard=board2[col][row];
  win[3]++;
}
 /*reset variables*/
 holdboard=board2[c2][r2];
 row=r2;
 col=c2;

 while (holdboard==playin)
 {
 row--;
 col++;
 win[3]++;
 holdboard=board2[col][row];
 }

 for (i=0;i<4;i++)
 {
  if (win[i]-1>=winnum)
  {
   return 1;
   }
 }
 return 0;
}

/*function gamedata
*/
void gamedata(int *rowptr,int *colptr,int *winptr)
{
 int sw=0;
 while (sw==0)
 {
  printf("Enter maximum Row\n");
  scanf("%d",&(*rowptr));
  if ((*rowptr>=3)&&(*rowptr<MAXROW))
   break;
  else
  {
   printf("invalid input\n ");
   printf("row must be greater than or equal to 3 and not greater than %d\n",MAXROW-1);
  }
}
while (sw==0)
{
 printf("Enter maximum Column\n");
 scanf("%d",&(*colptr));
 if ((*colptr>=3)&&(*colptr<MAXCOL))
  break;
 else
 {
  printf("invalid input\n ");
  printf("row must be greater than or equal to3 and not greater than %d\n",MAXCOL-1);
 }
}
while(sw==0)
{
 printf("Enter no. of patterns to win\n");
 scanf("%d",&(*winptr));
 if (((*winptr<=*rowptr)||(*winptr<=*colptr))&&(*winptr>=MINPAT))
  break;
 else
 {
  printf("invalid input\n ");
  printf("number of pattern must be less than row or col and \n");
  printf("not less than %d\n",MINPAT);
 }
}
}














