/*PROGRAM TO IMPLEMENT GENERALISED LINKED LIST AND PERFORM
  COPY,EQUIVALENCE,DEPTH
  MADHUR AHUJA
  ROLL NO 22
*/
#include<stdio.h>
struct node
{
 char c;
 int indicator;
 struct node *next,*link;
 };
 int n,x=4;
 struct node *form(char g[20]);
 void display(struct node *, int );
 void main()
 {
  char gll[20];
  struct node * root=NULL;
  clrscr();
  printf(" GLL storage\	n\n");
  printf("enter the gll expression:\n");
  scanf("%s",gll);
  n=1;
  root= form(gll);
  printf("\n the entered gll expression is:\n");
  printf("note:- 1.'->' indicates forward link\n");
  printf("       2.'|'  indicates forward link\n");
  display(root,10);
  getche();
  }

  struct node *form(char g[20])
  {
   struct node * root,*s,*q;
   root=NULL;
   while(g[n]!='\0'&&g[n]!=')')
   {
	if(g[n]!=','&&g[n]!='(')
	{
	 s=(struct node*)malloc(sizeof(struct node));
	 s->c=g[n];
	 s->next=NULL;
	 s->link=NULL;
	 s->indicator =0;
	 if(root==NULL)
	 root=s;
	 else
	 {
	 q=root;
	 while(q->next!=NULL)
		 q=q->next;
	 q->next=s;
   }
   }
   if(g[n]=='(')
   {
   n++;
   s=(struct node*)malloc(sizeof(struct node));
   s->next=NULL;
   s->indicator =1;
   s->link=form(g);
   if(root==NULL)
   root=s;
   else
   {
   q=root;
   while(q->next!=NULL)
   q=q->next;
   q->next=s;
   }
 }
 n++;

}
 return(root);
}

 void display(struct node *r,int y)
 {
  while(r!=NULL)
  {
  if(r->indicator==0)
  {
  gotoxy(x,y);
  printf("%c",r->c);
  if(r->next!=NULL)
  {
  gotoxy(x+1,y);
  printf("->");
  }
  x+=4;
  }
  if(r->indicator==1)
  {
  gotoxy(x,y);
  printf("|");
  if(r->next!=NULL)
  {
   gotoxy(x+1,y);
   printf("->");
   }
   display(r->link,y+1);
   }
   r=r->next;
   }
 }
/*
 GLL storage    n
enter the gll expression:
(a,(b,c))

 the entered gll expression is:
note:- 1.'->' indicates forward link
	   2.'|'  indicates forward link


   a-> |
	   b-> c

*/



                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                





