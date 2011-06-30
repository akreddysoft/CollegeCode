#include<stdio.h>
#include<conio.h>
#include<dos.h>
#include<time.h>
#include<stdlib.h>
//////////////USER INTERFACE DATA//////////////////////////////////////
struct railway
{
	char name[10],sex;
	int age,pnr_no,t_no,tr_no,seat_no,day,month,year;
}e1;
FILE *fp1,*ft1;
void menu();
void poscursormenu();
void reservation();
void cancellation();
void status();
int calamt(int);
int caltno(int);
int calpnr(char[]);
///////DATA OF DATABASE ADMIN//////////////////////////////
struct emp
{
	char tname[15],source[15],dest[15];
	int tno,dist,seats;
}e,temp;
FILE *fp,*ft;
void mainmenu();
void poscursormainmenu();
void addtr();
void listtr();
void modtr();
void delettr();
void rettr();
/////////////////////////COMMON DATA//////////////////////
union REGS in,out;
int pass();
void drawline();
void box();
int x,y;
///////////////////////////////////////////////////////////
void main()
{
	int exits=0,ans=0;
	fp1=fopen("c:\\trains.dat","rb+");
	if(fp1==NULL)
	{
	 fp1=fopen("c:\\trains.dat","wb+");
		if(fp1==NULL)
		 {
			puts("can't open");
			exit(1);
		 }
	}
 fp=fopen("c:\\rail.dat","rb+");
 if(fp==NULL)
 {
	fp=fopen("c:\\rail.dat","wb+");
	if(fp==NULL)
	{
	 puts("Cannot open");
	 exit(1);
	}
 }
 while(1)
 {
	menu();
	poscursormenu();
	switch(y)
	{
		case 9:
		reservation();
		break;

		case 11:
		cancellation();
		break;

		case 13:
		status();
		break;

		case 15:
		listtr();
		break;

		case 17:
		ans=pass();
		if(ans==1)
		exits=0;
		else
		exits=1;
		while(!exits)
		{
			mainmenu();
			poscursormainmenu();
			switch(y)
			{
				case 9:
				addtr();
				break;

				case 11:
				listtr();
				break;

				case 13:
				modtr();
				break;

				case 15:
				delettr();
				break;

				case 17 :
				rettr();
				break;

				case 19:
				exits=1;
				break;
			}
		 }
		break;

		case 19:
		fclose(fp1);
		exit(1);
		break;
	}
}
}
void menu()
{
	clrscr();
	box();
	gotoxy(26,6);
	textcolor(YELLOW);
	cprintf("**RAILWAY RESERVATION SYSTEM**\n");
	gotoxy(32,9);
	textcolor(11);
	cprintf("1 : RESERVATION\n");
	gotoxy(32,11);
	cprintf("2 : CANCELLATION\n");
	gotoxy(32,13);
	cprintf("3 : SEE STATUS\n");
	gotoxy(32,15);
	cprintf("4 : SEE LIST OF TRAINS\n");
	gotoxy(32,17);
	cprintf("5 : DATABASE ADMINISTRATION\n");
	gotoxy(32,19);
	cprintf("6 : EXIT \n");
	gotoxy(32,9);
}
void poscursormenu()
{
	out.h.ah=0;
	x=32;y=9;     //posion 1.Reservation
	while(out.h.ah!=28)
	{
	 in.h.ah=0;
	 int86(0x16,&in,&out);
	 switch(out.h.ah)
	 {
		case 80:
		gotoxy(x,y=y+2);
		if(y==21)
		 gotoxy(x,y=9);
		break;

		case 72:
		gotoxy(x,y=y-2);
		 if(y==7)
			gotoxy(x,y=19);
		 break;
	 }
	}
}
void reservation()
{
 char another='y';
 int flag=0,input;
 float fare;
	fseek(fp1,0,SEEK_END);
while(another=='y')
{
			 clrscr();
			 gotoxy(2,1);
			 printf("\nEnter name:");
			 fflush(stdin);
			 gets(e1.name);
			 if(e1.name[0]==0)
			 {
				printf("\nInvalid Input");
				getch();
				break;
			 }
			 printf("\nEnter age:");
			 scanf("%d",&e1.age);
			 printf("\nEnter sex(m/f):");
			 fflush(stdin);
			 scanf("%c",&e1.sex);
			 if(e1.sex!='m'&&e1.sex!='f')
			 {
				printf("\nInvalid Input");
				getch();
				break;
			 }
			 printf("\n\rEnter train no.:");
			 scanf("%d",&e1.tr_no);
			 rewind(fp);
			 while(fread(&e,sizeof(e),1,fp)==1)
			 {
			 if(e.tno==e1.tr_no)
			 flag=1;
			 }
			 if(flag==0)
			 {
				printf("\nTrain not found");
				getch();
				break;
			 }
			 printf("\n\rEnter date of travel(dd/mm/yyyy):");
			 scanf("%d %d %d",&e1.day,&e1.month,&e1.year);
			 if(e1.day>31||e1.month>12||e1.year<2003)
			 {
				printf("\nInvalid Input");
				getch();
				break;
			 }
			 e1.pnr_no=calpnr(e1.name);
			 e1.t_no=caltno(e1.day);
			 while(fread(&e1,sizeof(e1),1,fp1)==1)
			 {
				if(e.tno==e1.tr_no)     //find the distance of corresponding trainno
				break;
			 }
			 printf("\nYour PNR no.is:");
			 printf("%d",e1.pnr_no);
			 printf("\nYour ticket no.is:");
			 printf("%d",e1.t_no);
			 printf("\nYour seat no.is:");
			 printf("\nThe fare amount is:");
			 fare=e.dist*0.4;
			 printf("%.2f",fare);
			 fwrite(&e1,sizeof(e1),1,fp1);
			 printf("\n\nDo you want to make more reservations(y/n):\n");
			 fflush(stdin);
			 another=getche();
			 }
}


