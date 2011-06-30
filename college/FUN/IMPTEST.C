void count(char [20][2000],int);
void main()
{
 char text[20][2000];
 int i=0;
 clrscr();
 printf("Input a line of zero length to stop\n");
 printf("Enter the text:\n");
 gets(text[i]);
 if(strlen(text[i]==0))
 {
	printf("invalid input");
	exit();
 }
 while(strlen(text[i])>0)
 {
	++i;
	gets(text[i]);
 }
 count(text,i);
 getch();
}

void count(char text[20][2000],int lines)
{
 int chars=0;
 int words=1,i=0,j=0;
 while(i<lines)
 {
	 while(text[i][j])
	 {
		 chars++;
		 if(text[i][j]==32)
			words++;
		 j++;
	 }
	 i++;
	 j=0;
	 words++;
 }
 printf("\nThe answer is:\n");
 printf("Characters=%d",chars);
 printf("\nWords=%d",--words);
 printf("\nLines=%d",lines);
}