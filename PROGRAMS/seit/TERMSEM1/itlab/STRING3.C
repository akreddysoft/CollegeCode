//ASSIGNMENT NO.4 STRING OPERATIONS
void compare(char[],char[]);
void len1(char []);
void rev(char[]);
void concat(char[],char[]);
void palin(char[]);
void copy(char[]);
void main()
{
 char a[10],b[10],len,i,j,k,choice;
 clrscr();
 printf("1 Compare\n");
 printf("2 Length\n");
 printf("3 Reverse\n");
 printf("4 Concatenation\n");
 printf("5 Copy  of string\n");
 printf("6 Palindrome\n");
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
	 compare(a,b);
	 break;
	 case 2:
	 printf("Enter the string:");
	 scanf("%s",&a);
	 len1(a);
	 break;
	 case 3:
	 printf("Enter the string:");
	 scanf("%s",&a);
	 rev(a);
	 break;
	 case 4:
	 printf("Enter first string:");
	 scanf("%s",&a);
	 printf("Enter second string:");
	 scanf("%s",&b);
	 concat(a,b);
	 break;
	 case 5:
	 printf("Enter the string:");
	 scanf("%s",&a);
	 copy(a);
	 break;
	 case 6:
	 printf("Enter the string:");
	 scanf("%s",&a);
	 palin(a);
	}
	printf("\nDo you want to continue(y/n):\n");
 }
 while(getch()=='y');
}

void compare(char str1[20],char str2[20])
{
 int i,len1,len2,flag;
 i=0;
 while(str1[i])
	++i;
 len1=i;
 i=0;
 while(str2[i])
	++i;
 len2=i;
 for(i=0;i<len1;++i)
 {
	if(str1[i]==str2[i])
	 flag=1;
	else
	{
	 flag=0;
	 break;
	}
 }
 if(flag==1&&len1==len2)
	printf("Strings are equal");
 else
	printf("Strings are not equal");
}

void len1(char str[10])
{
 int i=0,len;
 while(str[i])
 ++i;
 len=i;
 printf("%s %d","the length of string is:",len);
 getch();
}
void rev(char str[10])
{
 int i=0;
 while(str[i])
 ++i;
 while(i>=0)
 {
	printf("%c",str[i]);
	--i;
 }
}
void concat(char a[10],char b[10])
{
 char c[20];
 int i=0,j=0;
 while(a[i])
 {
	 c[i]=a[i];
	 ++i;
 }

 while(b[j])
 {
	c[i]=b[j];
	++i;
	++j;
 }
 c[i]=0;
 printf("%s",c);
}

void palin(char str[10])
{
 int i=0,len,flag,last,first;
 while(str[i])
	++i;
 len=i;
 last=len-1;
 first=0;
 while(first<=last&&flag)
 {
	if(str[first]==str[last])
	{
	flag=1;
	++first;
	--last;
	}
	else
	 flag=0;
	}
	if(flag==1)
	printf("the word is palindrome");
	else
	printf("it is not palindrome");
}
void copy(char str[10])
{
 char blank[10];
 int i=0,len;
 while(str[i])
	 i++;
 len=i;
 for(i=0;i<=len;++i)
	blank[i]=str[i];
 blank[++i]=0;
 printf("The string copied to blank string is: %s",blank);
}