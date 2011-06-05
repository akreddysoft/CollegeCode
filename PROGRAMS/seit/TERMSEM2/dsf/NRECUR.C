#include<stdio.h>
#include<conio.h>
#include<alloc.h>
struct node
{
int  data;
struct node *left,*right;
}  ;
void  main()
{
int data1,flag;
struct node *new1,*temp,*root=NULL;
char ch;
clrscr();
printf("\n create");
printf ("\n enter the data");
while(1)
{
printf("\n enter data -1 to quit")      ;
printf("\n enter the data");
scanf("%d",&data1);
if(data1==-1)
break;
else
    {
new1=malloc(sizeof(struct node));
new1->data=data1;
new1->right=NULL;
new1->left=NULL;
if(root==NULL)
     {
      root=new1;
   temp=root;
      }
else
       {
      flag=0;
  temp=root;
while(flag!=1)
	 {
	printf("\n attach to left or right of data %d",temp->data);
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
      }
    }
//return (root);
}