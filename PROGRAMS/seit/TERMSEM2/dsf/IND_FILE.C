/* TO IMPLEMENT A SIMPLE INDEX SEQUENTIAL FILE */
#include<stdio.h>
#include<conio.h>
#include<string.h>
#include<stdlib.h>
#include<alloc.h>

struct student
{
	int num, m[5], sno;
	char name[30];
}a;
struct t
{
	int num, m[5], sno;
	char name[30];
	struct t *right, *left;
}*start, *p, *s, *temp, *r, *w, *u;

int i=0, no, k=0;

FILE *fp, *ft;

void main()
{
	void input(void);
	void output(void);
	void index(void);
	char an, ch1;
	int ch, mod, loc=0, flag =0;

	do
	{
		clrscr();
		printf("\n\t\t INDEXED SEQUENTIAL FILES \n");
		printf("\n\t\t 1.Create a file ");
		printf("\n\t\t 2. Display the file ");
		printf("\n\t\t 3. Delete a record");
		printf("\n\t\t 4. Search a record");
		printf("\n\t\t 5. Exit");
		printf("\n\t\t Enter your choice");
		scanf("%d",&ch);

		switch(ch)
		{
			case 1:
				fp = fopen("student.dat","ab");
				do
				{
					clrscr();
					printf("\n Enter the data :");
					fseek(fp, 0, SEEK_END);
					input();
					fwrite(&a, sizeof(a),1,fp);
					printf("\n Do you want to add more ");
					flushall();
					scanf("%c",&ch1);
				} while( ch1 == 'y' || ch1 == 'Y');
				fclose(fp);
				index();
				break;
			case 2:
				clrscr();
				fp = fopen("student.dat","rb");
				rewind(fp);
				printf("\n The records are as follows :");
				while( fread(&a, sizeof(a), 1, fp) == 1)
				{
					output();
				}
				fclose(fp);
				break;
			case 3:
				do
				{
					clrscr();
					printf("\n Enter the roll number to be deleted :");
					scanf("%d",&mod);
					fp = fopen("student.dat", "rb+");
					ft = fopen("delete.dat","wb");
					rewind(fp);
					while( fread(&a, sizeof(a), 1,fp) == 1)
					{
						if ( mod != a.num)
						fwrite( &a,sizeof(a), 1,ft);
					}
					printf("\n Do you want to delete more ");
					flushall();
					scanf("%c",&ch1);
				} while( ch1 == 'y' || ch1 == 'Y');
				fclose(fp);
				fclose(ft);
				remove("student.dat");
				rename("delete.dat", "student.dat");
				break;
		case 4 :
			do
			{
				clrscr();
				loc = 0;
				printf("\n Enter the roll number to be searched :");
				scanf("%d",&mod);
				fp = fopen("student.dat","rb+");
				if ( fp == NULL)
					printf("\n Error in accessing the file ");
				else
				{
					fseek( fp, 0,0);
					while( fread(&a, sizeof(a), 1, fp) == 1)
					{
						loc++;
						if ( mod == a.num)
						{
							printf("\n Record found location %d",loc);
							output();
							flag = 1;
						}
					}
					if ( flag != 1)
						printf("Record not found ");
				}
				printf("\n Do you want to search more ");
				flushall();
				scanf("%c",&ch1);
			} while( ch1 == 'y' || ch1 == 'Y');
			break;
		case 5:
			exit(1);
			break;
		default :
			printf("\n Enter proper choice");
			break;
		}
	printf("\n Do you want to continue ");
	flushall();
	scanf("%c",&an);
	} while( an == 'y' || an == 'Y');
}


void input()
{
	k++;
	a.sno = k;
	printf("\n Enter the number : ");
	scanf("%d",&a.num);
	printf("\n Enter the name : ");
	flushall();
	scanf("%s",a.name);
	printf("\n Enter the marks for five subjects : \n");
	for( i=0; i<5; i++)
	{
		printf("Subject..%d=", i+1);
		scanf("%d",&a.m[i]);
	}
}

void output()
{
	printf("\n Serial number : %d", a.sno);
	printf("\n Roll number   : %d", a.num);
	printf("\n Name          : %s", a.name);
	printf("\n Marks :");
	for( i=0; i<5; i++)
		printf("%4d",a.m[i]);
}

void index()
{
	int key;
	struct student t;
	fp = fopen("student.dat", "rb+");
	if ( fp == NULL)
	{
		printf("\n Error in opening file \n");
		return;
	}
	ft = fopen("index.dat", "wb");
	if ( ft == NULL)
	{
		printf("\n Error in opening file");
		return;
	}
	while(!feof(fp))
	{
		fread(&t, sizeof(t), 1, fp);
		key = t.num;
		fwrite( &key, sizeof(key),1,ft);
	}
	fclose(fp);
	fclose(ft);
}



