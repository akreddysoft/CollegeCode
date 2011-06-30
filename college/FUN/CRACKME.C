void main()
{
 char str[10];
 int ans,len,charc,i;
 long code=0,ucode;
 clrscr();
 printf("Enter your name:\n");
 scanf("%s",str);
 len=strlen(str);
 for(i=0;i<len;++i)
 {
	charc=str[i];
	code=code+(i+1)*charc;
 }
 printf("\nEnter the code:");
 scanf("%ld",&ucode);
 if(ucode==code)
	printf("You cracked");
 else
	printf("You failed");
getch();
}


