//ASSIGNMENT NO.11
//FILE HANDLING
#include<stdio.h>
void sort(char[20][20],int);
void clear(char[20][20]);
void main()
{
 FILE *fp,*ft;
 char another,choice,list[20][20];
 struct emp
 {
	char name[20];
	char add[20];
	long tel;
 };
 struct emp e;
 char empname[40];
 long int recsize,flag,i,n,j;
 clrscr();
 fp=fopen("EMP.DAT","rb+");
 if(fp==NULL)
 {
	fp=fopen("EMP.DAT","wb+");
	if(fp==NULL)
	{
	 puts("Cannot open");
	 exit();
	}
 }
	recsize=sizeof(e);
	printf("\n 1 Add records");
	printf("\n 2 List records");
	printf("\n 3 Modify records");
	printf("\n 4 Delete record");
	printf("\n 5 Retreive record");
	printf("\n 0 Exit");
	while(1)
	{
	printf("\n Your choice:");
	fflush(stdin);
	choice=getche();
	switch(choice)
	{
	 case '1':
	 fseek(fp,0,SEEK_END);
	 another='y';
	 while(another=='y')
	 {
		printf("\n Enter name,address,tel no:");
		scanf("%s %s %ld",e.name,e.add,&e.tel);
		fwrite(&e,recsize,1,fp);
		printf("\n Add another:");
		fflush(stdin);
		another=getche();
	 }
	 break;

	 case '2':
	 ft=fopen("TEMP.DAT","wb");
	 rewind(fp);
	 n=0;
	 while(fread(&e,recsize,1,fp)==1)
	 {
		 strcpy(list[n],e.name);
		 ++n;
	 }
	 sort(list,n);
	 rewind(ft);
	 rewind(fp);
	 i=0;
	 while((fread(&e,recsize,1,fp)==1)&&(n!=i))
	 {
		while(strcmp(list[i],e.name)==0)
		{
		 fwrite(&e,recsize,1,ft);
		 ++i;
		 rewind(fp);
		}
	 }
	 fclose(ft);
	 fclose(fp);
	 remove("EMP.DAT");
	 rename("TEMP.DAT","EMP.DAT");
	 fp=fopen("EMP.DAT","rb+");
	 rewind(fp);
	 flag=0;
	 while(fread(&e,recsize,1,fp)==1)
	 {
		 flag=1;
		 printf("\n %s %s %ld",e.name,e.add,e.tel);
	 }
	 if(!flag)
	 printf("\n No record");
		 break;

	 case '3':
	 another='y';
	 flag=0;
	 while(another=='y')
	 {
		printf("\n Enter name of emp to modify:");
		scanf("%s",empname);
		rewind(fp);
		while(fread(&e,recsize,1,fp)==1)
		{
		 if(strcmp(e.name,empname)==0)
		 {
			flag=1;
			printf("\n Enter new name,add,tel:");
			scanf("%s %s %ld",e.name,e.add,&e.tel);
			fseek(fp,-recsize,SEEK_CUR);
			fwrite(&e,recsize,1,fp);
			break;
		 }
	 }
		if(!flag)
		printf("\nNo record\n");
		printf("\n modify another:");
    fflush(stdin);
    another=getche();
	 }
	 break;

   case '4':
   flag=0;
   another='y';
   while(another=='y')
	 {
		flag=0;
    printf("\n enter name of emp to delete:");
    scanf("%s",empname);
    ft=fopen("TEMP.DAT","wb");
    rewind(fp);
    while(fread(&e,recsize,1,fp)==1)
    {
     if(strcmp(e.name,empname)!=0)
	 fwrite(&e,recsize,1,ft);
     else
     flag=1;
    }
		if(!flag)
		printf("\nNo record");
    fclose(ft);
    fclose(fp);
    remove("EMP.DAT");
    rename("TEMP.DAT","EMP.DAT");
    fp=fopen("EMP.DAT","rb+");
		printf("Delete another:");
		fflush(stdin);
    another=getche();
   }
   break;

   case '5':
   printf("\nEnter name of emp to retreive:");
   flag=0;
   scanf("%s",empname);
    rewind(fp);
    while(fread(&e,recsize,1,fp)==1)
    {
		 if(strcmp(e.name,empname)==0)
		 {
			flag=1;
			printf("\n%s %s %ld",e.name,e.add,e.tel);
		}}
	 if(!flag)
	 printf("\nNo record");
	 break;

   case '0':
   fclose(fp);
   exit();
  }
  }
  }

void sort(char list[20][20],int n)
{
 int i=0,j,l=0,flag=1;
 char temp[20];
 while(i<n&&flag)
 {
	flag=0;
	i++;
	for(j=0;j<n-i;++j)
	{
	 while(list[j][l]==list[j+1][l])
		 ++l;
	 if(list[j][l]>list[j+1][l])
	 {
		strcpy(temp,list[j]);
		strcpy(list[j],list[j+1]);
		strcpy(list[j+1],temp);
		flag=1;
	 }
	l=0;
	}
 }
}

/*OUTPUT
 1 Add records
 2 List records
 3 Modify records
 4 Delete record
 5 Retreive record
 0 Exit
 Your choice:1
 Enter name,address,tel no:madhur uu23 349349

 Add another:n
 Your choice:2
 madhur uu23 349349
 Your choice:3
 Enter name of emp to modify:madhur

 Enter new name,add,tel:mad u43 45895

 modify another:n
 Your choice:5
Enter name of emp to retreive:mad

mad u43 45895
 Your choice:0
*/



