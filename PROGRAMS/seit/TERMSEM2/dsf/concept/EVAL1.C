#include<stack1.h>
#include<math.h>
struct stack s;
void main (void)
{
	char postfix[30],symbol;
	int op1,op2,len,i,val[30],j=0;
	clrscr();
	s.top=-1;
	printf("\nEnter the postfix:");
	gets(postfix);
	for(i=0;i<strlen(postfix);++i)
	{
		if(postfix[i]>='A'&&postfix[i]<='Z')
		{
			printf("\nEnter the value of %c:",postfix[i]);
			scanf("%d",&val[j++]);
		}
	}
	len=strlen(postfix);
	j=0;
	for(i=0;i<len;++i)
	{
		symbol=postfix[i];
		if(symbol>='A'&&symbol<='Z')
			push(&s,val[j++]);
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
