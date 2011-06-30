#include<alloc.h>
#include<math.h>
struct node
 {
  char data[15];
  struct node *left,*right;
 };
struct node *root=NULL,*new1,*r,*q;
char *a[20],*b[4][8];
int i;
int menu();
void display();
void insert(struct node *,struct node *);
void main()
{
 int choice;
 char c;
 clrscr();
 while(1)
  {
   choice=menu();
   switch(choice)
    {
     case 1:
	    do
	     {
	      clrscr();
	      new1=(struct node *)malloc(sizeof(struct node));
	      new1->right=NULL;
	      new1->left=NULL;
	      printf("\nEnter the data : ");
	      scanf("%s",new1->data);
	      if(root==NULL)
		root=new1;
	      else
		insert(root,new1);
	      printf("\nDo you want to insert more elements(y/n) ");
	      c=getch();
	     }
	    while(c=='y'||c=='Y');

break;
case 2 :display();
break;
//case 3: depth();
//break;
//case 4: leaf_node();
case 5: exit(1);
 break;
    }        //SWITCH LOOP ENDS
 }             //WHILE LOOP ENDS

}           //MAIN FUNCTION ENDS


int menu()
{
 int ch;
 printf("\n\t BINARY SEARCH TREE ");
 printf("\n1.CREATION \n2.DISPLAY");
 printf("\n5.EXIT");
 printf("\nENTER THE CHOICE ");
 scanf("%d",&ch);
 return ch;
}

