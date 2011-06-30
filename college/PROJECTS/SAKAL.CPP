/*                              ASSINGMENT NO .1
			 PROJECT FOR QUATION MANAGEMENT
						    PROGRAMMER
						    - VISHAL V.MANE ROLL NO.23
						    - RAHUL  PAWAR  ROLL NO.35
						      S.E.I.T
						      IT-LAB-2



*/
#include<iostream.h>
#include<conio.h>
#include<process.h>
#include<dos.h>
#include<stdio.h>
#include<string.h>
#include<graphics.h>

   FILE *fp,*ft;
   char another,choice;
   struct quation
   {
	 char qname[10];
	 char qspeci1[10],iname1[10];
	 char qspeci2[10],iname2[10];
	 char qspeci3[10],iname3[10];
	 char qspeci4[10],iname4[10];
	 char qspeci5[10],iname5[10];
	 long int total;
	 int price1,icode1,quantity1;
	 int price2,icode2,quantity2;
	 int price3,icode3,quantity3;
	 int price4,icode4,quantity4;
	 int price5,icode5,quantity5;
   }e;
  long int recsize=sizeof(e);
  char qqname[10];

void  line_hor(int column1,int column2, int row, char c)
 {

	for ( column1; column1<=column2; column1++ )
	{
		gotoxy(column1,row);
		printf("%c",c);
	}
 }
//**********************************************************
// FUNCTION TO DRAW VERTICAL LINE
//**********************************************************

