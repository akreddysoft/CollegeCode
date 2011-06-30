//ASSIGNMENT NO.5 STRING OPERATIONS
//WITH LIBRARY FUNCTIONS
void main()
{
 char a[10],b[10],len,i,j,k,choice;
 int flag;
 clrscr();
 printf("1 Compare\n");
 printf("2 Length\n");
 printf("3 Reverse\n");
 printf("4 Concatenation\n");
 printf("5 Copy of string\n");
 do
 {
	printf("Enter choice:");
	scanf("%d",&choice);
	switch(choice)
	{
	 case 1:
	 printf("Enter first string:");
	 scanf("%s",&a);
	 printf("Enter second string:");
	 scanf("%s",&b);
	 if(strcmp(a,b)==0)
		printf("The strings are equal\n");
	 else
		printf("The strings are not equal\n");
	 break;
	 case 2:
	 printf("Enter the string:");
	 scanf("%s",&a);
	 printf("The length of string is:%d\n",strlen(a));
	 break;
	 case 3:
	 printf("Enter the string:");
	 scanf("%s",&a);
	 printf("The reversed string is:%s\n",strrev(a));
	 break;
	 case 4:
	 printf("Enter first string:");
	 scanf("%s",&a);
	 printf("Enter second string:");
	 scanf("%s",&b);
	 strcat(a,b);
	 printf("The result is:%s\n",a);
	 break;
	 case 5:
	 printf("Enter the string:");
	 scanf("%s",&a);
	 strcpy(b,a);
	 printf("The result is:%s",b);
	 break;
	}
	printf("\nDo you want to continue(y/n):\n");
 }
 while(getch()=='y');
}
