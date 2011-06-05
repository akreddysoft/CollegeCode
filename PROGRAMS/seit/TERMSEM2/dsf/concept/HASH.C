/* Program to implement hashing with linear probing */
#include<stdio.h>
#include<string.h>

struct hashtable
{
	char str[80];
	int flag;
};
struct hashtable t[10];
char data[10][20];
int n;

void main()
{
	void enter_data();
	void non_rep();
	void rep();
	void display();
	void searching(char *);

	int choice,i;
	char src[80];

	clrscr();
	enter_data();
	non_rep();

	clrscr();
	printf("\n Linear probing without replacement ");
	display();
	getch();


	for(i=0; i<10; i++)
	{
		strset(t[i].str,' ');
		t[i].flag = 0;
	}

	rep();
	printf("\n Linear probing with replacement ");
	display();
	getch();

	clrscr();
	printf("\n Enter data to search ");
	scanf("%s",src);
	searching(src);

	getch();
}

/********FUNCTION TO ENTER DATA **************************/
void enter_data()
{
	int i;
	printf("\n How many strings do you want to enter :");
	scanf("%d",&n);

	for( i=0; i<n; i++)
	{
		printf("\n String%d :",i+1);
		scanf("%s",data[i]);
	}
	return;
}
/***************************FUNCTION TO DISPLAY DATA & HASH TABLE *****/
void display()
{
	int i;

	printf("\n Data you have entered is ");
	for(i=0; i<n; i++)
		printf("\n %s", data[i]);

	printf("\n\n HASH TABLE");
	printf("\n--------------------------------------------------------------");
	printf("\n BUCKET\t\tSTRING 	");
	printf("\n--------------------------------------------------------------");

	for(i=0; i<10; i++)
	{
		printf("\n%d",i);
		if (t[i].flag == 1)
			printf("\t\t %s",t[i].str);
		else
			printf("\t\t(empty bucket)");
	}
	return;
}

/***********FUNCTION TO PERFORM HASHING **************************/
void non_rep()
{
	int i,j,k;
	char ans;
	int sum, key;

	for(i=0; i<10; i++)
		t[i].flag = 0;

	for(i=0; i<n; i++)
	{
		sum = 0;
		for(j=0; data[i][j] != '\0'; j++)
			sum += data[i][j];
		key = sum % 10;

		if ( t[key].flag == 0)
		{
			strcpy(t[key].str, data[i]);
			t[key].flag = 1;
		}
		else
		{
			k =key;
			while( t[k].flag != 0)
				k++;
			strcpy(t[k].str, data[i]);
			t[k].flag = 1;
		}
	}
	return;
}

void rep()
{
	int i,j,k;
	char ans;
	int sum, key, key1;
	struct hashtable temp;

	for(i=0; i<10; i++)
		t[i].flag = 0;

	for(i=0; i<n;i++)
	{
		sum = 0;
		for(j=0; data[i][j] != '\0'; j++)
			sum += data[i][j];
		key = sum % 10;

		if ( t[key].flag == 0)
		{
			strcpy(t[key].str, data[i]);
			t[key].flag = 1;
		}
		else
		{
			for( j=0; t[key].str[j] != '\0'; j++)
				sum += t[key].str[j];

				key1 = sum % 10;

				if ( key1 == key)
				{
					k =key;
					while( t[k].flag != 0)
					k++;
					strcpy(t[k].str, data[i]);
					t[k].flag = 1;
				}
				else
				{
					strcpy(temp.str, t[key].str);
					strcpy(t[key].str, data[i]);
					k = key;
					while( t[k].flag != 0)
						k++;
					strcpy(t[k].str, temp.str);
					t[k].flag = 1;
				}
			}
		}
		return;
	}


   /****************** FUNCTION TO PERFORM SEARCHING **********************/
void searching( char x[80])
{
	int key, sum;
	int i,j;

	sum = 0;
	for(i=0; x[i] != '\0' ; i++)
		sum += x[i];

	key = sum % 10;
	i = key;

	while((t[i].flag != 0) && ( (j = strcmp(x, t[i].str)) != 0))
		i++;

	if ( t[i].flag == 0)
		printf("\n Search string is absent in the hash table ");
	else
		printf("\n Search string is present in hash table ");

	return;


}