void line_ver(int row1, int row2, int column, char c)
{
	for ( row1; row1<=row2; row1++ )
	{
		gotoxy(column,row1);
		printf("%c",c);
	}
}
//**********************************************************
// FUNCTION TO DRAW BOX LINE
//**********************************************************
void box(int column1, int row1, int column2, int row2, char c)
{
	char ch=218 ;
	char c1, c2, c3, c4;
	char l1=196, l2=179;
	if (c == ch)
	{
		c1=218;
		c2=191;
		c3=192;
		c4=217;
		l1=196;
		l2=179;
	}
	else
	{
		c1=c;
		c2=c;
		c3=c;
		c4=c;
		l1=c;
		l2=c;
	}
	gotoxy(column1,row1) ;
	printf("%c",c1) ;
	gotoxy(column2,row1) ;
	printf("%c",c2);
	gotoxy(column1,row2) ;
	printf("%c",c3);
	gotoxy(column2,row2) ;
	printf("%c",c4);
	column1++ ;
	column2-- ;
	line_hor(column1,column2,row1,l1) ;
	line_hor(column1,column2,row2,l1) ;
	column1-- ;
	column2++ ;
	row1++ ;
	row2-- ;
	line_ver(row1,row2,column1,l2) ;
	line_ver(row1,row2,column2,l2) ;
}
//**********************************************************
void index()
{
		box(10,5,71,21,219) ;
		box(9,4,72,22,218) ;
		gotoxy(32,7) ;
		_setcursortype(_SOLIDCURSOR);
		cprintf(" Q U A T I O N ") ;
		gotoxy(35,9) ;
		cprintf(" OPTIONS ") ;
		textcolor(LIGHTGRAY) ;
		textbackground(BLACK) ;
		gotoxy(30,11) ;
		printf("1:READY QUATATION") ;
		gotoxy(30,12) ;
		printf("2:ADD Quation ") ;
		gotoxy(30,13) ;
		printf("3:DISPLAY ");
		gotoxy(30,14) ;
		printf("4:MODIFY QUATION ") ;
		gotoxy(30,15) ;
		printf("5:DELETE QUATION") ;
		gotoxy(30,16) ;
		printf("6:HELP ") ;
		gotoxy(30,17) ;
		printf("7:SEARCH QUATION") ;
		gotoxy(30,18);
		printf("8:ABOUT US") ;
		gotoxy(30,19) ;
		printf("9: EXIT ");

}
void  help(void)
{
  clrscr() ;
  box(2,1,79,25,218) ;
  box(25,2,54,4,219) ;
  textcolor(LIGHTGRAY+BLINK) ;
  gotoxy(30,3); cprintf("WELCOME TO PROJECT ") ;
  textcolor(LIGHTGRAY) ;
  delay(10) ;
  gotoxy(10,7);  printf("  -  IN THIS PROJECT WE CAN KEEP NUMBER OF RECORDS OF QUATION ") ;
  delay(10) ;
  gotoxy(10,9);  printf("  -  FIRST OPTION IS AN EXAMPLE OF QUATION  ");
  delay(10) ;
  gotoxy(10,11); printf("  -  SECOND OPTION IS FOR CREATING AN OWN QUATION ") ;
  delay(10) ;
  gotoxy(10,13); printf("  -  THIRD OPTION IS FOR DISPLAYING THE EXITING QUATION  ") ;
  delay(10) ;
  gotoxy(10,15); printf("  -  FOURTH OPTION IS FOR MODIFING AN EXITING QUATION RECORD ") ;
  delay(10) ;
  gotoxy(10,17); printf("  -  FIFTH OPTION IS FOR DELETING UNWANTED RECORDS ") ;
  delay(10) ;
  gotoxy(10,19); printf("  -  SIXTH OPTION IS FOR RETURN TO HELP ") ;
  delay(10) ;
  gotoxy(10,21); printf("  -  SEVENTH OPTION IS FOR SEARCHING THE EXITING RECORDS  ") ;
  delay(10) ;
  gotoxy(10,23); printf("  -  SO FIRST CREAT YOUR OWN QUATION WITH HELP OF EXAMPLE   ") ;
  delay(10) ;
  textcolor(BLACK+BLINK) ; textbackground(WHITE) ;
  gotoxy(26,25) ; cprintf(" Press any key to continue ") ;
  textcolor(LIGHTGRAY) ; textbackground(BLACK) ;
  gotoxy(25,2) ;
  getch() ;
  for (int i=25; i>=1; i--)
  {
	delay(20) ;
	gotoxy(1,i) ; clreol() ;
  }
}
void ABOUT()
{
  box(2,1,79,25,218);
  textcolor(BLACK+BLINK) ;  textbackground(WHITE) ;
  gotoxy(27,3); cprintf("  WELCOME TO PROJECT ") ;
  textcolor(LIGHTGRAY) ;
  delay(10) ;
  gotoxy(20,5);  printf("    THANK YOU FOR USING OUR RROJECT") ;
  delay(10) ;
  gotoxy(20,7);  printf("*******THIS PROJECT IS DEVELOPED BY*******") ;
  delay(10) ;
  gotoxy(25,9);  printf("................................... ") ;
  delay(10) ;
  gotoxy(25,11); printf(">>>>>>>   VISHAL  MANE ") ;
  delay(10) ;
  gotoxy(25,13); printf("------    S.E.I.T.  ROLL NO - 23 ") ;
  delay(10) ;
  gotoxy(25,15); printf(".................................... ") ;
  delay(10) ;
  gotoxy(25,17); printf(">>>>>>>   RAHUL PAWAR ") ;
  delay(10) ;
  gotoxy(25,19); printf("------    S.E.I.T.  ROLL NO - 35 ") ;
  delay(10) ;
  gotoxy(25,21); printf("................................... ") ;
  delay(10) ;
  gotoxy(12,23); printf("  WHICH IS FIRST PROJECT OF D.B.M.S. IN B.V.D.U.C.O.E. PUNE") ;
  delay(10) ;
  textcolor(BLACK+BLINK) ; textbackground(WHITE) ;
  gotoxy(26,25) ;cprintf(" Press any key to continue ") ;
  textcolor(LIGHTGRAY) ; textbackground(BLACK) ;
  gotoxy(25,2) ;
  getch() ;
  for (int i=25; i>=1; i--)
  {
	delay(20) ;
	gotoxy(1,i) ; clreol() ;
  }
}

