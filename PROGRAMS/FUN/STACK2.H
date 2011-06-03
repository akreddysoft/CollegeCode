#include<malloc.h>
void push(struct stack *,char);
char pop(struct stack *);
struct stack
{
 	char st[100];
 	int top;
};

void push(struct stack *temp,char n)
{
	temp->top++;
	temp->st[temp->top]=n;
}

char pop(struct stack *temp)
{
 	char n;
 	if(!empty(*temp))
 	{
  		n=temp->st[temp->top];
  		temp->top--;
  		return n;
 	}
 	else
  		printf("\nstack empty\n");
 	return 0;
}

disp(struct stack temp)
{
	int i;
	for(i=0;i<=temp.top;++i)
		printf("%c",temp.st[i]);
	return 0;
}

empty(struct stack temp)
{
	if(temp.top==-1)
		return 1;
	else
		return 0;
}
