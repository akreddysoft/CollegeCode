//PROGRAM FOR THE DIFFERENTIATION
 char exp[20],ans[20],ch,stack[20];
 char temp[20][20];
 int i,j=0,k,rows,col,l;
void main()
{
 clrscr();
 l=0;
 printf("\nEnter the expression:");
 gets(exp);
 strcpy(temp,exp);
 k=j=i=0;
 for(i=0;i<strlen(exp);++i)
 {
   ch=exp[i];
   if(ch>='a'&&ch<='z')
	  temp[k][j++]=ch;
   if(ch>='1'&&ch<='9')
	  temp[k][j++]=ch;
   if(ch=='*'||ch=='/'||ch=='^')
	  temp[k][j++]=ch;
   if(ch=='+'||ch=='-')
	{
	  temp[k][j++]=ch;
	  temp[k][j]=0;
	  k++;
	  j=0;
	}
 }
 rows=k;
 col=j;
 printf("\nbreaks:");
 for(i=0;i<=rows;++i)
	printf("%s\n",temp[i]);

 i=j=k=l=0;
 for(j=0;j<=rows;++j)
 {
   l=0;
   k=0;

 for(i=0;i<strlen(temp[j]);++i)
 {
  ch=temp[j][i];
  if(ch>='1'&&ch<='9')
	 stack[k++]=ch;
  if(ch>='a'&&ch<='z')
  {
	hndop();
   //	continue;
  }
  if(ch=='*'||ch=='/')
   stack[k++]=ch;
  if(ch=='+'||ch=='-')
	printf("%c",ch);

 }
}


 getch();

}

 hndop()
 {
  char *str;
  int sign,ndig,dec;
  float inte;
  if(temp[j][i+1]=='^')
  {
   if(temp[j][i+2]>='1'&&temp[j][i+2]<='9')
   {
	inte=atoi(&stack[0])*atoi(&temp[j][i+2]);
	str=ecvt(inte,2,&dec,&sign);
	ans[l++]=str[0];
	ans[l++]=str[1];
	ans[l++]=ch;
	ans[l++]='^';
	printf("%d",atoi(&stack[0])*atoi(&temp[j][i+2]));
	ans[l++]=temp[j][i+2]-1;
   }
  }
  if(temp[j][i+1]=='\0')
 {
  ans[l++]=ch;
 }

 ans[l]=0;
printf("\n%s",ans);

 }


