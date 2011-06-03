#include<process.h>
#include<conio.h>
#include<string.h>
#include<ctype.h>
#include<fstream.h>
#include<stdio.h>
#include<ctype.h>
#include<dos.h>


/////////////////////// GLOBAL FUNCTIONS' DECLERATION /////////////////////////


void beep();             // Produces A Beep sound
void introduction();     // Gives The Info Of The Project
int main_menu();        // Shows The Main Menu Table
void online_help();      // Provides The Online Help To The user


void add_a_record();     // For Addition Of A new Record In The File
void delete_a_record(); // For Deletion Of A Record From the file
void modify_a_record();  // For Modifcation Of A Record In the file
void search_a_record();  // For Searching Of A Record From the file
void display_all();      // For Displaying All The Record Of the file


///////////////////////////////////////////////////////////////////////////////


class TELEPHONE
{
			     // Start Of Class TELEPHONE
     private:                // Private Members Of The Class TELEPHONE

	    char code[10];              // Customer Code Must Be Unique
	    char name[20];              // Customer Name
					// Customer Address
	    char house[5];              // House Number
	    char street[20];            // Street Name
	    char city[15];              // City Name
	    char pin[10];               // Pin Code Of The City
	    char stdcode[5];            // S.T.D. Code
	    char telno[10];             // Customer Telephone Number

     public:                 //Public Members Of The Class TELEPHONE

	    void read_object();         // For Getting Info Of The Customer
	    void display_object();      // For Displaying Customer Details
	    void modify_object();       // For Modification Of Record(s)
	    int search(char *);
					// For searching A Record
};


/////////////////////// MEMBER FUNCTIONS' OF THE CLASS 'TELEPHONE'/////////////


void TELEPHONE :: read_object()
{

	gotoxy(10,4);
	cprintf("INPUT THE CUSTOMERS DETAILS :");

	gotoxy(10,7);
	cout<<"( Code Must Be Unique )";
	gotoxy(10,6);
	cout<<"Enter The Customer Code  : ";
	gets(code);

	gotoxy(10,8);
	cout<<"Enter The Customer Name  : ";
	gets(name);

	gotoxy(10,10);
	cout<<"Enter The Address Of The Customer ....";

	gotoxy(10,12);
	cout<<"Enter The House Number   : ";
	gets(house);

	gotoxy(10,14);
	cout<<"Enter The Street Name    : ";
	gets(street);

	gotoxy(10,16);
	cout<<"Enter The City Name      : ";
	gets(city);

	gotoxy(10,18);
	cout<<"Enter The Pin Code       : ";
	gets(pin);

	gotoxy(10,20);
	cout<<"Enter The S.T.D Code     : ";
	gets(stdcode);

	gotoxy(10,22);
	cout<<"Enter   Telephone Number : ";
	gets(telno);
	gotoxy(20,25);
	cout<<"Press any key to continue ...............";
	getche();

}


////////////////////////////////////////////////////////////////////////////////


void TELEPHONE :: display_object()
{


	gotoxy(10,6);
	cout<<"THE CUSTOMER DETAILS ARE : ";

	gotoxy(10,9);
	cout<<"Customer's Code          : ";
	cout<<code;

	gotoxy(10,11);
	cout<<"Customer's Name          : ";
	cout<<name;

	gotoxy(10,12);
	cout<<"Customer's Address   >>";

	gotoxy(10,13);
	cout<<"         House Number    : ";
	cout<<house;

	gotoxy(10,14);
	cout<<"         Street Name     : ";
	cout<<street;

	gotoxy(10,15);
	cout<<"         City Name       : ";
	cout<<city;

	gotoxy(10,16);
	cout<<"         Pin Code        : ";
	cout<<pin;

	gotoxy(10,18);
	cout<<"Telephone Number         : ";
	    if(strlen(stdcode)>0)
	       cout<<"("<<stdcode<<") ";
	cout<<telno;
	gotoxy(20,24);
	cout<<"Press any key to continue ...............";
	getche();

}


////////////////////////////////////////////////////////////////////////////////


