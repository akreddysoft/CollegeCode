#include<malloc.h>
void push(struct stack **,int);
int pop(struct stack **);
struct stack
{
 int data;
 struct stack *next;
};

void push(struct stack **top,int n)
{
  struct stack *temp;
  temp=(struct stack*)malloc(sizeof(struct stack));
  temp->data=n;
  temp->next=*top;
  *top=temp;
}

int pop(struct stack **top)
{
 int n;
 if(!empty(*top))
 {
  n=(*top)->data;
  (*top)=(*top)->next;
  return n;
 }
 else
  printf("\nstack empty\n");
 return 0;
}

disp(struct stack *top)
{
	while(top!=NULL)
	{
		printf("%d  ",top->data);
		top=top->next;
	}
	return 0;
}

empty(struct stack *top)
{
	if(top==NULL)
		return 1;
	else
		return 0;
}