void compaq()
{
  box(2,1,79,25,218);
  textcolor(BLACK+BLINK) ;  textbackground(WHITE) ;
  gotoxy(30,2); cprintf("  COMPAQ   ") ;
  textcolor(LIGHTGRAY) ;
  delay(10) ;
  gotoxy(10,5);  printf("MODEL: Presario 3353 Quick Specs ") ;
  delay(10) ;
    gotoxy(5,8);printf("  NO ITEM CODE  ITEM NAME             SPECIFICATION ");
    gotoxy(5,10);printf("  1]    1001     PROCESSOR      :  AMD ATHLON-1.8 Ghz") ;
    delay(10) ;
    gotoxy(5,11);printf("  2]    1002     HARD DISK      :  40 GB Ultra DMA Hard drive") ;
    delay(10) ;
    gotoxy(5,12);printf("  3]    1003     CD-ROM         :  52*CD-ROM DERIVE") ;
    delay(10) ;
    gotoxy(5,13);printf("  4]    1004     AX\MODEM        :  56KbpsITU V.90 DATA\FAX MODEM") ;
    delay(10) ;
    gotoxy(5,14);printf("  5]    1005     KEYBOARD       :  2Tone Carbon\Silver-windows keyboard ") ;
    delay(10) ;
    gotoxy(5,15);printf("  6]    1006     MONITOR        :  MV5500[15'']-Digital Colour Monitor");
    delay(10) ;
    gotoxy(5,16);printf("  7]    1007     MOUSE          :  Internet Scroll Mouse") ;
    delay(10) ;
    gotoxy(5,17);printf("  8]    1008     SPEAKERS       :  JBL Platinum Speakers") ;
    delay(10) ;
    gotoxy(5,18);printf(" 10]    1009     SOUIND CARD    :  NVIDIA TNT 32 MB AGP CARD " ) ;
  delay(10) ;
    gotoxy(5,19);printf(" 11]    1010     VIDEO CARD     :  Dynamic allocation MPEG2  ") ;
    delay(10) ;
    gotoxy(5,20);printf(" 12]    1011     RAM            :  128 MB PC 2100 DDR SDRAM  ") ;
     delay(10) ;
     gotoxy(5,21); line_hor(3,78,21,196);
     gotoxy(10,22); printf("TOTAL =                 Rs.  45,000/-");
     textcolor(BLACK+BLINK) ; textbackground(WHITE) ;
     gotoxy(26,25) ; cprintf(" Press any key to continue ") ;
     textcolor(LIGHTGRAY) ; textbackground(BLACK) ;
     gotoxy(25,2) ;
     getch() ;
     for (int i=25; i>=1; i--)
     {
	delay(20) ;
	gotoxy(1,i) ; clreol() ;
     }
}
void passward()
{
 int i,flag,j=1;
 char a[4],b[4]={ "vish" },ch;
 clrscr();
 sos:
 gotoxy(23,12);
 printf("旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴커");
 gotoxy(23,13);
 printf("� ENTER THE PASSWORD:          �");
 gotoxy(23,14);
 printf("읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸");
 gotoxy(45,13);
 for(i=0;i<4;i++)
 {
	ch=getch();
	a[i]=ch;
	printf("*");
 }
 for(i=0;i<4;i++)
 {
	if(a[i]==b[i])
	flag=0;
	else
	{   flag=1;
	break;
	}
 }
   if(flag==0)
   printf("\n\n\n\t                   WELCOME TO PROJECT");
   else
   {  printf("\n\n\n\t                Tryyyyyyyy   againnnnnnn");
	  j++;
	  getch();
	  clrscr();
	  if(j==4)
	  {
	 gotoxy(20,20);
	 printf("\n\n              Byeeeeeeee...... ",j);
	 getch();
	 exit(0);
	  }
	   goto sos;
   }
 getch();
}



void delete1()
{
  fp=fopen("kkk.dat","rb+");
  if(fp==NULL)
  {
   fp=fopen("kkk.dat","wb+");
     if(fp==NULL)
     {
      puts("cannot open file ");
      exit(0);
     }
  }
	 another='y';
	 while(another =='y')
	 {
	   printf("enter a name of quation to delete :");
	   scanf("%s",qqname);
	   ft=fopen("TEMP.DAT","wb");
	   rewind(fp);
	   while(fread(&e,recsize,1,fp)==1)
		{
		  if(strcmp(e.qname,qqname)!=0)
		  fwrite(&e,recsize,1,ft);
			}

		fclose(fp);
		fclose(ft);

		remove("kkk.dat");
		rename("TEMP.DAT","kkk.dat");

		fp=fopen("kkk.dat","rb+");
		printf("\n record is successfully deleted  ");
		printf("\n\n do you want to delete another record(y\n)");
		fflush(stdin);
		another =getche();
	  }

	}