void cancellation()
{
char	another='y';
int	flag=0,pnr;
do
{
	 clrscr();
	 flag=0;
	 printf("\nEnter the PNR of the ticket to be cancelled:\n");
	 scanf("%d",&pnr);
	 ft1=fopen("c:\\tr_temp.dat","wb");
	 rewind(fp1);
	 while(fread(&e1,sizeof(e1),1,fp1)==1)
	 {
		if(pnr!=e1.pnr_no)
		fwrite(&e1,sizeof(e1),1,ft1);
		else
		flag=1;
	 }
		if(!flag)
		printf("\nRecord Not found");
		fclose(fp1);
		fclose(ft1);
		remove("c:\\trains.dat");
		rename("c:\\tr_temp.dat","c:\\trains.dat");
		fp1=fopen("c:\\trains.dat","rb+");
		printf("\n\nWANT TO MAKE MORE CANCELLATIONS y/n\n");
		fflush(stdin);
		another=getch();
		}
		while(another=='y');
}
void status()
{
		int flag=0;
		clrscr();
		rewind(fp1);
		printf("                            STATUS OF RESERVATIONS\n");
		printf("                            ======================\n");
		printf("\nName\t\tTrain No\tPNR NO\t\tSEAT NO\t\tDate\n");
		drawline();
		while(fread(&e1,sizeof(e1),1,fp1)==1)
	 {
		 flag=1;
		 printf("%s\t\t%d\t\t%d\t\t%d\t\t%d/%d/%d\n",e1.name,e1.tr_no,e1.pnr_no,e1.seat_no,e1.day,e1.month,e1.year);
	 }
	 if(!flag)
	 printf("\nRecord not found");
		getch();
}

int calpnr(char name[20])
{
 int pnr;
 randomize();
 pnr=name[0];
 pnr=pnr*random(99);
 return pnr;
}
int caltno(int dd)
{
 int tno;
 randomize();
 tno=dd*random(99);
 return tno;
}

