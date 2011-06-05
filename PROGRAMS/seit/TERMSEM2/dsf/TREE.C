#include<stdio.h>
#include<conio.h>
#include<alloc.h>
struct node
{
char data[15];
struct node *left,*right;
}  ;
struct node *temp,*root=NULL,*new1;
int c ,choice,ch;
int i=1,j=2,k=40,l=39;
void recur(struct node*,struct node *);
void nrecur(struct node *,struct node *);
void tree(struct node *,int);
void first();
void main()
{

clrscr();
while(1)
{
clrscr();
printf("\n 1 enter the  data by recursive form");
printf("\n 2 enter the data by non recursive form ");
printf("\n 3 display");
printf("\n 4 exit");
printf("\n enter the choice ");
scanf("%d",&ch);

switch(ch)
{
case 1:
first();
break;
case 2:
first();
break;
case 3:
clrscr();
do
{
printf("\n 1 preorder");
printf("\n 2 inorder ");
printf("\n 3 postorder");
printf("\n 4 exit");
printf("\n enter the choice");
scanf("%d",&c);
if(root==NULL)
printf("\n the tree is empty ");
else
tree(root,c)             ;
getch();}while(c!=4);
break;
case 4 :
exit(1);
break;
default:
printf("\n wrong choice entered");
break;
}
}
}

void recur(struct node *new1,struct node * temp)
{
char ans;
gotoxy(1,20);
printf("wish to insert left/right of %s",new1->data);
gotoxy(1,21);
scanf(" %c",&ans);
gotoxy(1,20);
printf("                                           ");
gotoxy(1,21);
printf("                                             ");
if((ans=='r')||(ans=='R'))
{
if(new1->right==NULL)
new1->right=temp;

else
recur(new1->right,temp);
}
else
{
if(new1->left==NULL)
{
i=i+1;
k--;
gotoxy(k,i);
printf("/");
k--;i++;
gotoxy(k,i);
printf("%s",temp->data);
new1->left=temp;        }
else
 recur(new1->left,temp);
}
}

void nrecur(struct node *temp,struct node *new1)
{    int flag=0;
char ch;
  temp=root;
while(flag!=1)
	 {
	printf(" wish to insert left/right of %s",temp->data);
	scanf(" %c",&ch);
	if(ch=='l')
	     {
		if(temp->left==NULL)
		{
			temp->left=new1;
			flag=1;
		}
		else
	       temp=temp->left;
	     }
	     else
			{
			if(temp->right==NULL)
			     {
				temp->right=new1;
				flag=1;
			      }
				else
				temp=temp->right;
			 }
		     }
	       }

void first()
{clrscr();
do
{
temp=malloc(sizeof(struct node)) ;
temp->left=NULL;
temp->right=NULL;
gotoxy(1,20);
printf("enter the data");
gotoxy(1,21);
scanf("%s",&temp->data);
gotoxy(1,20);
printf("                                      ");
gotoxy(1,21);
printf("                       ");
if(root==NULL)
{ gotoxy(40,1);
printf("%s",temp->data);
root=temp;              }
else
{if(ch==1)
recur(root,temp);
else
nrecur(root,temp); }
gotoxy(1,20);
printf(" Do you want to enter more elements ");
gotoxy(1,21);
scanf(" %c",&choice);
gotoxy(1,20);
printf("                                                ");
gotoxy(1,21);
printf("                                               ");
}while(choice=='y');
getch();
}

void tree(struct node *r,int c)
{
if(r!=NULL)

{
if(c!=4)
{
if(c==1)
 printf(" %s",r->data);
  tree(r->left,c);
  if(c==2)
   printf(" %s",r->data);
 tree(r->right,c);
 if(c==3)
 printf(" %s",r->data);
}
}
}