void modify()
    {

      fp=fopen("kkk.dat","rb+");

      if(fp==NULL)
      {
	  fp=fopen("kkk.dat","wb+");
	  if(fp==NULL)
       {
	puts("cannot open file ");
	exit(0);
       }
      }
	clrscr();
	int i=0;
	another ='y';

	while(another=='y')
	{
		printf("\n\n ENTER THE NAME OF QUATATION TO MODIFY: ");
		scanf("%s",qqname);
		rewind(fp);
	while(fread(&e,recsize,1,fp)==1)
	{
	  if(strcmp(e.qname,qqname)==0)
	  {

		printf("\n\n ENTER THE NEW NAME OF QUATATION: ");
		scanf("%s",&e.qname);
		printf("\n\n ENTER THE ITEM CODE:");
		scanf("%ld",&e.icode1);
		printf("\n\n ENTER THE ITEM NAME:");
		scanf("%s",&e.iname1);
		printf("\n\n ENTER THE SPECIFICATION: ");
		scanf("%s",&e.qspeci1);
		printf("\n\n ENTER THE TOTAL QUANTITY OF ITEM:");
		scanf("%d",&e.quantity1);
		printf("\n\n ENTER THE PRICE OF SINGLE ITEM:");
		scanf("%ld",&e.price1);

		printf("\n\n ENTER THE NEW NAME OF QUATATION: ");
		scanf("%s",&e.qname);
		printf("\n\n ENTER THE ITEM CODE:");
		scanf("%ld",&e.icode2);
		printf("\n\n ENTER THE ITEM NAME:");
		scanf("%s",&e.iname2);
		printf("\n\n ENTER THE SPECIFICATION: ");
		scanf("%s",&e.qspeci2);
		printf("\n\n ENTER THE TOTAL QUANTITY OF ITEM:");
		scanf("%d",&e.quantity2);
		printf("\n\n ENTER THE PRICE OF SINGLE ITEM:");
		scanf("%ld",&e.price2);

		printf("\n\n ENTER THE NEW NAME OF QUATATION: ");
		scanf("%s",&e.qname);
		printf("\n\n ENTER THE ITEM CODE:");
		scanf("%ld",&e.icode3);
		printf("\n\n ENTER THE ITEM NAME:");
		scanf("%s",&e.iname3);
		printf("\n\n ENTER THE SPECIFICATION: ");
		scanf("%s",&e.qspeci3);
		printf("\n\n ENTER THE TOTAL QUANTITY OF ITEM:");
		scanf("%d",&e.quantity3);
		printf("\n\n ENTER THE PRICE OF SINGLE ITEM:");
		scanf("%ld",&e.price3);

		printf("\n\n ENTER THE NEW NAME OF QUATATION: ");
		scanf("%s",&e.qname);
		printf("\n\n ENTER THE ITEM CODE:");
		scanf("%ld",&e.icode4);
		printf("\n\n ENTER THE ITEM NAME:");
		scanf("%s",&e.iname4);
		printf("\n\n ENTER THE SPECIFICATION: ");
		scanf("%s",&e.qspeci4);
		printf("\n\n ENTER THE TOTAL QUANTITY OF ITEM:");
		scanf("%d",&e.quantity4);
		printf("\n\n ENTER THE PRICE OF SINGLE ITEM:");
		scanf("%ld",&e.price4);

		printf("\n\n ENTER THE NEW NAME OF QUATATION: ");
		scanf("%s",&e.qname);
		printf("\n\n ENTER THE ITEM CODE:");
		scanf("%ld",&e.icode5);
		printf("\n\n ENTER THE ITEM NAME:");
		scanf("%s",&e.iname5);
		printf("\n\n ENTER THE SPECIFICATION: ");
		scanf("%s",&e.qspeci5);
		printf("\n\n ENTER THE TOTAL QUANTITY OF ITEM:");
		scanf("%d",&e.quantity5);
		printf("\n\n ENTER THE PRICE OF SINGLE ITEM:");
		scanf("%ld",&e.price5);


		i=1;
		fseek(fp,-recsize,SEEK_CUR);
		fwrite(&e,recsize,1,fp);
					break;
		 }   //if loop
		}    //while loop
		    if(i!=1)
		   printf("\n Quation is not found.........\n");

		   printf("\n  do you want to modify another records(y\n)");
		  fflush(stdin);
		  another=getche();
		 }


	 }


