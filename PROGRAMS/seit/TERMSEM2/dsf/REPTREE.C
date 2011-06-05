#include<stdio.h>
#include<conio.h>
#include<alloc.h>
#include<math.h>
struct node
{
char data[15];
struct node *left,*right;
}  ;
struct node *temp,*root=NULL,*new1;
int c,i=0 ;
char *a[10],*b[4][4];
void recur(struct node*,struct node *);
void tree(struct node *,int);
void display();
void main()
{

int ch;
char choice;

  clrscr();
while(1)
{
clrscr();
printf("\n 1 enter the  data by recursive form");
printf("\n 2 display");
printf("\n 3 represent");
printf("\n 4 exit");
printf("\n enter the choice ");
scanf("%d",&ch);

switch(ch)
{
case 1:
do
{
temp=malloc(sizeof(struct node)) ;
temp->left=NULL;
temp->right=NULL;
printf("\n enter the data");
scanf("%s",&temp->data);
if(root==NULL)
{
a[i]=(char*)malloc(strlen(temp->data));
;a[i]=temp->data;
strcpy(a[i],temp->data);
i++;
root=temp;
}
else
{
a[i]=(char*)malloc(strlen(temp->data));
strcpy(a[i],temp->data);
i++;
recur(root,temp);
}
printf("\n Do you want to enter more elements ");
scanf(" %c",&choice);
}while(choice=='y');

break;
case 2:
clrscr();
do
{
printf("\n 1 preorder");
printf("\n 2 inorder ");
printf("\n 3 postorder");
printf("\n exit");
printf("\n enter the choice");
scanf("%d",&c);
if(root==NULL)
printf("\n the tree is empty ");
else

tree(root,c)             ;
getch();   }while(c!=4);
break;
case 3:
display();


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
printf("\n wish to insert left/right of %s",new1->data);
scanf(" %c",&ans);

if((ans=='r')||(ans=='R'))
{
if(new1->right==NULL)
{
new1->right=temp;
}
else
recur(new1->right,temp);
}
else
{
if(new1->left==NULL)
{
new1->left=temp;
}
else
recur(new1->left,temp);
}
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
void display()
{
int depth,x1=40,y1=1;
int squ=1,cnt=0;
int k=0,j,j1,k1=0,cnt1=0;
for(i=0;i<4;i++)
for(j=0;j<4;j++)
b[i][j]=0;
for(i=0;i<4;i++)
{
for(j=0;j<squ;j++)
{
b[i][j]=a[k];
k++;
}
if(squ>2)
squ=pow(squ,2);
if(squ==2)
squ=pow(squ,2);
if(squ==1)
squ++;
}
depth=0;
for(i=0;i<4;i++)
{
for(j=0;j<4;j++)
printf(" %s",b[i][j]);
printf("\n ");
}
for(i=0;i<4;i++)
{  k=0;
for(j=0;j<4;j++)
{
if(b[i][j]!=NULL)
k=1;
}
if(k==1)
depth++;
}
printf("the depth is ");
printf("%d ",depth);

getch();
clrscr();
j=0;j1=1;
//display
for(i=0;i<depth;i++)
{                        cnt=0;
	for(k=0;k<4;k++)
  {
	if(b[j][k]!=NULL&&(strcmp(b[j][k],"999")!=0))
    {
	if(i==0)
      {
       gotoxy(x1,y1);
       printf("%s",b[j][k]);

      }
	else
	{

		gotoxy(x1+4*cnt,y1);
		printf("%s",b[j][k]);
		cnt++;
	}
    }
    else
	{
	gotoxy(x1+4*cnt,y1);
	cnt++;
	}
  }
j++;
cnt=0;
cnt1=0;
if(i!=depth)
//display of / \
for( k1=0;k1<4;k1++)
{

	if(b[j1][k1]!=NULL&&(strcmp(b[j1][k1],"999")!=0))

  {
	if(i==0)
    {   if(k1%2==0)
      {
	gotoxy(x1-1,y1+1);
	printf("/");
      }
      else
      {
	gotoxy(x1+1,y1+1) ;
	printf("\\ ");
       }
    }
	else
      {
		if(k1%2==0)
	{
		gotoxy(x1-1+(4*cnt),y1+1);
		printf("/");
		cnt++;
	}
	 else
	  {
		 gotoxy(x1+1+(4*cnt1),y1+1);
		  printf("\\ ");
		  cnt1++;
	  }
      }
   }
   else
   {
	if(k1%2==0)
	{
		gotoxy(x1-1+(4*cnt),y1+1);
		cnt++;
	}
	 else
	  {
		 gotoxy(x1+1+(4*cnt1),y1+1);
		  cnt1++;
	  }
   }
}
j1++;
gotoxy(x1-2,y1+2);
x1=x1-2;
y1=y1+2;

}
getch();

}

