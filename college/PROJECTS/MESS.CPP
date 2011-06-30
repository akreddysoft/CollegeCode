//                         **   MESS MANAGEMENT  **

 #include<stdio.h>
 #include<conio.h>
 #include<fstream.h>
 #include<stdlib.h>
 #include<string.h>
 #include<ctype.h>

 void createdatabase();
 void addnewrecord();
 void finddetails();
 void updatemenu();
 void remove();
 void modifydata();
 void modifybalance();
 void modifymenu();
 void openacc();
 void closeacc();
 void indireport();
 void compreport();


 struct messmanagement
 {
   char name[20],faculty[20];
   int roomno,year,accno,flag,foodtype;
   float balance;
 };
 struct messmanagement mess;

 static int accountno=0,count=0;


 FILE *fp,*f;


 void main()
 {
   char temp[20],tempch[20],ch1,newpassword[20],filename[20],ch,temppassword[20];
   int i,j,p;

   textbackground(BLUE);
   textcolor(GREEN);
	_setcursortype(2);


   clrscr();
   strcpy(tempch,NULL);
   gotoxy(25,10);
   printf("Enter file name : ");
   scanf("%s",filename);
   fp=fopen(filename,"r");

   if(fp==NULL)
   {
	  printf("\n\n        File does not exist..");
	  printf("\n          Access denied !!");
	  getch();
   }
   else
   {
	  clrscr();
	  i=0;
	  ch=NULL;
	  gotoxy(25,10);
	  printf("Enter the current password : ");
	  while(ch!='\r')             //read password from user
	  {
		ch=getch();
		if(ch=='\b')
		{
		  if(i>0)
		  {
		    i--;
		    gotoxy(54+i,10);
		    printf(" ");
		    gotoxy(54+i,10);
		  }
		}
		else
		{
		  temppassword[i]=ch;
		  temppassword[i]=toupper(temppassword[i]);
		  i++;
		  if(ch!='\r')
			 printf("*");
		}
	   } //end of while

	  temppassword[i-1]=NULL;


	  ifstream  infile(filename);         //read password from file
	  infile.getline(tempch, 20);
	  fclose(fp);

	  if(strcmp(tempch,temppassword)==0)    //compare the 2 passwords
	  {

		 clrscr();

	do
	{
	   clrscr();
	   gotoxy(30,3);
	   printf("MESS MANAGEMENT");
	   gotoxy(23,7);
	   printf("1  REGISTER PRESENT STUDENTS");
	   gotoxy(23,8);
	   printf("2  REGISTER A NEW STUDENT");
	   gotoxy(23,9);
	   printf("3  UPDATE EXISTING RECORDS");
	   gotoxy(23,10);
	   printf("4  FIND DETAILS ....");
	   gotoxy(23,11);
	   printf("5  EXIT");
	   gotoxy(23,7);
	   i=7;
	   do
	   {
		 ch=getch();
		 if(ch==80)
		 {
		  if(i==11)
		   gotoxy(23,i);
		  else
		   gotoxy(23,++i);
		 }
		 else
		 if(ch==72)
		 {
		  if(i==7)
		   gotoxy(23,i);
		  else
		   gotoxy(23,--i);
		 }
	   }while(ch!='\r');
	   i=i-6;
	   switch(i)
	   {

		 case 1 : createdatabase();
				 break;

		 case 2 : addnewrecord();
				 break;

		 case 3 : updatemenu();
				 break;

		 case 4 : finddetails();
				 break;

		 case 5 : gotoxy(15,16);
			  printf("THANK YOU ....");

	   }//end of switch

	getch();
   }while(i!=5);   //end of do-while

  }//end of if
  else
  {
	 gotoxy(30,13);
	 printf("Invalid password ...");
	 getch();
  }


 }//end of main
 }



 void updatemenu()
 {
   int i;
   char ch;
   do
   {
	   clrscr();
	   gotoxy(30,5);
	   printf("UPDATION");
	   gotoxy(23,7);
	   printf("1  MODIFY THE STUDENT RECORD");
	   gotoxy(23,8);
	   printf("2  REMOVE A STUDENT RECORD");
	   gotoxy(23,9);
	   printf("3  OPEN AN ACCOUNT");
	   gotoxy(23,10);
	   printf("4  CLOSE AN ACCOUNT");
	   gotoxy(23,11);
	   printf("5  QUIT TO MAIN MENU");
	   gotoxy(23,7);
	   i=7;
	   do
	   {
		 ch=getch();
		 if(ch==80)
		 {
		  if(i==11)
		   gotoxy(23,i);
		  else
		   gotoxy(23,++i);
		 }
		 else
		 if(ch==72)
		 {
		  if(i==7)
		   gotoxy(23,i);
		  else
		   gotoxy(23,--i);
		  }
	   }while(ch!='\r');
	   i=i-6;
	   switch(i)
	   {
		 case 1 : modifymenu();
				break;

		 case 2 : remove();
				break;

		 case 3 : openacc();
				break;

		 case 4 : closeacc();
				break;

		 case 5 : gotoxy(15,14);
				printf("THANK YOU !!!");
	   }
   }while(i!=5);  //end of do-while
 }//end of void updatemenu()


 void createdatabase()
 {
   char ch,ch1;
   fp=fopen("mess.dat","wb");
   do
   {
	 clrscr();
	 flushall();
	 gotoxy(27,2);
	 printf("ENTER THE INFORMATION");
	 gotoxy(20,4);
	 printf("NAME : ");
	  gets(mess.name);
	 gotoxy(20,5);
	 printf("FACULTY : ");
	  gets(mess.faculty);
	 gotoxy(20,6);
	 printf("YEAR : ");
	  scanf("%d",&mess.year);
	 gotoxy(20,7);
	 printf("ROOM NO. : ");
	  scanf("%d",&mess.roomno);
	  gotoxy(20,8);
	 printf("1:VEGETARIAN   2:NON-VEGETARIAN : ");
	  scanf("%d",&mess.foodtype);
	 gotoxy(20,10);
	 mess.flag=1;
	 printf("do you want to open an account(y/n) : ");
	  ch=getche();
	 if(ch=='y' || ch=='Y')
	 {
	   accountno++;
	   mess.accno = accountno;
	   gotoxy(20,12);
	   printf("YOUR ACCOUNT NO. IS : %d",mess.accno);
	   gotoxy(20,13);
	   printf("ENTER THE BALANCE : Rs.");
		scanf("%f",&mess.balance);
	 }
	 else
	 {
	   mess.accno = -1;
	   mess.balance = -1;
	 }

	 fwrite(&mess,sizeof(mess),1,fp);
	 gotoxy(20,14);
	 printf("do you want to register any more student ...");
	 ch1=getche();
   }while(ch1=='y' || ch1=='Y');
   fclose(fp);
 }//end of void createdatabase()


 void addnewrecord()
 {
   char ch,ch1;
   fp=fopen("mess.dat","ab");
   do
   {
	 clrscr();
	 flushall();
	 gotoxy(27,2);
	 printf("ENTER THE INFORMATION");
	 gotoxy(20,4);
	 printf("NAME : ");
	  gets(mess.name);
	 gotoxy(20,5);
	 printf("FACULTY : ");
	  gets(mess.faculty);
	 gotoxy(20,6);
	 printf("YEAR : ");
	  scanf("%d",&mess.year);
	 gotoxy(20,7);
	 printf("ROOM NO. : ");
	  scanf("%d",&mess.roomno);
	 gotoxy(20,8);
	 printf("1:VEGETARIAN   2:NON-VEGETARIAN : ");
	  scanf("%d",&mess.foodtype);
	 gotoxy(20,10);
	 mess.flag = 1;
	 printf("do you want to open an account(y/n) : ");
	  ch=getche();
	 if(ch=='y' || ch =='Y')
	 {
		accountno++;
		mess.accno = accountno;
		gotoxy(20,12);
		printf("YOUR ACCOUNT NO. IS : %d",mess.accno);
		gotoxy(20,13);
		printf("ENTER THE BALANCE : Rs.");
		 scanf("%f",&mess.balance);
	 }
	 else
	 {
		mess.accno = -1;
		mess.balance = -1;
	 }
	 fwrite(&mess,sizeof(mess),1,fp);
	 gotoxy(20,14);
	 printf("do you want to register any more student ...");
	  ch1=getche();
   }while(ch1=='y' || ch1=='Y');
   fclose(fp);
 }//end of void addnewrecord()


 void modifymenu()
 {
   int i;
   char ch;
   do
   {
	   clrscr();
	   gotoxy(30,5);
	   printf("MODIFY ");
	   gotoxy(23,7);
	   printf("1  BALANCE");
	   gotoxy(23,8);
	   printf("2  STUDENT DATA");
	   gotoxy(23,9);
	   printf("3  QUIT TO UPDATE MENU");
	   gotoxy(23,7);
	   i=7;
	   do
	   {
		 ch=getch();
		 if(ch==80)
		 {
		  if(i==9)
		   gotoxy(23,i);
		  else
		   gotoxy(23,++i);
		 }
		 else
		 if(ch==72)
		 {
		  if(i==7)
		   gotoxy(23,i);
		  else
		   gotoxy(23,--i);
		  }
	   }while(ch!='\r');
	   i=i-6;
	   switch(i)
	   {
		 case 1 : modifybalance();
				 break;

		 case 2 : modifydata();
				 break;

		 case 3 : gotoxy(15,13);
				 printf("THANK YOU !!!");
	   }

   }while(i!=3);  //end of do-while
	getch();
 }//end of void modifymenu()



 void modifybalance()
 {
   clrscr();
   int acc,i=0,ch,check=0;
   float addamt,dedamt;
   fp=fopen("mess.dat","rb+");
   gotoxy(20,5);
   printf("ENTER ACCOUNT NUMBER : ");
	scanf("%d",&acc);
   while(fread(&mess,sizeof(mess),1,fp)!=NULL && check==0)
   {
	  if(mess.accno==acc && mess.flag==1)
	  {
	   gotoxy(18,7);
	   check=1;
	   printf("YOUR PREVIOUS BALANCE IS : Rs.%f",mess.balance);
	   do
	   {
		gotoxy(18,8);
		printf("WANNA");
		gotoxy(19,9);
		printf("1  ADD");
		gotoxy(19,10);
		printf("2  DEDUCT");
		gotoxy(18,12);
		printf("CHOICE  ");
		 scanf("%d",&ch);
		switch(ch)
		{
		  case 1 : gotoxy(18,13);
				   printf("ENTER THE AMOUNT TO BE ADDED : Rs.");
					scanf("%f",&addamt);
				   mess.balance+=addamt;
				   gotoxy(18,15);
				   printf("AVAILABLE BALANCE IS NOW : Rs.%f",mess.balance);
				   fseek(fp,sizeof(mess)*i,SEEK_SET);
				   fwrite(&mess,sizeof(mess),1,fp);
				   break;

		  case 2 : gotoxy(18,13);
				   printf("ENTER THE AMOUNT TO BE DEDUCTED : Rs.");
				   scanf("%f",&dedamt);
				   mess.balance-=dedamt;
				   gotoxy(18,15);
				   if(mess.balance<=0)
				   {
					  printf("THE AMOUNT CANNOT BE DEDUCTED");
					  gotoxy(18,16);
					  printf("YOU NEED TO REFRESH YOUR BALANCE");
					  mess.balance+=dedamt;
				   }
				   else
				   {
					  printf("AVAILABLE BALANCE IS NOW : Rs.%f",mess.balance);
					  fseek(fp,sizeof(mess)*i,SEEK_SET);
					  fwrite(&mess,sizeof(mess),1,fp);
				   }
				   break;

		 default : gotoxy(18,13);
				   printf("INCORRECT CHOICE ...");
	   }//end of switch
	   if(ch!=1 && ch!=2)
	   {
		 gotoxy(18,13);
		 printf("                     ");
		 gotoxy(18,24);
	   }
	   }while(ch!=1 && ch!=2);//end of do-while
	 }//end of if
	 i++;
   }//end of while
   if(check==0)
   {
	 gotoxy(18,7);
	 printf("NO INFORMATION FOUND");
   }
   fclose(fp);
   printf("\n\n\n\n\n\n  PRESS ANY KEY TO CONTINUE .. ");

 }//end of void modifybalance()


  void modifydata()
  {
   clrscr();
   flushall();
   char tempname[20];
   int temproomno,i=0,check=0;
   fp=fopen("mess.dat","rb+");
   gotoxy(18,3);
   printf("ENTER YOUR NAME : ");
   gets(tempname);
   gotoxy(18,4);
   printf("ENTER ROOM NO. : ");
   scanf("%d",&temproomno);
   while(fread(&mess,sizeof(mess),1,fp)!=NULL && check==0)
   {
	  if(mess.roomno==temproomno && mess.flag==1 && strcmp(mess.name,tempname)==0)
	  {
		 clrscr();
		 gotoxy(30,2);
		 printf("YOUR PREVIOUS DATA");
		 gotoxy(23,4);
		 printf("NAME        : %s",mess.name);
		 gotoxy(23,5);
		 printf("FACULTY     : %s",mess.faculty);
		 gotoxy(23,6);
		 printf("YEAR        : %d",mess.year);
		 gotoxy(23,7);
		 printf("ROOM NO.    : %d",mess.roomno);
		 gotoxy(23,8);
		 if(mess.foodtype==1)
		  printf("FOOD TYPE   : VEGETARIAN");
		 else
		 if(mess.foodtype==2)
		  printf("FOOD TYPE   : NON-VEGETARIAN");
		 else
		  printf("FOOD TYPE   : NOT SPECIFIED");
		 if(mess.accno!=-1)
		 {
		   gotoxy(23,9);
		   printf("ACCOUNT NO. : %d",mess.accno);
		   gotoxy(23,10);
		   printf("BALANCE     : Rs.%f",mess.balance);
		 }
		 else
		 {
		   gotoxy(23,10);
		   printf("YOU HAVE NO ACCOUNT");
		 }
		 gotoxy(30,12);
		 printf("ENTER NEW DATA");
		 gotoxy(23,14);
		 flushall();
		 printf("NAME        : ");
		  gets(mess.name);
		 gotoxy(23,15);
		 printf("FACULTY     : ");
		  gets(mess.faculty);
		 gotoxy(23,16);
		 printf("YEAR        : ");
		  scanf("%d",&mess.year);
		 gotoxy(23,17);
		 printf("ROOM NO.    : ");
		  scanf("%d",&mess.roomno);
		 gotoxy(23,18);
		 printf("1:VEGETARIAN   2:NON-VEGETARIAN : ");
		  scanf("%d",&mess.foodtype);
		 mess.flag = 1;
		 fseek(fp,sizeof(mess)*i,SEEK_SET);
		 fwrite(&mess,sizeof(mess),1,fp);
		 check=1;
	   }//end of if
	   i++;
   }//end of while
   if(check==0)
   {
	 gotoxy(23,6);
	 printf("NO INFORMATION FOUND");
   }
   else
   {
	 gotoxy(23,20);
	 printf("    DATA MODIFIED  ");
   }

   printf("\n\n  PRESS ANY KEY TO CONTINUE ...");
   fclose(fp);
   getch();
 }//end of void modifydata()



 void openacc()
 {
   clrscr();
   flushall();
   char tempname[20];
   int temproomno,i=0,check=0;
   fp=fopen("mess.dat","rb+");
   gotoxy(18,3);
   printf("ENTER YOUR NAME : ");
   gets(tempname);
   gotoxy(18,4);
   printf("ENTER ROOM NO. : ");
   scanf("%d",&temproomno);
   while(fread(&mess,sizeof(mess),1,fp)!=NULL && check==0)
   {
	  if(mess.roomno==temproomno && mess.flag==1 && strcmp(mess.name,tempname)==0)
	  {
	   if(mess.accno==-1)
	   {
		 clrscr();
		 accountno++;
		 mess.accno=accountno;
		 gotoxy(18,6);
		 printf("YOUR ACCOUNT NO. IS %d",mess.accno);
		 gotoxy(18,7);
		 printf("ENTER YOUR BALANCE : Rs.");
		  scanf("%f",&mess.balance);
		 fseek(fp,sizeof(mess)*i,SEEK_SET);
		 fwrite(&mess,sizeof(mess),1,fp);
		 check=1;
	   }
	   else
	   {
		 gotoxy(18,6);
		 printf("YOUR ACCOUNT ALREADY EXISTS .. ");
		 gotoxy(18,7);
		 printf("YOUR ACCOUNT NO. IS %d",mess.accno);
		 check=1;
	   }
	  }//end of if
	  i++;
  }//end of while
  if(check==0)
  {
	  gotoxy(18,6);
	  printf("NO INFORMATION FOUND ...");
  }
  printf("\n\n  PRESS ANY KEY TO CONTINUE ...");
  getch();
  fclose(fp);
 }//end of void openacc()



  void closeacc()
  {
   clrscr();
   flushall();
   int tempaccno,i=0,check=0;
   fp=fopen("mess.dat","rb+");
   gotoxy(18,3);
   printf("ENTER YOUR ACCOUNT NO. : ");
   scanf("%d",&tempaccno);
   while(fread(&mess,sizeof(mess),1,fp)!=NULL && check==0)
   {
	if(mess.accno==tempaccno && mess.flag==1)
	{
	 clrscr();
	 gotoxy(18,5);
	 printf("PREVIOUS BALANCE : Rs.%f",mess.balance);
	 mess.accno=-1;
	 mess.balance=-1;
	 gotoxy(18,7);
	 printf("YOUR ACCOUNT HAS BEEN CLOSED");
	 fseek(fp,sizeof(mess)*i,SEEK_SET);
	 fwrite(&mess,sizeof(mess),1,fp);
	 check=1;
	}
	i++;
   }//end of while
	if(check==0)
	{
	  gotoxy(18,5);
	  printf("NO INFORMATION FOUND ...");
	}
	printf("\n\n  PRESS ANY KEY TO CONTINUE ...");
	getch();
	fclose(fp);
  }//end of void closeacc()



 void remove()
 {
   clrscr();
   flushall();
   char tempname[20];
   int temproomno,i=0,check=0;
   fp=fopen("mess.dat","rb+");
   gotoxy(18,3);
   printf("ENTER YOUR NAME : ");
   gets(tempname);
   gotoxy(18,4);
   printf("ENTER ROOM NO. : ");
   scanf("%d",&temproomno);
   while(fread(&mess,sizeof(mess),1,fp)!=NULL && check==0)
   {
	if(mess.roomno==temproomno && mess.flag==1 && strcmp(mess.name,tempname)==0)
	{
	 clrscr();
	 mess.flag=0;
	 mess.balance=-1;
	 mess.accno=-1;
	 gotoxy(18,6);
	 printf("RECORD HAS BEEN REMOVED");
	 fseek(fp,sizeof(mess)*i,SEEK_SET);
	 fwrite(&mess,sizeof(mess),1,fp);
	 check=1;
	}
	i++;
   }//end of while
	if(check==0)
	{
	  gotoxy(18,6);
	  printf("NO INFORMATION FOUND ...");
	}
	printf("\n\n  PRESS ANY KEY TO CONTINUE ...");
	getch();
	fclose(fp);
  }//end of void remove()


  void finddetails()
  {
	clrscr();
	int i;
	char ch;
	do
	{
	   clrscr();
	   gotoxy(30,3);
	   printf("FIND DETAILS ...");
	   gotoxy(23,5);
	   printf("1  INDIVIDUAL STUDENT");
	   gotoxy(23,6);
	   printf("2  COMPLETE REPORT");
	   gotoxy(23,7);
	   printf("3  MAIN MENU");
	   gotoxy(23,5);
	   i=5;
	   do
	   {
		 ch=getch();
		 if(ch==80)
		 {
		  if(i==7)
		   gotoxy(23,i);
		  else
		   gotoxy(23,++i);
		 }
		 else
		 if(ch==72)
		 {
		  if(i==5)
		   gotoxy(23,i);
		  else
		   gotoxy(23,--i);
		  }
	   }while(ch!='\r');
	   i=i-4;
	   switch(i)
	   {
		 case 1 : indireport();
				   break;

		 case 2 : compreport();
				   break;

		 case 3 : gotoxy(15,13);
				  printf("  THANK YOU ...");
				   break;
	   }
   }while(i!=3);//end of do-while
   gotoxy(15,15);
   printf("  PRESS ANY KEY TO CONTINUE ...");
 }//end of void finddetails()


 void indireport()
 {
   clrscr();
   flushall();
   char tempname[20];
   int temproomno,i=0,check=0;
   fp=fopen("mess.dat","rb+");
   gotoxy(18,3);
   printf("ENTER YOUR NAME : ");
   fflush(stdin);
   gets(tempname);
   gotoxy(18,4);
   while(fread(&mess,sizeof(mess),1,fp)!=NULL)
   {
	if(mess.flag==1 && strstr(mess.name,tempname)!=NULL)
	{
	 clrscr();
	 check = 1;
	 gotoxy(30,2);
	 printf(" DATA ");
	 gotoxy(23,4);
	 printf("NAME        : %s",mess.name);
	 gotoxy(23,5);
	 printf("FACULTY     : %s",mess.faculty);
	 gotoxy(23,6);
	 printf("YEAR        : %d",mess.year);
	 gotoxy(23,7);
	 printf("ROOM NO.    : %d",mess.roomno);
	 gotoxy(23,8);
	 if(mess.foodtype==1)
	  printf("FOOD TYPE   : VEGETARIAN");
	 else
	 if(mess.foodtype==2)
	  printf("FOOD TYPE   : NON-VEGETARIAN");
	 else
	  printf("FOOD TYPE   : NOT SPECIFIED");
	 if(mess.accno!=-1)
	 {
	   gotoxy(23,9);
	   printf("ACCOUNT NO. : %d",mess.accno);
	   gotoxy(23,10);
	   printf("BALANCE     : Rs.%f",mess.balance);
	 }
	 else
	 {
	   gotoxy(23,10);
	   printf("YOU HAVE NO ACCOUNT");
	 }
	 gotoxy(16,14);
	 printf("PRESS ANY KEY TO CONTINUE ...");
	 getch();
	}//end of if
	i++;
   }//end of while
   if(check==0)
   {
	   gotoxy(20,7);
	   printf("NO INFORMATION FOUND ");
	   gotoxy(16,14);
	   printf("PRESS ANY KEY TO CONTINUE ...");
	   getch();
   }

	fclose(fp);
 }//end of void indirecord()


 void compreport()
 {
   clrscr();
   fp=fopen("mess.dat","rb+");
   int i=0,veg=0,nonveg=0,counter=9;
   gotoxy(20,3);
   printf("         MESS DETAILS      ");
   gotoxy(20,4);
   printf("         ออออออออออออ      ");
   gotoxy(16,5);
   printf("  NAME");
   gotoxy(16,6);
   printf("  ----");
   gotoxy(41,5);
   printf("  FOOD TYPE");
   gotoxy(41,6);
   printf("  ---------");
   gotoxy(12,8);
   printf("ษอออออออออออออออออออออออออออออออออออออออออออออออป");
   while(fread(&mess,sizeof(mess),1,fp)!=NULL)
   {
	 if(mess.flag==1)
	 {
	   gotoxy(12,counter);
	   printf("บ  %s",mess.name);
	   gotoxy(35,counter);
	   printf("บ");
	   if(mess.foodtype==1)
	   {
		 gotoxy(40,counter);
		 printf("VEGETARIAN");
		 veg++;
	   }
	   else
	   if(mess.foodtype==2)
	   {
		  gotoxy(40,counter);
		  printf("NON-VEGETARIAN");
		  nonveg++;
	   }
	   else
	   {
		  gotoxy(40,counter);
		  printf("NOT SPECIFIED");
	   }
	   gotoxy(60,counter);
	   printf("บ");
	   counter++;

	 }
	 i++;

   }//end of while
   gotoxy(12,counter);
   printf("ศอออออออออออออออออออออออออออออออออออออออออออออออผ");
   gotoxy(10,counter+2);
   printf("TOTAL    VEGETARIANS : %d",veg);
   gotoxy(40,counter+2);
   printf("NON-VEGETARIANS : %d",nonveg);
   printf("\n\n\n  PRESS ANY KEY TO CONTINUE ...");
   getch();
 }//end of void compreport()