void add()
 {
   fp=fopen("kkk.dat","rb+");

   if(fp==NULL)
    {
	  fp=fopen("kkk.dat","wb+");
	  if(fp==NULL)
	  {
	   puts("cannot open file ");
	   exit(0);
	  }
    }


		   fseek(fp,0,SEEK_END);
		   clrscr();
		   e.total=0;
		   another ='y';


		  while(another == 'y')
	   {
		printf("\n\n ENTER THE NAME OF QUATATION: ");
		scanf("%s",&e.qname);

		printf("\n\n ENTER THE ITEM CODE:");
		scanf("%d",&e.icode1);
		printf("\n\n ENTER THE ITEM NAME:");
		scanf("%s",&e.iname1);
		printf("\n\n ENTER THE SPECIFICATION: ");
		scanf("%s",&e.qspeci1);
		printf("\n\n ENTER THE TOTAL QUANTITY:");
		scanf("%d",&e.quantity1);
		printf("\n\n ENTER THE PRICE OF SINGLE QUANTITY:");
		scanf("%d",&e.price1);

		printf("\n\n ENTER THE ITEM CODE:");
		scanf("%d",&e.icode2);
		printf("\n\n ENTER THE ITEM NAME:");
		scanf("%s",&e.iname2);
		printf("\n\n ENTER THE SPECIFICATION: ");
		scanf("%s",&e.qspeci2);
		printf("\n\n ENTER THE TOTAL QUANTITY:");
		scanf("%d",&e.quantity2);
		printf("\n\n ENTER THE PRICE OF SINGLE QUANTITY:");
		scanf("%d",&e.price2);

		printf("\n\n ENTER THE ITEM CODE:");
		scanf("%d",&e.icode3);
		printf("\n\n ENTER THE ITEM NAME:");
		scanf("%s",&e.iname3);
		printf("\n\n ENTER THE SPECIFICATION: ");
		scanf("%s",&e.qspeci3);
		printf("\n\n ENTER THE TOTAL QUANTITY:");
		scanf("%d",&e.quantity3);
		printf("\n\n ENTER THE PRICE OF SINGLE QUANTITY:");
		scanf("%d",&e.price3);

		printf("\n\n ENTER THE ITEM CODE:");
		scanf("%d",&e.icode4);
		printf("\n\n ENTER THE ITEM NAME:");
		scanf("%s",&e.iname4);
		printf("\n\n ENTER THE SPECIFICATION: ");
		scanf("%s",&e.qspeci4);
		printf("\n\n ENTER THE TOTAL QUANTITY:");
		scanf("%d",&e.quantity4);
		printf("\n\n ENTER THE PRICE OF SINGLE QUANTITY:");
		scanf("%d",&e.price4);

		printf("\n\n ENTER THE ITEM CODE:");
		scanf("%d",&e.icode5);
		printf("\n\n ENTER THE ITEM NAME:");
		scanf("%s",&e.iname5);
		printf("\n\n ENTER THE SPECIFICATION: ");
		scanf("%s",&e.qspeci5);
		printf("\n\n ENTER THE TOTAL QUANTITY:");
		scanf("%d",&e.quantity5);
		printf("\n\n ENTER THE PRICE OF SINGLE QUANTITY:");
		scanf("%d",&e.price5);

		fwrite(&e,recsize,1,fp);

		printf("\n ADD ANOTHER RECORD'S(Y/N)");
		fflush(stdin);
		another=getche();
	 }
  }

