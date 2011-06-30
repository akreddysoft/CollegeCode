#include<stdio.h>
#include<alloc.h>
#include<conio.h>
#include<string.h>
struct node
{
char data[30];
node*nt;
};
node *st=NULL;
int push(char a[])
{
node * temp=(node*)malloc(sizeof(node));
if(temp==NULL)
{
 printf("unable to create memory for the pointer\n\t\tsorry");
 getch();
 return 0;
}
else
{
strcpy(temp->data,a);
temp->nt=st;
st=temp;
return 1;
}
}
int pushe(char a[])
{
node * temp=(node*)malloc(sizeof(node));
if(temp==NULL)
{
 printf("unable to create memory for the pointer\n\t\tsorry");
 getch();
 return 0;
}
else
{
node*tre;
tre=st;
if(tre==NULL)
push(a);
else
while(tre->nt!=NULL)
tre=tre->nt;
strcpy(temp->data,a);
temp->nt=NULL;
tre->nt=temp;
return 1;
}
}
void dis()
{
if(st==NULL)
printf("the stack is empty");
else
{
node*temp=st;
while(temp!=NULL)
{
puts(temp->data);
temp=temp->nt;
}
}
}
void pop()
{
if(st==NULL)
printf("the stack is empty");
else
{
node*temp=st;
st=st->nt;
printf("the poped element is %s",temp->data);
free(temp);
}
}
void main()
{
char c;
char a[30];
do
{
clrscr();
printf("1.ENTER 1 TO PUSH ELEMENT TO THE STACK\n");
printf("2.ENTER 2 TO POP THE ELEMENT FROM THE STACK\n");
printf("3.ENTER 3 TO DISPLAY THE ELEMENTS OF THE STACK\n");
printf("4.enter 4 to add element at the end\n");
printf("5.enter 5 to enter element after specified position/n");
printf("enter your choice : ");
scanf("%c",&c);
switch(c)
{
case '1':printf("enter the element to be pushed ");
	 fflush(stdin);
	 gets(a);
	 push(a);
	 break;
case '2':pop();getch();break;
case '3':dis();getch();break;
case '4':printf("enter the element to be pushed ");
	 fflush(stdin);
	 gets(a);
	 pushe(a);
	 break;
}
}while(c!='0');
}