void TELEPHONE :: modify_object()
{

    char ch;

    do
    {
       clrscr();

       gotoxy(30,2);
       textcolor(15+BLINK);
       cprintf("MODIFICATION OF A RECORD");
       textcolor(15);


       gotoxy(10,6);
       cout<<"A. Code                   : "<<code<<endl;

       gotoxy(10,8);
       cout<<"B. Name                   : "<<name<<endl;

       gotoxy(10,10);
       cout<<"C. Address - House Number : "<<house<<endl;

       gotoxy(10,11);
       cout<<"D.                Street  : "<<street<<endl;

       gotoxy(10,12);
       cout<<"E.                 City   : "<<city<<endl;

       gotoxy(10,13);
       cout<<"F.             Pin Code   : "<<pin<<endl;

       gotoxy(10,15);
       cout<<"G. S.T.D. Code            : "<<stdcode<<endl;

       gotoxy(10,17);
       cout<<"H. Telephone Number       : "<<telno<<endl;

       gotoxy(10,19);
       cout<<"I. No Modification....................."<<endl;

       gotoxy(10,22);
       cout<<"Enter Your Choice (A - I) : ";
       ch=getch();

       clrscr();


       switch(ch)
       {

	    case 'a' :
	    case 'A' :  gotoxy(10,5);
			cout<<"Enter The New Customer Code : ";
			gets(code);
			break;


	    case 'b' :
	    case 'B' :  gotoxy(10,5);
			cout<<"Enter The New Customer Name : ";
			gets(name);
			break;


	    case 'c' :
	    case 'C' :  gotoxy(10,5);
			cout<<"Enter The New House Number : ";
			gets(house);
			break;


	    case 'd' :
	    case 'D' :  gotoxy(10,5);
			cout<<"Enter The New Street Name : ";
			gets(street);
			break;


	    case 'e' :
	    case 'E' :  gotoxy(10,5);
			cout<<"Enter The New City Name : ";
			gets(city);
			break;


	    case 'f' :
	    case 'F' :  gotoxy(10,5);
			cout<<"Enter The New Pin Code : ";
			gets(pin);
			break;


	    case 'g' :
	    case 'G' :  gotoxy(10,5);
			cout<<"Enter The New S.T.D. Code : ";
			gets(stdcode);
			break;


	    case 'h' :
	    case 'H' :  gotoxy(10,5);
			cout<<"Enter The New Telephone Number : ";
			gets(telno);
			break;

	    case 'i' :
	    case 'I' :  break;

	    default :   beep();

       }                // End Of Switch (Case)

    }while(ch!='i'&&ch!='I');     // End Of Do While Loop


}


///////////////////////////////////////////////////////////////////////////////


int TELEPHONE :: search(char *search_string)
{

     if(strcmp(code,search_string)==0 || strcmp(name,search_string)==0 || strcmp(telno,search_string)==0)
     {

	  return 1;         //Search Successful

     }

     else
     {

	  return 0;         //Search Unsuccessful

     }

}


///////////////////////////////////////////////////////////////////////////////


			//**  MAIN FUNCTION  **//


void main()
{    clrscr();
     textcolor(15);
     textbackground(1);
			     // Start Of main
     int choice;
     char pass[10]="quarter",test[10],access1[30]="ACCESS PERMITTED";
     int k=0;
     int i=0,j,flag=0;
     gotoxy(20,10);
    cout<<"旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴커";
    gotoxy(20,11);
    cout<<"� ENTER THE PASSWORD :         �";
    gotoxy(20,12);
    cout<<"읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸";
    gotoxy(42,11);
    while(i<10)
    { test[i]=getch();

      if(test[i]=='\r')
      {
	break;
      }

      i++;
      cout<<"*";
    }
    test[i]='\0';
    gotoxy(20,17);

     if(strcmp(test,pass)==0)
     {  flag=0;
	clrscr();
	gotoxy(20,11);
	cout<<"PASSWORD CORRECT";
	gotoxy(20,13);
	while(access1[k]!='\0')
	{
	 delay(50);
	 cout<<access1[k];
	 k++;
	}
	delay(1000);
      }

      else
      { clrscr();
	flag=1;
	gotoxy(20,11);
	cout<<"PASSWORD INCORRECT ";
	gotoxy(20,13);
	cout<<"ACCESS DENIED ";
	getch();
	exit(0);
      }




	if(flag==0)
	{

     textcolor(15);
     textbackground(1);
     clrscr();

     introduction();
     clrscr();

    do
     {
	choice= main_menu();
	clrscr();
	switch(choice)
	  {

		case 1 : add_a_record(); 	break;

		case 2 : delete_a_record();	break;

		case 3 : modify_a_record();	break;

		case 4 : search_a_record();	break;

		case 5 : display_all();	break;

		case 6 : online_help();	break;

		case 7 : break;

		default  : beep();
	  }

     }while(choice!=7);

     }
     clrscr();

}                              //  End of MAIN Function