void  display()
{
   fp=fopen("kkk.dat","rb+");
   rewind(fp);
   clrscr();
   int x,y;
   while(fread(&e,recsize,1,fp)==1)
   {
      box(2,1,79,25,218);
      textcolor(BLACK+BLINK) ;  textbackground(WHITE) ;
      gotoxy(30,2);  cprintf("  %s   ",e.qname) ;
      textcolor(LIGHTGRAY) ;
      delay(10) ;

     gotoxy(5,8);
     printf(" NO  CODE      NAME         DETAILS                 QUANTITY    PRICE ");

	       x=6;
	       y=10;
	       gotoxy(x,y);
		printf("1]");
	       gotoxy(x+5,y);
		printf("%d",e.icode1);
	       gotoxy(x+12,y);
		printf("%s",e.iname1);
	       gotoxy(x+27,y);
		printf("%s",e.qspeci1);
	       gotoxy(x+55,y);
		printf("%d",e.quantity1);
	       gotoxy(x+63,y);
		printf("%d",e.price1);


	       gotoxy(x,++y);
		printf("2]");
	       gotoxy(x+5,y);
		printf("%d",e.icode2);
	       gotoxy(x+12,y);
		printf("%s",e.iname2);
	       gotoxy(x+27,y);
		printf("%s",e.qspeci2);
	       gotoxy(x+55,y);
		printf("%d",e.quantity2);
	       gotoxy(x+63,y);
		printf("%d",e.price2);

	       gotoxy(x,++y);
		printf("3]");
	       gotoxy(x+5,y);
		printf("%d",e.icode3);
	       gotoxy(x+12,y);
		printf("%s",e.iname3);
	       gotoxy(x+27,y);
		printf("%s",e.qspeci3);
	       gotoxy(x+55,y);
		printf("%d",e.quantity3);
	       gotoxy(x+63,y);
		printf("%d",e.price3);

	       gotoxy(x,++y);
		printf("4]");
	       gotoxy(x+5,y);
		printf("%d",e.icode4);
	       gotoxy(x+12,y);
		printf("%s",e.iname4);
	       gotoxy(x+27,y);
		printf("%s",e.qspeci4);
	       gotoxy(x+55,y);
		printf("%d",e.quantity4);
	       gotoxy(x+63,y);
		printf("%d",e.price4);

	       gotoxy(x,++y);
		printf("5]");
	       gotoxy(x+5,y);
		printf("%d",e.icode5);
	       gotoxy(x+12,y);
		printf("%s",e.iname5);
	       gotoxy(x+27,y);
		printf("%s",e.qspeci5);
	       gotoxy(x+55,y);
		printf("%d",e.quantity5);
	       gotoxy(x+63,y);
		printf("%d",e.price5);


     gotoxy(5,21);   line_hor(3,78,21,196);
     e.total=(e.price1*e.quantity1)+(e.quantity2*e.price2)+(e.price3*e.quantity3)+(e.quantity4*e.price4)+(e.price5*e.quantity5);
     gotoxy(5,22);   printf("TOTAL   \t\t    = %ld",e.total);
     textcolor(BLACK+BLINK) ; textbackground(WHITE) ;
     gotoxy(26,25) ;  cprintf(" Press any key to continue ") ;
     textcolor(LIGHTGRAY) ; textbackground(BLACK) ;
     getch();
      for(int i=25; i>=1; i--)
   {
	delay(20) ;
	gotoxy(1,i) ; clreol() ;
   }
      } //while loop end of reading
   } //display loop


void search()
{
  fp=fopen("kkk.dat","rb+");
  if(fp==NULL)
  {
	  fp=fopen("kkk.dat","wb+");
	  if(fp==NULL)
	   {
	    puts("cannot open file ");
	    exit(0);
	   }
  }
	clrscr();
	int z=0;
	e.total=0;
	another ='y';
	while(another=='y')
	{
	printf("\n ENTER THE NAME OF QUATATION TO SEARCH : ");
	scanf("%s",qqname);
	clrscr();
	rewind(fp);
	while(fread(&e,recsize,1,fp)==1)
	{
	   if(strcmp(e.qname,qqname)==0)
	  {
		box(2,1,79,25,218);
		textcolor(BLACK+BLINK) ;  textbackground(WHITE) ;
		gotoxy(30,2); cprintf("  %s   ",e.qname) ;
		textcolor(LIGHTGRAY) ;
		delay(10) ;
		gotoxy(5,8);     printf("NO  CODE    NAME         DETAILS         QUANTITY    PRICE ");
		gotoxy(5,9);     printf("1]  %d       %s            %s               %d         %d  ",e.icode1,e.iname1,e.qspeci1,e.quantity1,e.price1) ;
		gotoxy(5,10);    printf("2]  %d       %s            %s               %d         %d  ",e.icode2,e.iname2,e.qspeci2,e.quantity2,e.price2) ;
		gotoxy(5,11);    printf("3]  %d       %s            %s               %d         %d  ",e.icode3,e.iname3,e.qspeci3,e.quantity3,e.price3) ;
		gotoxy(5,12);    printf("4]  %d       %s            %s               %d         %d  ",e.icode4,e.iname4,e.qspeci4,e.quantity4,e.price4) ;
		gotoxy(5,13);    printf("5]  %d       %s            %s               %d         %d  ",e.icode5,e.iname5,e.qspeci5,e.quantity5,e.price5) ;
		gotoxy(5,21);   line_hor(3,78,21,196);
		e.total=(e.price1*e.quantity1)+(e.quantity2*e.price2)+(e.price3*e.quantity3)+(e.quantity4*e.price4)+(e.price5*e.quantity5);
		gotoxy(5,22);   printf("TOTAL   \t\t    = %ld",e.total);
		textcolor(BLACK+BLINK) ; textbackground(WHITE) ;
		gotoxy(26,25) ;  cprintf(" Press any key to continue ") ;
		textcolor(LIGHTGRAY) ; textbackground(BLACK) ;
		z=1;
		getch();
		for(int i=25; i>=1; i--)
		  {
		    delay(20) ;
		    gotoxy(1,i) ; clreol() ;
		  }

	       }//if loop
	 }//while end displaying  searched

		 if(z==0)
		 printf("\n\n  QUATATION NOT FOUND......");

		 printf("\n\n DO YOU WANT TO SEARCH ANY ANOTHER RECORD(Y/N)");
		 fflush(stdin);
		 another =getche();
	  } //while loop main


   } //search loop