void mainmenu()
{
		clrscr();
		box();
		gotoxy(26,6) ;
		cprintf("** RAILWAY RESERVATION SYSTEM **") ;
		gotoxy(32,9) ;
		cprintf("1 : ADD TRAINS" );
		gotoxy(32,11) ;
		cprintf("2 : LIST TRAINS") ;
		gotoxy(32,13) ;
		cprintf("3 : MODIFY TRAIN RECORD" );
		gotoxy(32,15) ;
		cprintf("4 : DELETE TRAIN");
		gotoxy(32,17) ;
		cprintf("5 : RETREIVE DETAILS" );
		gotoxy(32,19) ;
		cprintf("0 : BACK" );
		gotoxy(32,9);
}

void poscursormainmenu()
{
		x=32;y=9;
		out.h.ah=0;                //resets the o.h.ah value
		while(out.h.ah!=28)
		{
		 in.h.ah=0;            //set the ah register for accepting a key input
		 int86(0x16,&in,&out);    //accept an input
		 switch(out.h.ah)            //move cursor up or down
		 {
		 case 80:
			 gotoxy(x,y=y+2);
			 if(y==21)
				gotoxy(x,y=9);
				break;
		case 72:
		 gotoxy(x,y=y-2);
		 if(y==7)
		 gotoxy(x,y=19);
		 break;
		}
	}
}

void addtr()
{
 char another='y';
 int flag=0;
 while(another=='y')
 {
				clrscr();
				printf("\nEnter Train Name:");
				gets(e.tname);
				if(e.tname[0]==0)
				{
					printf("\nInvalid Input");
					getch();
					break;
				}
				printf("\nEnter train no.:");
				scanf("%d",&e.tno);
				rewind(fp);
				while(fread(&temp,sizeof(temp),1,fp)==1)
				{
				 if(e.tno==temp.tno)
					flag=1;
				}
				if(flag)
				{
					printf("\nTrain already exists");
					getch();
					break;
				}
				printf("\nEnter source:");
				scanf("%s",e.source);
				printf("\nEnter destination:");
				scanf("%s",e.dest);
				printf("\nEnter distance(in kms):");
				scanf("%d",&e.dist);
				e.seats=72;
				fseek(fp,0,SEEK_END);
				fwrite(&e,sizeof(e),1,fp);
				printf("\nAdd another(y/n):");
				fflush(stdin);
				another=getche();
	}
}

void listtr()
{
		int flag=0;
		rewind(fp);
		clrscr();
		printf("                      LIST OF THE AVAILABLE TRAINS\n");
		printf("                      ============================\n");
		printf("\nTrain Name\tTrain No\tSource\tDestination\tDistance\tSeats\n");
		drawline();
	 while(fread(&e,sizeof(e),1,fp)==1)
	 {
		 flag=1;
						if(strlen(e.tname)>=8)
						printf("\n%s\t%d\t\t%s\t%s\t\t%d\t\t%d",e.tname,e.tno,e.source,e.dest,e.dist,e.seats);
						else
						printf("\n%s\t\t%d\t\t%s\t%s\t\t%d\t\t%d",e.tname,e.tno,e.source,e.dest,e.dist,e.seats);

	 }
	 if(!flag)
	 printf("\nRecord not found");
		getch();
	 clrscr();
}

void modtr()
{
	 char	 another='y';
	 int flag=0,ttno;
	 while(another=='y')
	 {
		clrscr();
		printf("\nEnter Train no. to modify:");
		scanf("%d",&ttno);
		rewind(fp);
		while(fread(&e,sizeof(e),1,fp)==1)
		{
		 if(e.tno==ttno)
		 {
			flag=1;
			printf("\nEnter Train Name:");
			fflush(stdin);
			gets(e.tname);
			if(e.tname[0]==0)
			{
				printf("\nInvalid Input");
				getch();
				break;
			}
			printf("\nEnter train no.:");
			scanf("%d",&e.tno);
			printf("\nEnter source:");
			scanf("%s",e.source);
			printf("\nEnter destination:");
			scanf("%s",e.dest);
			printf("\nEnter distance:");
			scanf("%d",&e.dist);
			e.seats=72;
			fseek(fp,-51,SEEK_CUR);
			fwrite(&e,sizeof(e),1,fp);
			break;
		 }
		}
		if(!flag)
			printf("\nRecord not found\n");
			printf("\nModify another(y/n):");
		fflush(stdin);
		another=getche();
	 }
}

