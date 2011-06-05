#include<stack2.h>
struct stack s;
void main (void)
{
	char postfix[30],symbol,infix[30];
	int len,i,j=-1,flag=0;
	char op1,op2;
	clrscr();
	s.top=-1;
	push(&s,'(');
	printf("\nEnter the postfix:");
	gets(postfix);
	len=strlen(postfix);
	for(i=0;i<len;++i)
	{
		symbol=postfix[i];
		if(symbol>='A'&&symbol<='Z')
			push(&s,symbol);
		if(symbol=='+'||symbol=='-'||symbol=='*'||symbol=='/'||symbol=='^')
		{
			if(flag==1)
			{
				op1=pop(&s);
				push(&s,symbol);
				push(&s,op1);
			}
			else
			{
			op1=pop(&s);
			op2=pop(&s);
			push(&s,'(');
			push(&s,op2);
			push(&s,symbol);
			push(&s,op1);
			push(&s,')');
			flag=1;
		   }
		}
	}
	push(&s,')');
	printf("\nThe answer is: \n");
	for(i=0;i<s.st[s.top];++i)
		printf("%c",s.st[i]);
	getch();
}
