//ASSIGNMENT NO.5
//CONVERT SEVERAL LINES OF TEXT TO UPPERCASE
void main()
{
 char text[20000];
 int i=0,j,k,len;
 clrscr();
 printf("Enter the text:\n");
 gets(text);
 while(text[i])
 {
	if(text[i]>='a'&&text[i]<='z')
	text[i]=text[i]-32;
	++i;
 }
 printf("%s",text);
 getch();
}