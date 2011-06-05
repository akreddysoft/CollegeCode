/*PROGRAM TO CONVERT INFIX TO POSTFIX
  AND EVALUATE THE POSTFIX EXPRESSION
 
  MADHUR AHUJA
  ROLL NO 22
*/
#include<math.h>
int prt(char);
void main()
{
 char exp[20],stack[20],result[20],ch;
 int i,j,k,len,flag=1;
 int stack1[20],result1[20];
 clrscr();
 for(i=0;i<20;++i)
   exp[i]=stack[i]=result[i]=0;
 printf("\nEnter the infix expression:");
 gets(exp);
 len=strlen(exp);
 if(exp[0]!='('||exp[len-1]!=')')
 {
	getch();
	printf("error in expression,put initial and final parenthesis");
	exit(1);
 }
 j=k=0;
 for(i=0;i<len;++i)
 {       flag=1;
	 ch=exp[i];
	if(ch=='(')
	{
		stack[j++]=ch;
		continue;
	}
	if(ch>='A'&&ch<='Z')
	{
		result[k++]=ch;
		continue;
	}
   if(ch==')')
   {
		while(stack[j-1]!='(')
		{
			 result[k]=stack[j-1];
			 k++;
			 j--;
		}
		--j;
		continue;
   }
   if(ch=='+'||ch=='-'||ch=='*'||ch=='/'||ch=='^')
	{
		 while((stack[j-1]=='+'||stack[j-1]=='-'||stack[j-1]=='*'||stack[j-1]=='^'||stack[j-1]=='/')&&flag)
		 {
			flag=0;
			if(prt(stack[j-1])>=prt(ch))
			{
				 flag=1;
				 result[k]=stack[--j];
				 k++;
			}
		 }
		 stack[j++]=ch;
	}
	else
	  stack[j++]=ch;
   }
  printf("\nThe postfix expression is:");
  result[++k]=0;
  printf("%s",result);
  printf("\n Enter the expression to evaluate ");
  for(i=0;i<20;++i)
  exp[i]=stack[i]=result[i]=0;
 gets(exp);
 len=strlen(exp);
 k=0;
 for(i=0;i<len;++i)
 {
  ch=exp[i];
  if(ch>='1'&&ch<='9')
  {
   stack[k++]=ch-0x30;
   continue;
  }
  if(ch=='+'||ch=='-'||ch=='*'||ch=='/'||ch=='^')
  {
	switch(ch)
	{
		case '*':
		stack[k-2]=stack[k-2]*stack[k-1];
		break;
		case '-':
		stack[k-2]=(stack[k-2])-(stack[k-1]);
		break;
		case '+':
		stack[k-2]=(stack[k-2])+(stack[k-1]);
		break;
		case '/':
		stack[k-2]=stack[k-2]/stack[k-1];
		break;
		case '^':
		stack[k-2]=pow(stack[k-2],stack[k-1]);
		break;
		default:
		break;
	}
 k--; }
 }
 printf("\nThe answer is:%d",stack[0]);
 getch();
 }
int prt(char ch)
{
 if(ch=='^')
  return 5;
 if(ch=='*'||ch=='/')
  return 4;
 if(ch=='+'||ch=='-')
  return 3;
 return 0;

}

/* OUTPUT

 Enter the infix expression:((X+Y*Z^P-(X/Y+Z))

 The postfix expression is:XYZP^*+XY/Z+-
 Enter the expression to evaluate is 1523^*+63/8+-

 The answer is:31
*/






                                                                                

                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                