void delettr()
{
	int	flag=0,ttno;
	char	 another='y';
	 while(another=='y')
	{
		clrscr();
		flag=0;
		printf("\nEnter Train no.of the train to delete:");
		scanf("%d",&ttno);
		ft=fopen("c:\\TEMP.DAT","wb");
		rewind(fp);
		while(fread(&e,sizeof(e),1,fp)==1)
		{
		 if(e.tno!=ttno)
				fwrite(&e,sizeof(e),1,ft);
		 else
					flag=1;
			}
		if(!flag)
		printf("\nRecord Not found");
		fclose(ft);
		fclose(fp);
		remove("c:\\rail.dat");
		rename("c:\\TEMP.DAT","c:\\rail.dat");
		fp=fopen("c:\\rail.dat","rb+");
		printf("\n\nDelete another(y/n):");
		fflush(stdin);
		another=getche();
	 }
}
void rettr()
{
	int	 flag=0,ttno;
	clrscr();
	 printf("\nEnter Train no.to retreive:");
	 scanf("%d",&ttno);
	rewind(fp);
	clrscr();
		printf("\nTrain Name\tTrain No\tSource\tDestination\tDistaince\tSeats\n");
		drawline();
		while(fread(&e,sizeof(e),1,fp)==1)
		{
			 if(e.tno==ttno)
			 {
						flag=1;
						if(strlen(e.tname)>=8)
						printf("\n%s\t%d\t\t%s\t%s\t\t%d\t\t%d",e.tname,e.tno,e.source,e.dest,e.dist,e.seats);
						else
						printf("\n%s\t\t%d\t\t%s\t%s\t\t%d\t\t%d",e.tname,e.tno,e.source,e.dest,e.dist,e.seats);
				}
		}
	 if(!flag)
	 printf("\nNo record");
	 getch();
}
void box()
{
	char c1=178, c2=177, c3=176 ;
	int k=1,i ;
	gotoxy(1,2) ;
	for (i=1; i<=1840; i++)
	{
		if (k == 1)
			printf("%c",c1) ;
		else
		if (k == 2)
			printf("%c",c2) ;
		else
		if (k == 3)
			printf("%c",c3) ;
		k++ ;
		if (k == 4)
			k = 1 ;
	}
	for (i=5; i<=21; i++)
	{
		gotoxy(21,i) ;
		printf("                                        " );
	}
}

void drawline()
{
 int i;
 for(i=0;i<80;++i)
 printf("*");
}
int pass()
{
 FILE *fp;
 int i=0,result;
 char pass[10],test[10],ch;
 clrscr();
 gotoxy(28,12);
 printf("ษออออออออออออออออออออออออป\n");
 gotoxy(28,13);
 printf("บEnter Password:         บ\n");
 gotoxy(28,14);
 printf("ศออออออออออออออออออออออออผ \n");
 gotoxy(44,13);
 do
 {
	ch=getch();
	if(ch>='a'&&ch<='z'||ch>='A'&&ch<='Z'||ch>='1'&&ch<='9')
	{
		pass[i++]=ch;
		printf("*");
	}
 }
 while(ch!='\r');
 printf("\b");
 pass[i]=0;
 fp=fopen("c:\\madhur.txt","r");
 fgets(test,5,fp);
 result = strcmp(pass,test);
 if(result==0)
 return 1;
 else
 {
	printf("\n\nIncorrect Password");
	getch();
	return 0;
 }
}