///////////////////////////////////////////////////////////////////////////////

		      //    USER DEFINED FUNCTIONS   //
//////////////////***** GLOBAL FUNCTIONS' DEFINATIONS *****////////////////////


TELEPHONE TEL;


void beep()
{

	sound(1000);

	delay(100);

	nosound();

}


///////////////////////////////////////////////////////////////////////////////


void add_a_record()
{

	fstream f_add1("TELE.dat",ios::app);

	gotoxy(30,2);
	textcolor(15+BLINK);
	cprintf("ADDITION OF A RECORD");
	textcolor(15);

	TEL.read_object();

	f_add1.write((char *)&TEL,sizeof(TEL));

	f_add1.close();

}


///////////////////////////////////////////////////////////////////////////////


void delete_a_record()
{

	char *search_string;
	char choice;
	int flag=0;

	ifstream f_del1("TELE.DAT");
	ofstream f_del2("TEMP.DAT");
	gotoxy(30,2);
	textcolor(15+BLINK);
	cprintf("DELETION OF A RECORD");
	textcolor(15);

	cout<<"\n\n\n\nEnter The Name ( or Customer code or Telephone number )";
	cout<<"\nOf The Customer You Want To Delete : ";
	gets(search_string);

	f_del1.read((char *)&TEL,sizeof(TEL));

	while(!f_del1.eof())
	{

	     if(TEL.search(search_string)!=1)
	     {

		  f_del2.write((char *)&TEL,sizeof(TEL));

	     }

	     else
	     {
		  flag++;

		  clrscr();
		  gotoxy(30,2);
		  textcolor(15+BLINK);
		  cprintf("RECORD FOR DELETION");
		  textcolor(15);
		  TEL.display_object();
		  gotoxy(1,24);
		  cout<<"                    Do You Really Want To Delete This Record\n";
		  cout<<"                           Enter Your Choice ('Y'/'N') : ";
		  choice=getch();
		  if(choice=='n'||choice=='N')
		    f_del2.write((char *)&TEL,sizeof(TEL));

	     }

	     f_del1.read((char *)&TEL,sizeof(TEL));
	}

	f_del1.close();
	f_del2.close();


	if(flag==0)
	{
	     clrscr();
	     cout<<"\n\n\n\n\n\n\n\n";
	     cout<<"                  Error Message :  No Record With Such Name";
	     cout<<"\n             (Or Telephone Number Or Customer Code ) Exist....";
	     gotoxy(20,24);
	     cout<<"Press any key to continue ...............";
	     getch();



	}

	else

	{
	remove("TELE.DAT");
	rename("TEMP.DAT","TELE.DAT");
	}

}


///////////////////////////////////////////////////////////////////////////////


