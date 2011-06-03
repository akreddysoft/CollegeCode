#include<malloc.h>
void push(struct stack *,struct tree *);
struct tree * pop(struct stack *);
struct stack
{
 struct tree *st [100];
 int top;
};

void push(struct stack *temp,struct tree *n)
{
	temp->top++;
	temp->st[temp->top]=n;
}

struct tree* pop(struct stack *temp)
{
 struct tree * n;
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
