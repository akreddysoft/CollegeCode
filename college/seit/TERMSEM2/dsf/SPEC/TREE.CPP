  /*          ASSIGNMENT NO:                                   PAGE NO.:
   ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป 									|
   บ PROBLEM STATEMENT: TO create a binary tree from postfix expression  บ
   บ			&  to perform preorder  transversal.                     บ
   ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
   ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
   ณ   DEVELOPED BY: MADHUR AHUJA                                        ณ
   ณ   ROLL NO. :228   S.E. I.T.                                         ณ
   ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู*/

   #include<dos.h>
   #include<stdio.h>
   #include<conio.h>
   #include<alloc.h>
   #include<string.h>
   #include<ctype.h>
   #include<graphics.h>
   #include<iostream.h>

   typedef struct node           //Structure for node
	{
	  char data;
	  struct node *left,*right;
	}BIN_TREE;

   class tree                   //Defining class for tree
	{
	 private:
	   BIN_TREE *stack_node[50],*queue[50];
	   int t,top,front,rear;
	   float m;
	   BIN_TREE *delqueue();
	   BIN_TREE *pop();
	   void insertqueue(BIN_TREE *);
	   void push(BIN_TREE*);

	   int empty();

	 public:
	   void ini_tree();
	   void pre_recursive(BIN_TREE *);
	   void pre_nonrecursive(BIN_TREE *);
	   BIN_TREE *create(char post_str[]);
	   void display(BIN_TREE *,int,int,int);
	   ~tree();
	};
	void moveup(),movedown(),moveleft(),moveright();
	void tree::ini_tree()              //Initializations
	 {
	   int i;
	   top=-1;
	   front=-1;
	   rear=-1;
	   t=20;
	   m=0;
	   for(i=0;i<49;i++)
		  stack_node[i]=NULL;
	 }

	tree::~tree()                    //Destructor
	 {
	   int i;
	   for(i=0;i<49;i++)
		  delete stack_node[i];
	 }

	void tree::push(BIN_TREE *node)      //Function to push a node on stack
	 {
	   if(top+1>=50)
		 cout << "\nStack full";
	   top++;
	   stack_node[top]=node;
	 }

	BIN_TREE* tree::pop()                //Function to pop a node
	 {
	   BIN_TREE *node;
	   if(top==-1)
		 cout << "\nStack empty";
	   node= stack_node[top];
	   top--;
	   return(node);
	 }

	BIN_TREE* tree::create(char post_str[]) //Function to create a tree
	 {
	   BIN_TREE *temp;
	   int pos=0;
	   char ch;

	   ch=post_str[pos];         //Reading each character
	   while(ch!='\0')
		{
		   temp=new BIN_TREE;  //Aloocating memory for newnode
		   temp->left=NULL;
		   temp->right=NULL;
		   temp->data=ch;
		   if(isalpha(ch))      //Checking for operand
			  push(temp);
		   else                     //If operator
			  if(ch=='+'||ch=='*'||ch=='/'||ch=='-'||ch=='^')
				{
				temp->right=pop(); //Popping the nodes
				temp->left=pop();  // as son
				push(temp);
				}
			  else cout << "\nInvalid post_str";
		   pos++;
		   ch=post_str[pos];          //Checking next character
		}
	   if(top!=-1)
		{
		   temp=pop();
		   return(temp);
		}
	   else return(NULL);
	 }
		       //Function for inserting a node in queue
	void tree::insertqueue(BIN_TREE *node)
	 {
	   if(rear==49)
		  cout << "\nqueue full";
	   rear++;
	   queue[rear]=node;
	 }
		    //Function for deleting a node from queue
	BIN_TREE* tree::delqueue()
	 {
		BIN_TREE *node;
		if(front==rear)
			 cout << "\nqueue empty";
		front++;
		node=queue[front];
		return(node);
	 }
					  //Function to display a tree
	void tree::display(BIN_TREE *root,int x,int y,int count)
	 {
	   if(count-15<=0)
	   {
	   count=count+15;
	   }
	   char t[1];
	   setcolor(1);
	   circle(x,y+10,10);
	   t[0]=root->data;
	   t[1]='\0';
	   setcolor(3);
	   outtextxy(x,y+10,t);	    //Displaying node
	   t[0]='\0';
	   setcolor(15);
	   //delay(100);
	   if(root->left!=NULL)
		  {                       //Display left subtree recursively

			moveto(x-10,y+10);
			lineto(x-count,y+50);

			display(root->left,getx(),gety(),count-15);

		  }
		//delay(100);
		if(root->right!=NULL)
		  {                       //Display right subtree recursively

			moveto(x+10,y+10);
			lineto(x+count,y+50);

			display(root->right,getx(),gety(),count-15);


		 }
	 }

	int tree::empty()           //Function to check empty stack
	 {
	   if (top==0)
		 return 1;
	   else
		 return 0;
	 }
		 //Recursive preorder traversal of tree
	void tree::pre_recursive(BIN_TREE *root)
	 {
	   if(root!=NULL)
		{
		   cout << root->data;
		   pre_recursive(root->left);
		   pre_recursive(root->right);
		}
	 }
		 //Non-recursive preorder traversal of tree
	void  tree::pre_nonrecursive(BIN_TREE *root)
	 {
	   top=0;
	   do
		{
		  if(root!=NULL)
		   {                     //Printing data at node
			  cout << root->data;
			  push(root);
			  root=root->left;    //Checking for left child
		   }
		  else
		   {
			  root=pop();
			  root=root->right;    //Checking for right child
		   }
		}while(!empty()||root!=NULL);
	 }

	void main()
	 {
	   BIN_TREE *root;
	   char post_str[80];
	   int gd=DETECT,gm;
	   tree a;
	   clrscr();
	   a.ini_tree();             //Initialising graphics
	   initgraph(&gd,&gm,"e:\\tc\\bgi");

	   cout << "\t\tPREORDER TRAVERSAL OF TREE"<< endl;
	   cout << "\nEnter the postfix :";
	   cin >> post_str;
	   post_str[strlen(post_str)]='\0';    //Accepting postfix expression

	   root=a.create(post_str);
	   cleardevice();
	   setcolor(3);
	   cout << "\nThe tree is :";
	   int tx=300,ty=20;
	   char ch;
	   a.display(root,300,20,80);
	   while(1)
	   {
	   ch=getch();
		if(ch==0)
		{
		 ch=getch();
		   if(ch==80)
		   {
			ty=ty+10;
			movedown();
			a.display(root,tx,ty,80);
		   }
		   if(ch==72)
		   {
			ty=ty-10;
			moveup();
			a.display(root,tx,ty,80);
		   }
		   if(ch==75)
		   {
			tx=tx-20;
			moveleft();
			a.display(root,tx,ty,80);
		   }
		   if(ch==77)
		   {
			tx=tx+20;
			moveright();
			a.display(root,tx,ty,80);
		   }
		 }
		 if(ch==27)
		 {
		 break;
		 }
		 }


	   getch();

	   gotoxy(10,17);
	   cout << "\n\n\n\n\n\tPreorder Traversal "<< endl ;
	   cout << "\nRecursive traversal is :\n"<< endl;
	   a.pre_recursive(root);
	   cout << "\n\nNonrecursive traversal is :\n"<<endl;
	   a.pre_nonrecursive(root);
	   getch();
	 }

	 void movedown()
	 {
	 int i;
	 setfillstyle(0,1);
	 for(i=0;i<=10;i++)
	 {
	  setfillstyle(1,0);
	  bar(1,(i*40),639,80+(i*40));
	  delay(20);
	  setfillstyle(1,0);
	  bar(1,(i*40),639,80+(i*40));
	 }
	 }
	 void moveright()
	 {
	 int i;
	 setfillstyle(0,1);
	 for(i=0;i<=15;i++)
	 {
	  setfillstyle(1,0);
	  bar((i*40),1,80+(i*40),479);
	  delay(20);
	  setfillstyle(1,0);
	  bar((i*40),1,80+(i*40),479);
	 }
	 }

	 void moveleft()
	 {
	 int i;
	 setfillstyle(0,1);
	 for(i=0;i<=15;i++)
	 {
	  setfillstyle(1,0);
	  bar(569-(i*60),1,639-(i*60),479);
	  delay(20);
	  setfillstyle(1,0);
	  bar(569-(i*60),1,639-(i*60),479);
	 }
	 }


	 void moveup()
	 {
	 int i;

	 for(i=0;i<=10;i++)
	 {
	 setfillstyle(1,0);
	 bar(1,400-(i*40),639,479-(i*40));
	 delay(20);
	 setfillstyle(1,0);
	 bar(1,400-(i*40),639,479-(i*40));
	 }
	 }