void modify_a_record()
{
	char *search_string;
	int flag=0;

	ifstream f_mod1;
	ofstream f_mod2;
	f_mod1.open("TELE.DAT");
	f_mod2.open("TEMP.DAT");

	gotoxy(30,2);
	textcolor(15+BLINK);
	cprintf("MODIFICATION OF A RECORD");
	textcolor(15);

	cout<<"\n\n\n\nEnter The Name ( or Customer code or Telephone number )";
	cout<<"\nOf The Customer You Want To Modify : ";

	gets(search_string);

	f_mod1.read((char *)&TEL,sizeof(TEL));

	while(!f_mod1.eof())
	{


	      if(TEL.search(search_string)==1)
	      {
		  flag++;

		  TEL.modify_object();

	      }

	      f_mod2.write((char *)&TEL,sizeof(TEL));
	      f_mod1.read((char *)&TEL,sizeof(TEL));
	}

	f_mod1.close();
	f_mod2.close();
	if(flag==0)
	{
	     clrscr();
	     cout<<"\n\n\n\n\n\n\n\n";
	     cout<<"                  Error Message :  No Record With Such Name";
	     cout<<"\n             (Or Telephone Number Or Customer Code ) Exist....";
	     gotoxy(20,24);
	     cout<<"Press any key to continue ...............";
	     getch();



	}

	else

	{

	remove("TELE.DAT");
	rename("TEMP.DAT","TELE.DAT");

	}


}


///////////////////////////////////////////////////////////////////////////////


void search_a_record()
{

	ifstream f;
	f.open("TELE.DAT");
	char *search_string;
	clrscr();
	gotoxy(30,2);
	textcolor(15+BLINK);
	cprintf("SEARCH FOR A RECORD");
	textcolor(15);
	cout<<"\n\n\n\n";
	cout<<"How Do You Wish To Search The Customer's Details ?"<<endl;
	cout<<"\nEnter The Name (Or The Telephone Number Or the Customer Code)";
	cout<<"\nOf The Customer To Be Searched : ";
	gets(search_string);

	int flag=0;
	f.read((char *)&TEL,sizeof(TEL));

	while(!f.eof())
	{

	       if(TEL.search(search_string)!=0)
	       {
		    clrscr();
		    gotoxy(30,2);
		    textcolor(15+BLINK);
		    cprintf("FOUND A RECORD");
		    textcolor(15);
		    TEL.display_object();
		    flag++;

	       }

	       f.read((char *)&TEL,sizeof(TEL));
	}
	f.close();
	clrscr();
	cout<<"\n\n\n\n\n\n\n\n";
	if(flag==0)
	{

	     cout<<"                  Error Message :  No Record With Such Name";
	     cout<<"\n             (Or Telephone Number Or Customer Code ) Exist....";


	}

	else
	{

	     cout<<"                       Total Number Of Record(s) Found : "<<flag<<endl;

	}


	gotoxy(20,25);
	cout<<"Press any key to continue ...............";
	getch();
}


///////////////////////////////////////////////////////////////////////////////


void display_all()
{

	ifstream f_show("TELE.DAT");
	f_show.read((char *)&TEL,sizeof(TEL));

	while(!f_show.eof())
	{
		clrscr();
		gotoxy(30,2);
		textcolor(15+BLINK);
		cprintf("DISPLAY ALL RECORD(S)");
		textcolor(15);
		TEL.display_object();
		f_show.read((char *)&TEL,sizeof(TEL));
	}

	f_show.close();

}


//////////////////////////////////////////////////////////////////////////////


int main_menu()
{

	clrscr();


	gotoxy(20,3);
	textcolor(15+BLINK);
	cprintf("******::::::::::::::::::::::::::::::::::******\n");

	gotoxy(30,5);
	textcolor(15);
	cprintf("####### MAIN MENU #######\n");

	gotoxy(20,7);
	cout<<"# 1...ADDITION OF NEW RECORD(S)\n";

	gotoxy(20,9);
	cout<<"# 2...DELETION OF EXISTING RECORD(S)\n";

	gotoxy(20,11);
	cout<<"# 3...MODIFICATION OF EXISTING RECORD(S)\n";

	gotoxy(20,13);
	cout<<"# 4...SEARCHING OF RECORD(S)\n";

	gotoxy(20,15);
	cout<<"# 5...DISPLAYING ALL THE EXISTING RECORD(S)\n";

	gotoxy(20,17);
	cout<<"# 6...ONLINE---HELP !!!!!\n";

	gotoxy(20,19);
	cout<<"# 7...QUIT !!!!!\n";
	textcolor(15+BLINK);
	gotoxy(20,21);
	cprintf("******::::::::::::::::::::::::::::::::::******\n");
	textcolor(15);
       int ch=7;
       char c;
       gotoxy(20,19);
       do
       {
	c=getch();
	if(c==72)
	 if(wherey()==7)
	  {gotoxy(20,19);
	   ch=7;
	  }
	 else
	  {gotoxy(20,wherey()-2);
	   ch--;
	  }
	if(c==80)
	 if(wherey()==19)
	  {gotoxy(20,7);
	   ch=1;
	  }
	 else
	  {gotoxy(20,wherey()+2);
	   ch++;
	  }
	}while(c!=13);
	return(ch);

      }


