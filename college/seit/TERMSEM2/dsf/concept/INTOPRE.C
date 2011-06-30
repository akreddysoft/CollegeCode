#include<stack2.h>
//program for conversion to infix to prefix
void putbrac(char  [30]);
struct stack s;
void main()
{
	char infix[30],symbol, prefix[30],ch;
	int i,j=-1,len;
	s.top=-1;
	clrscr();
	printf("\nEnter the infix:");
	gets(infix);
	putbrac(infix);
	len=strlen(infix);
	for(i=len-1;i>=0;--i)
	{
		symbol=infix[i];
		if(symbol==')')
			push(&s,symbol);
		if(symbol>='A'&&symbol<='Z')
			prefix[++j]=symbol;
		if(symbol=='/'||symbol=='*'||symbol=='+'||symbol=='-'||symbol=='^')
		{
			if(s.st[s.top]=='/'||s.st[s.top]=='*'||s.st[s.top]=='+'||s.st[s.top]=='-'||s.st[s.top]=='^')
			{
				while(prt(s.st[s.top])>prt(symbol))
					prefix[++j]=pop(&s);	   //POP WHILE PRT GREATER
				push(&s,symbol);           		 //PUSH THE SYMBOL
			}
			else
				push(&s,symbol);        		   //DONT POP,PUSH
		}
		if(symbol=='(')
		{
			while(s.st[s.top]!=')')  		   //no need for stack empty
				prefix[++j]=pop(&s);   		//AS FIRST ELEMENT IN STACK =(
			pop(&s);                  			  //DISCARD THE (
		}
	}
	prefix[++j]=0;
	printf("\nThe prefix is:");
	printf("%s",strrev(prefix));
	getch();
}

int prt(char opr)
{
	if(opr=='^')
		return 5;
	if(opr=='/'||opr=='*')
		return 4;
	if(opr=='+'||opr=='-')
		return 3;
	return 0;         //if invalid symbol,return lowest prt
}

void putbrac(char infix[30])
{
	int len,i;
	char temp,temp1;
	len=strlen(infix);
	for(i=len-1;i>=0;--i)
	{
		infix[i+1]=infix[i];
	}
	infix[0]='(';
	infix[len+1]=')';
	infix[len+2]=0;
}