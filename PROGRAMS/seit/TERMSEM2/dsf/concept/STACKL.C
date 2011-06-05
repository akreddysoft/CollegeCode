#include<malloc.h>
void push(struct stack **,int);
int pop(struct stack **);
struct stack
{
 int data;
 struct stack *next;
};
void main()
{
	struct stack *s=NULL;
	int i,j,ch,n;
	clrscr();
	printf("\n 1 push");
	printf("\n 2 pop");
	printf("\n 0 exit");
	while(1)
	{
		printf("\nchoice:");
		scanf("%d",&ch);
		switch(ch)
		{
			case 1:
				printf("\nEnter the data:");
				scanf("%d",&n);
				push(&s,n);
				disp(s);
				break;
			case 2:
				n=pop(&s);
				printf("\nThe popis :%d\n",n);
				disp(s);
				break;
			case 0:
				exit(0);
		}
	}
}


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

