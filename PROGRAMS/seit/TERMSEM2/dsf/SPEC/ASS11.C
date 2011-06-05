/*CREATE A BINARY THREADED TREE AND PERFORM ALL 3 TRAVERSALS
  
  MADHUR AHUJA
  ROLL NO 22
*/
#include<alloc.h>
	typedef struct tree
	{
		int data ;
		char lbit;
		char rbit;
		struct tree *left;
		struct tree *right;
	}tree;
	tree *create();
 //FUNCTION FOR TRAVERSAL OF RIGHT SON
	int right_son(tree *header,tree * root);
// FUNCTION FOR TRAVERSAL OF PREORDER
	void preorder(tree *header);
// FUNCTION FOR INORDER TRAVERSAL
	void inorder(tree *);
// FUNCTION FOR DISPLAY
	void display(tree * header);
// FUNCTION FOR POSTORDER TRAVERSAL
	void postorder(tree *header);
void main()
  {
    int ch;
    tree *header;
    clrscr();
    printf("\n\t\t\tTHREADED BINARY TREE");
    while(1)
    {
     printf("\n\n*** MENU ***\n");
     printf("1:CREATE THREADED TREE\n2:INORDER  TRAVERSAL\n");
     printf("3:PRE_ORDER TRAVERSAL \n 4:POST_ORDERTRAVERSAL\n");
     printf("5:EXIT \n");
     printf("ENTER THE CHOICE:\t");
     scanf("%d",&ch);
     printf("\n");
     switch(ch)
     {
     case 1:
		      header=create();
		      break;
     case 2:
			printf("\n\t\t\tINORDER TRAVERSAL\n\n");
			inorder(header);
			break;
     case 3:
			printf("\n\t\t\tPREORDER TRAVERSAL\n\n");
			preorder(header);
			break;
     case 4:
			printf("\n\t\t\tPOSTORDER TRAVERSAL\n\n");
			postorder(header);
			break;
    case 5: exit(0);
		default:printf("\nCHECK THE NO.ENTERED\n");
			   }
		      }
   }

tree * create()       //CREATION OF  A TREE
{
	char ans;
	int flag;
	tree *root,*node,*temp,*header,*head;
	header=(tree *)malloc(sizeof(tree));
	header->left=header;
	header->right=header;
	header->lbit='T';        //'T' IS IF LEFT NODE IS PRESENT
	header->rbit='T';        //'T' IS IF RIGHT NODE IS PRESENT
	root=(tree *)malloc(sizeof(tree));
	printf("\nENTER DATA AT THE ROOT:\t");
	scanf("%d",&root->data);
	root->left=header;
	root->right=header;
	temp=root;
	header->left=root;
	printf("\n\tDO YOU WANT TO CONTINUE...\t");
	ans=getch();
	while(ans=='y'|| ans=='Y')
	{
		flag=0;
		node=(tree *)malloc(sizeof(tree));
		printf("\n\nENTER THE DATA:\t");
		scanf("%d",&node->data);
		temp=root;
		do
		{
			if(node->data<temp->data)
			{
				if(temp->left==header)
				{
				 temp->left=node;
				 temp->lbit='T';
				 node->right=temp;
				 node->rbit='F';
				 node->left=header;
				 node->lbit='F';
				 break;
				}
				else
				{
					if(temp->lbit=='F')
					{
					 node->left=temp->left;
					 node->lbit='F';
					 node->right=temp;
					 node->rbit='F';
					 temp->left=node;
					 temp->lbit='T';
					 break;
					}
				}
			temp=temp->left;
				}
			else
			{
				if(temp->right==header)
				{
				 node->right=temp->right;
				 node->rbit='F';
				 //'F' IS ASSIGNED WHEN VALUE IS FALSE
				 node->left=temp;
				 node->lbit='F';
				 temp->right=node;
				 temp->rbit='T';
				 break;
				}
				else
				{
					if(temp->rbit=='F')
					{
					node->right=temp->right;
					node->rbit='F';
					node->left=temp;
					node->lbit='F';
					temp->right=node;
					temp->rbit='T';
					break;
					}
				}
				temp=temp->right;
			}
		}while(flag==0);
		printf("\n\t\tDO YOU WANT TO CONTINUE...\t");
		ans=getche();
}
	return(header);
}


void inorder(tree * header)    // INORDER TRAVERSAL
{
	int flag=0;
tree *temp;
	temp=(tree *)malloc(sizeof(tree));
	temp=header->left;
	printf("\n");
	do
	{
			if(temp->lbit=='T' && flag==0)
		{
			temp=temp->left;
		}
		else
		{
			for( ; ; )
		{
				printf("\t%d",temp->data);
				if(temp->rbit=='T')
				{
					flag=0;
					temp=temp->right;
					break;
				}
				else
				{
					if(temp!=header)
					{
						flag=1;
						temp=temp->right;
						break;
					}
				}
			}
			}
} while(temp!=header);
}

	void preorder(tree *header)       // PRE_ORDER  TRAVERSAL
{
	int flag=0;
	tree *temp;
	temp=header->left;
	printf("\n");
	do
	{
	printf("\t%d",temp->data);
	if((temp->lbit=='T')&&(flag==0))
	{
	temp=temp->left;
	}
	else
	{
		for( ; ;)
		{
			if(temp->rbit=='T')
			{
				flag=0;
				temp=temp->right;
				break;
				}
				else
				{
					if(temp!=header)
					{
					flag=1;
					temp=temp->right;
					}
				}
			}
		}
	}while(temp!=header);
	}

	void postorder(tree *header)      // POST_ORDER  TRAVERSAL
	{
	  int flag=0,temp=1;
	  tree *root;
	  root=header;
	  printf("\n");
	  for( ;temp!=0; )
	  {
	    if((root->lbit=='T')&&(flag==0))
	    {
	      root=root->left;
	    }
	    else
	    {
	      if(root->rbit=='T')
	      {
		root=root->right;
		flag=0;
	      }
	     else
	     {
	      for( ; ; )
	      {
		printf("\t%d",root->data);
		if(right_son(header,root))
		{
		  while(root->lbit=='T')
		  {
		    root=root->left;
		  }
		  root=root->left;
		  }
		  else
		  {
		   while(root->rbit=='T')
		   {
		     root=root->right;
		   }
		    root=root->right;
		    if(root==header)
		    {
		      temp=0;
		      break;
		    }
		    else
		    {
		     flag=1;
		     break;
		   }
		  }
		 }
	     }
	   }
	 }
	}

	int right_son(tree *header,tree *root)
	{
		int flag=0;
		tree *temp;
		temp=header->left;
		do
		{
			if((temp->lbit=='T')&&(flag==0))
			{
				temp=temp->left;
				if(root==temp)
				{
					return(0);
				}
			}
			else
			{
				if(temp->rbit=='T')
				{
				temp=temp->right;
				if(root==temp)
				{
					return(1);
				}
				flag=0;
			}
			else
			{
			if(temp->right!=header)
			{
			temp=temp->right;
			flag=1;
		}
					else
					{
						return(0);
					}
				}
			}
		}while(temp!=header);
	return 0;
	}



