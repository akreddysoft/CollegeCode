/* record number is obtained from it's primary key and with  hashing
function */

/*********** DIRECT ACCESS FILE ******************************/
#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#include<string.h>
#define MAX 5

struct stud
{
	int roll, link;
	char name[10], tag;
};

typedef struct stud  stud;
stud s, s1;
FILE *fp, *ft;
void add_record(void);
void view(void);
void insert(int r, char n[10]);
void del_record( void);

void main()
{
	int i, op;
	clrscr();
	fp = fopen("work.dat","wb");
	if ( fp == NULL)
	{
		printf("\n Can not open a file ");
		exit(0);
	}
	fclose(fp);
	while( op != 4)
	{
		printf("\n \t\t Menu");
		printf("\n \t\t 1. Add record");
		printf("\n \t\t 2. Delete");
		printf("\n \t\t 3. Display");
		printf("\n \t\t 4. Exit");
		printf("\n Enter your choice :");
		scanf("%d",&op);

		switch(op)
		{
			case 1 : add_record();
				break;
			case 2 : del_record();
				break;
			case 3 : view();
				break;
			case 4 : break;
		}
			printf("\n");
	}
	getch();
}
void add_record( void)
{
	int key, r, check;
	char n[10];
	fp = fopen("work.dat", "rb+");
	if ( fp==NULL)
	{
		printf("\n Error: can not open a file");
		exit(0);
	}
	printf("\n Enter roll-no");
	scanf("%d",&r);
	printf("\n Enter name :");
	scanf("%s",n);
	key = r % 10;

	fseek( fp, ( key*MAX) * sizeof(stud),0);
	check = fread( &s,sizeof(s),1,fp);

	/* fread returns 0 so there is no record at that position so we can
	write it */

	if ( check == 0 || s.tag != 't')
	{
		fseek( fp, key*MAX*sizeof(stud),0);
		s.roll=r;
		strcpy(s.name, n);
		s.tag = 't';
		s.link = 0;
		fwrite(&s,sizeof(s), 1, fp);
		fclose(fp);
	}
	else
	{
		fclose(fp); //position contains valid record so rehash
		insert(r,n);
	}
} // end of add_record

void insert( int r, char n[10])
{
	int key, check, flag, count = 0, offset;
	key = r%10;
	fp = fopen("work.dat", "rb+");
	fseek( fp, key*MAX*sizeof(s),0);
	check = fread( &s, sizeof(s),1,fp);
	do
	{
		if ( check == 1 && s.tag == 't') //valid record exists
		{
			if ( s.link == 0)
			{
				flag = 0;
				s1.tag = s.tag;
				strcpy(s1.name, s.name);
				s1.roll = s.roll;
				s1.link = 1;
			}
			else
			{
				flag = 1;
				count++;
				fseek(fp, 0, 1);
				check = fread(&s, sizeof(s), 1,fp);
			}
		}
		else
		flag = 0 ;
	} while( flag == 1);
	fseek(fp,0,1);
	s.tag = 't';
	s.roll = r;
	strcpy(s.name, n);
	fwrite(&s, sizeof(s), 1, fp);
	fclose(fp);

	// Now make a link of previous record
	fp = fopen("work.dat", "rb+");
	offset = ((key * MAX)+count) * sizeof(s);
	fseek(fp, offset,0);
	fwrite( &s1, sizeof(s1), 1, fp);
	fclose(fp);
}
void view( void)
{
	int r, check, key, flag;
	fp = fopen("work.dat", "rb");
	printf("\n Enter a roll-no to display record");
	scanf("%d",&r);
	key = r%10;

	// check for a valid record
	fseek(fp, key*MAX*sizeof(stud),0);
	check = fread (&s, sizeof(s), 1,fp);
	do
	{
		if (check == 1)
		{
			if ( s.tag == 't' && s.roll == r)
			{
				flag = 0;
				printf("\n roll-no = %d",s.roll);
				printf("\n Name: %s",s.name) ;
			}
			else
			{
				flag = 1;
				fseek( fp,0,1);
				check = fread(&s, sizeof(s), 1,fp);
			}
		}
		else
		{
			printf("\n Record does not exists ");
			flag = 0;
		}
		} while( flag == 1);
	fclose(fp);
} //end of view

void del_record()
{
	int r, check, key, flag, pos, count = 0, count1 = 0;
	fp = fopen("work.dat", "rb+");
	printf("\n Enter a roll-no of record to be deleted :");
	scanf("%d",&r);
	key = r % 10;

	//chech for a valid record
	fseek( fp, key * MAX * sizeof(stud), 0);
	check = fread( &s, sizeof(s), 1, fp);

	do
	{
		if ( s.tag == 't' && check == 1) //position contais valid record
		{
			if ( s.roll == r)
				flag = 0;
			else
			{
				flag = 1;
				count++;
				fseek(fp,0,1);
				check = fread( &s, sizeof(s), 1,fp);
			}
		}
		else
		{
			printf("\n Sorry");
			flag = 0;
		}
		} while( flag == 1);
		pos = ( key * MAX) + count;
		fseek( fp, (pos) * sizeof(stud),0);
		s.tag = 'f';
		fwrite( &s, sizeof(s), 1,fp);

		ft = fopen( "temp.dat", "wb");
		if ( ft == NULL)
		{
			printf("\n Error can not open a file");
			exit(0);
		}
		fclose(ft);

		ft = fopen( "temp.dat", "a+b");
		fseek( fp,0,0);
		while(feof(fp) == 0)
		{
			check = fread( &s, sizeof(s), 1, fp);
			if ( check == 1 && s.tag == 't')
				fwrite( &s, sizeof(s), 1,ft);
		}
		fclose(fp);
		fclose(ft);

		//rename temp by our file
		rename( "work.dat", "temp.dat");
}




