#include<stdio.h>
#include<math.h>
struct tree
{
 int a;
 struct tree *left,*right;
 };
 void show(struct tree*,int);
 void dep(struct tree*);
 int c,l;

 struct tree *ins(p,x)
 struct tree *p;
 int x;
 {
   if(p==NULL)
  {
   p=(struct tree*)malloc(sizeof(struct tree));
   p->a=x;
   p->left=NULL;
   p->left=NULL;
   return(p);
   }
   if(x<p->a)
   p->left=ins(p->left,x);
   else

   p->right=ins(p->right,x);
   return(p);
   }

   void show(t,level)
   struct tree*t;
   int level;
   {
   int i;

   if(t)
   {
   show(t->right,level+1);
   printf("\n");
   for(i=0;i<level;i++)
   printf(" ");
   printf("%d",t->a);
   show(t->left,level+1);
   }
   }
   void dep(struct tree *t)
   {
	if(t)
	{
	 ++c;
	 if(t->left==NULL&&t->right==NULL)
	 {
	 ++l;
	 dep(t->left);
	 dep(t->right);
	 }
	 }
  }

  void main()
  {
   struct tree *t=NULL;
   int a;
   clrscr();


   c=l=0;

   while(1)
   {
	printf("enter value -1 to stop: ");
	scanf("%d",&a);
	if(a==-1)
	break;
	t=ins(t,a);
	}
	show(t,1);
	dep(t);
	printf("tree is having %d leaves",l);
	if(c=(2*l)-1)
	show(t,1);
	getche();
	}





