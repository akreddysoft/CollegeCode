#include<stack1.h>
#include<math.h>
struct stack s;
void main (void)
{
	char postfix[30],symbol;
	int op1,op2,len,i;
	clrscr();
	s.top=-1;
	printf("\nEnter the postfix:");
	gets(postfix);
	len=strlen(postfix);
	for(i=0;i<len;++i)
	{
		symbol=postfix[i];
		if(symbol>='1'&&symbol<='9')
			push(&s,symbol-'0');
		if(symbol=='+'||symbol=='-'||symbol=='*'||symbol=='/'||symbol=='^')
		{
			op1=pop(&s);
			op2=pop(&s);
			switch(symbol)
			{
				case '+':
					push(&s,op1+op2);
					break;
				case '-':
					push(&s,op2-op1);
					break;
				case '*':
					push(&s,op1*op2);
					break;
				case '/':
					push(&s,op2/op1);
					break;
				case '^':
					push(&s,pow(op2,op1));
					break;
			}
		}
	}
	printf("\nThe answer is: %d",s.st[0]);
	getch();
}