void arrow()
{
int a,x,y;
char z='y';
clrscr();
while(z=='y' || z=='Y')
{
clrscr();
a=0;
index();
gotoxy(30,11);
while(a!=13)
{
 a=getch();
 x=wherex();
 y=wherey();
 if(a==0)
  {
	a=getch();
	if(a==80)
	if(y<19)
	gotoxy(x,y+1);
	if(a==72)
	if(y>11)
	gotoxy(x,y-1);

  }
}

switch(y)
{
case 11:
 {
  clrscr();
  compaq();      //ready quation
  break;
 }

case 12:
 {
  clrscr();
  add();     //add quation
  break;
 }
case 13:
 {
  clrscr();
  display();    //display quation
  break;
 }


case 14:
 {
   clrscr();
   modify();   //modify quation
   break;
  }
case 15:
  {
	clrscr();
	delete1();       //delete quation
	break;
  }
case 16:
  {
	 clrscr();
	 help();
	 break;
  }
case 17:
  {
	 clrscr();
	 search();           //search quation
	 break;
  }
case 18:
  {
	clrscr();
	ABOUT();    //  about us
	break;
  }
case 19:
  {
	clrscr();
	printf("\n\n  EXIT");
	exit(0);
	break;
 }
}
printf("\n\n\t DO YOU WANT TO CONT(Y/N):> ");
scanf("%s",&z);
}
getch();
}

void qq(void)
{
  int i;
  clrscr();
  int gdriver = EGA, gmode = EGAHI;
  initgraph(&gdriver, &gmode, "c:\\tccp\\bgi");
  int dly=110,dly1=40;//110 40
  for ( i = 0; i < 200; i+=2 )
  {                             // graphics output
       setcolor(i);
       circle(300,i,200-i);
       delay(dly1);
  }
  for ( i = 0; i < 220; i+=2 )
 {
   setcolor(i);
   circle(300,i+200,i);
   delay(dly1);
 }
 clrscr();

     for ( i=1;i<=10;i++)
     {
     if(i==7)
     continue;
     else
     {
       setcolor(i);
       settextstyle( DEFAULT_FONT, HORIZ_DIR, i);
       moveto(40,120);
       outtext("WELCOME TO" ); //blink
       delay(dly);
       clrscr();
     }
}
    for ( i=1;i<7;i++)
  {
      setcolor(i);
      settextstyle( DEFAULT_FONT, HORIZ_DIR, i);
      moveto(160,150);
      outtext(" PROJECT ");
      delay(dly);
      clrscr();
  }
     for ( i=3;i<=9;i++)
      {
      if(i==7)
      continue;
     else
    {
      setcolor(i);
      settextstyle( TRIPLEX_FONT, HORIZ_DIR, i);
      moveto(40,120);
      outtext("SUBMITTED");
      delay(dly);
      clrscr();
    }
     }
     for ( i=1;i<=10;i++)
     {
     if(i==7)
     continue;
     else
     {
	setcolor(i);
	settextstyle( DEFAULT_FONT, HORIZ_DIR, i);
	moveto(230,160);
	outtext("BY");
       delay(dly);
       clrscr();
     }
    }

  for ( i=1;i<=5;i++)
 {
   clrscr();
   setcolor(i+7);
   settextstyle( DEFAULT_FONT, HORIZ_DIR, i);
   moveto(10,120);
   outtext("VISHAL & RAHUL");
   delay(i*dly);
 }
 getch();
 closegraph();
 }


void main()
 {
   passward();
   qq();     //welcome screen
   arrow();  //main menu  for project
   getch();
 }

