#include<conio.h>
#include<stdio.h>
void main()
{
 FILE *fp;
 int i=0,result;
 char pass[10],test[10],ch;
 clrscr();
 gotoxy(28,12);
 printf("旼컴컴컴컴컴컴컴컴컴컴컴커\n");
 gotoxy(28,13);
 printf("쿐nter Password:         �\n");
 gotoxy(28,14);
 printf("읕컴컴컴컴컴컴컴컴컴컴컴켸\n");
 gotoxy(44,13);
 do
 {
  ch=getch();
  pass[i++]=ch;
  printf("*");
 }
 while(i<4);
 pass[i]=0;
 fp=fopen("c:\\madhur.txt","r");
 fgets(test,5,fp);
 result = strcmp(pass,test);
 if(result==0)
 printf("\n\n\nGoto next step");
 else
 printf("\n\nincorrect");
 getch();
}