///////////////////////////////////////////////////////////////////////////////


void introduction()
{

      clrscr();

      gotoxy(25,10);
      textcolor(4+BLINK);
      cprintf("**** WELCOME TO THE PROJECT ****");
      textcolor(15);
      gotoxy(36,19);
      cout<<"Made by";
      gotoxy(29,21);
      cout<<"Nitin & Anshul";
      gotoxy(31,22);
      cout<<"Press any key to continue ...............";
      getch();




      clrscr();
      gotoxy(25,2);
      textcolor(15+BLINK);
      cprintf("**** WELCOME TO THE PROJECT ****");
      textcolor(15);


      gotoxy(10,5);
      cout<<"THIS  PROJECT  ON  TELEPHONE  DIRECTORY  HAS  THE  FACILITY  OF";

      gotoxy(10,7);
      cout<<"ADDITION  OF  NEW  CUSTOMERS'  RECORDS ,  DELETION  OF  RECORDS";

      gotoxy(10,9);
      cout<<"MODIFICATION OF RECORDS, SEARCHING OF RECORDS (BY-NAME OR CODE)";

      gotoxy(10,11);
      cout<<"AND  SHOWING  THE  DETAILS  OF   ALL  THE  CUSTOMERS'  RECORDS.";

      gotoxy(10,13);
      cout<<"THE DETAILS OF A PARTICULAR  RECORD  CONSISTS OF THE  FOLLOWING";

      gotoxy(10,15);
      cout<<"DATA ->   CUSTOMER CODE NUMBER, CUSTOMER NAME, CUSTOMER ADDRESS";

      gotoxy(10,17);
      cout<<"( HOUSE NUMBER , STREET , CITY , PINCODE ), STD-CODE NUMBER AND";

      gotoxy(10,19);
      cout<<"                     ''TELEPHONE NUMBER''.";
      gotoxy(25,22);
      textcolor(15+BLINK);
      cprintf("***** TELEPHONE--DIRECTORY *****");
      textcolor(15);
      gotoxy(20,25);
      cout<<"Press any key to continue ...............";
      getch();

}


/////////////////////////////////////////////////////////////////////////////////


void online_help()
{

	clrscr();

	textcolor(15+BLINK);
	cprintf("                   HERE IS THE ONLINE HELP FOR YOU ... !!!!!");
	textcolor(15);
	cout<<"\n\n\n1.   Add A Record     : Allows The Addition Of A New Record To The Record List";
	cout<<"\n\t\t\tIt Enables The Input Of A New  Customer's Code Number,";
	cout<<"\n\t\t\tName, Address, (House No., Street, City, Pincode ),STD";
	cout<<"\n\t\t\tCode & Telephone Number";
	cout<<"\n\n2. Delete A Record    : Allows The Deletion Of Existing  Record  From The List";
	cout<<"\n\n3. Modify a Record    : Allows The Changing Of The Data Of Record(s)";
	cout<<"\n\n4. Search A Record    : Allows The Searching Of Particular Record As Specified";
	cout<<"\n\t\t\tBy The User.Search Is Based On Name or Customer Code";
	cout<<"\n\n5. Display Record     : Lists Details Of All The Customers' Record";
	cout<<"\n\n6. Online Help        : Is What We Are Providing You Here !!!!!!";
	cout<<"\n\n7. Quit               : To quit from the program\n\n ";
	textcolor(15+BLINK);
	cprintf("                  A Beep Sound Will Be Made for any mistake!");
	textcolor(15);
	gotoxy(20,25);
	cout<<"Press any key to continue ...............";
	getch();
	}

//////////////////////////******* THE  END ********//////////////////////////






