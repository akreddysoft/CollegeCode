#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
struct tree
{
 int data;
 struct tree*left,*right;
 }*root,*stack[20];
 void insert(struct tree*,struct tree*);
 void inorder(struct tree*);
 void preorder(struct tree*);
 void postorder(struct tree*);
 void inorder1(struct tree*);
 void preorder1(struct tree*);
 void postorder1(struct tree*);
 void main()
 {

  struct tree*s;
  int choice;
  clrscr();
  root=NULL;

  do
  {
  s=(struct tree*)malloc(sizeof(struct tree));
  printf("enter the data \n");
  scanf("%d",&s->data);
  s->left=NULL;
  s->right=NULL;
  if(root==NULL)
  root=s;
  else

  insert(root,s);



   printf("do you want to add more\n");
   }while(getche()=='y');
   do
   {
   printf("1.inorder\n");
   printf("2. preorder\n");
   printf("3. postorder\n");
   printf("4. inorder1\n");
   printf("5. preorder1\n");
   printf("6. postorder\n");
   printf("7. exit");
   printf("enter your choice...\n");
   scanf("%d",&choice);
   switch(choice)
   {
    case 1:
    clrscr();
    inorder(root);
    break;
    case 2:
    clrscr();
    preorder(root);
    break;
    case 3:
    clrscr();
    postorder(root);
    break;
    case 4:
    clrscr();
    inorder1(root);
    break;
    case 5:
    clrscr();
    preorder1(root);
    break;
    case 6:
    clrscr();
    postorder1(root);
    break;
    case 7:
    exit(1);
    }
    printf("do you want to continue\n");
    }
    while(getche()=='y');
    getche();
    }


  void insert(struct tree*r,struct tree*p)
  {
   if(p->data>r->data)
   {
    if(r->right!=NULL)
    insert(r->right,p);
    else
    r->right=p;
   }
   else
   {
    if(r->left!=NULL)

     insert(r->left,p);
    else
    r->left=p;
    }
  }
 void inorder(struct tree*t)
 {
  struct tree*temp;
  temp=t;
  if(temp!=NULL)
  {
   inorder(temp->left);
   printf("%d",temp->data);
   inorder(temp->right);
   }
  }
 void preorder(struct tree*t)
 {
  struct tree*temp;
  temp=t;
  if(temp!=NULL)
  {
   printf("%d",temp->data);
   preorder(temp->left);
   preorder(temp->right);
   }
  }
  void postorder(struct tree*t)
  {
    struct tree*temp;
    temp=t;
    if(temp!=NULL)
    {
     postorder(temp->left);
     postorder(temp->right);
     printf("%d",temp->data);
     }
  }
void inorder1(struct tree*t)
{
 int end=0,i=0,left;
  while(end==0)
  {
    goto left;
    left:
    while(t!=NULL)
    {
     stack[i]=t;
     i++;
     t=t->left;
     }
    if(i!=0)
    {
     printf("%d",stack[i-1]->data);
     i--;
     if(stack[i]->right!=NULL)
     t=stack[i]->right;
     goto left;
     }


     else

     end=1;
    }
  }
  void preorder1(struct tree*t)
  {
   int end=0,i=0,left;
   while(end==0)
   {
    goto left;
    left:
    while(t!=NULL)
    {
     stack[i]=t;
     i++;
     printf("%d",stack[i]->data);
     t=t->left;
     }
   if(i!=0)
   {
    i--;
    if(stack[i]->right!=NULL)
    t=stack[i]->right;
    goto left;
    }

    else
    end=1;
 }
 }
 void postorder1(struct tree*t)
 {
  struct tree *temp=t;
  int end=0,i=0,left;
  while(end==0)
  {
   goto left;
   left:
   while(t!=NULL)
   {
    stack[i]=t;
    i++;
    t=t->left;
    }
   if(i!=0)
   {
    i--;
    if(stack[i]!=t)
    printf("%d",stack[i]->data);
    t=t->right;
    goto left;
   }

   else
   {
    printf("%d",temp->data);
    end =1;
    }
   }
   }




