/*WRITE A MENU DRIVEN PROGRAM TO PERFORM THE FOLLWING
  OPERATIONS ON STACK.INSERT,DELETE,DISPLAY USING
  LINKED LIST

  MADHUR AHUJA
  ROLL NO 22
*/
#include<malloc.h>
void push(int);
int pop();
void display();
struct stack
{
 int data;
 struct stack *next;
};
struct stack *top=NULL,*temp;

	case 2:
	pop();
	display();
	break;

	case 0:
	exit(1);
  }
}
}
void push(int n)
{
  temp=(struct stack*)malloc(sizeof(struct stack));
  temp->data=n;
  temp->next=top;
  top=temp;
}

int pop()
{
 int n;
 if(top!=NULL)
 {
  n=top->data;
  top=top->next;
 }
 else
  printf("\nstack empty\n");
 return n;
}

void display()
{
 temp=top;
 printf("\nThe stack is: ");
 while(temp!=NULL)
 {
  printf("%d  ",temp->data);
  temp=temp->next;
 }
}
/*OUTPUT

 1 Push
 2 pop
 0 exit
Enter choice:1

Enter no:1

The stack is: 1
Enter choice:1

Enter no:3

The stack is: 3  1
Enter choice:1

Enter no:5

The stack is: 5  3  1
Enter choice:2
The poppped value is:5

The stack is: 3  1
Enter choice:0

*/