// INSERTION FUNCTION BEGINS
void insert(struct node *r,struct node *p)
{
 if((r->right==NULL)&&(strcmp(p->data,r->data)>0))
    {a[i]=(char*)malloc(strlen(new1->data));
	    strcpy(a[i],new1->data);
	    i++;
    r->right=p;
    }
 else
   {
    if((r->right!=NULL)&&(strcmp(p->data,r->data)>0))
      insert(r->right,p);
   }
 if((r->left==NULL)&&(strcmp(p->data,r->data)<0))
    {
    a[i]=(char*)malloc(strlen(new1->data));
	    strcpy(a[i],new1->data);
	    i++;
    r->left=p;
    }
 else
   {
    if((r->left!=NULL)&&(strcmp(p->data,r->data)<0))
      insert(r->left,p);
   }
}



	     void display()
{
int depth,x1=40,y1=1;
int squ=1,cnt=0,t1;
int k=0,j,j1,k1=0,cnt1=0;
for(i=0;i<4;i++)
for(j=0;j<8;j++)
b[i][j]=0;
for(i=0;i<4;i++)
{  squ=pow(2,i);
for(j=0;j<squ;j++)
{
b[i][j]=a[k];
k++;
}
}
depth=0;
for(i=0;i<4;i++)
{  k=0;
for(j=0;j<8;j++)
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
cnt1=0;
 t1=0;
//display
for(i=0;i<depth;i++)
{        cnt1=0;
		cnt=0;
	for(k=0;k<8;k++)
  {
	if(b[j][k]!=NULL&&(strcmp(b[j][k],"999")!=0))
    {
	if(i==0)
      {
       gotoxy(x1,y1);
       printf("%s",b[j][k]);

      }
	else
	{      if(i==2)
	       {           if(k%2==0)
		{
		gotoxy(x1+16*cnt,y1);
		printf("%s",b[j][k]);
		cnt++;
		}
		else
		{
		gotoxy(x1+6+16*cnt1,y1);
		printf("%s",b[j][k]);
		cnt1++;
		}
	      }
		else
		if(i==1)
	       {
		gotoxy(x1+16*cnt,y1);
		printf("%s",b[j][k]);
		cnt++;
		}
		if(i==3)
	   {
		if(k%2==0)
		{     if(cnt==2)
		   {cnt++   ;
			gotoxy(x1+16,y1)  ; }
		  else
		  {      if(cnt>2)
			 gotoxy(x1+22,y1);
			 else
			gotoxy(x1+6*cnt,y1);
			 cnt++;
		  }     printf("%s",b[j][k]);
	       }
	       else
	       {
		    if(cnt1==2)
		    {cnt1++;
		    gotoxy(x1+20,y1);   }
		else
		{       if(cnt1>2)
			gotoxy(x1+26,y1);
			else
			gotoxy(x1+4+6*cnt1,y1);

			cnt1++;
		}	printf("%s",b[j][k]);
	       }
	   }

   }

	}
       else
	{
	if(i==1)
	 gotoxy(x1+16,y1);
	 if(i==2)
	{         if(k==0)
	cnt++;
	if(k==1)
	cnt1++;
	if(k==2)
	 {	gotoxy(x1+16,y1);
	cnt++;
	  }
	}
	if(k==3)
	cnt1++;
	if(i==3)
       {
	if(k%2==0)
	{
	if(cnt==2)
	gotoxy(x1+16,y1+1);
	else
	 {
	gotoxy(x1+6*cnt,y1+1);
	cnt++;
	 }
	}
	else
	{
	if(cnt1==2)
	gotoxy(x1+20,y1+1);
	else
	 {
	gotoxy(x1+6*cnt1,y1+1);
	cnt1++;
	 }
	}
       }


	}
  }
j++;
cnt=0;
cnt1=0;
if(i!=depth-1)
//display of / \
for( k1=0;k1<8;k1++)
{

	if(b[j1][k1]!=NULL&&(strcmp(b[j1][k1],"999")!=0))

  {
	if(i==0)
    {
    if(k1%2==0)
	  {
	gotoxy(x1-5,y1+1);
	printf("/");
	  }
      else
	 {
	gotoxy(x1+5,y1+1) ;
	printf("\\ ");
	}
    }
	else
      {          if(i==1)
	       {	if(k1%2==0)
		{
		gotoxy(x1-1+(16*cnt),y1+1);
		printf("/");
		cnt++;
		}
			else
		{
		 gotoxy(x1+2+(16*cnt1),y1+1);
		  printf("\\ ");
		  cnt1++;
		}
	      }
	      else
	     {
	      if(k1%2==0)
	      {  if(cnt==2)
		 {cnt++;
		 gotoxy(x1+15,y1+1);}
	      else
	      {
	      if(cnt>2)
	      {t1=x1+20                ;
	      gotoxy(t1,y1+1);  }
	      else
	      gotoxy(x1-1+(6*cnt),y1+1);
	      }
	      printf("/");
	      cnt++;
	      }
	      else
	      {    if(cnt1==2)
		  {cnt1++;
		   gotoxy(x1+17,y1+1);}
	      else
	     {
	      if(cnt1>2)
	      {               t1=x1+23;
		      gotoxy(x1+23,y1+1); }
	       else
	      gotoxy(x1+1+(6*cnt1),y1+1);
	      }printf("\\");
	      cnt1++;
	      }
	     }

      }
   }
   else
   {     if(i==1)
	if(k1%2==0)
	{ 	cnt++;
		gotoxy(x1-1+(16*cnt),y1+1);

	}
	 else
	  {  	  cnt1++;
		 gotoxy(x1+1+(16*cnt1),y1+1);

	  }
	  if(i==2)
	  {
	 if(k1%2==0)
	  {
	    if(cnt==2)
		 gotoxy(x1+16,y1);
	      else
	      gotoxy(x1-1+(6*cnt),y1+1);
	      cnt++;
	      }
	      else
	      {    if(cnt1==2)
		   gotoxy(x1+17,y1);
	      else
	      gotoxy(x1+1+(6*cnt1),y1+1);
	      cnt1++;
	      }
	 }
  }
}
j1++;
if(i==0)
{
x1=x1-8;
y1=y1+2;
}
if(i==1)
{ x1=x1-3;
y1=y1+2;
}
if(i==2)
{
x1=x1-2;
y1=y1+2;
}
}
getch();

}

