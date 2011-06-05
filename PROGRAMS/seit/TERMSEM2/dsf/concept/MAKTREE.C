#include<malloc.h>
#include<stack.h>
display(struct tree *trav,int lval,int hval,int y,int level);
struct tree
{
	int data;
	struct tree *left,*right;
};
typedef struct tree tree;
int size=sizeof(struct tree);
int n;
void main (void)
{
	struct tree *root=NULL,*temp;
	int i,ch;
	int inorder[30],preorder[30];
 //	int gd=DETECT,gm,flag;
	clrscr();
	printf("\nEnter the no.of nodes:");
	scanf("%d",&n);
	printf("\nEnter the inorder traversal:");
	for(i=0;i<n;++i)
		scan("%d",inorder[i]);
	printf("\nEnter the preorder traversal:");
	for(i=0;i<n;++i)
		scan("%d",inorder[i]);
	root=malloc(size);
	root->data=preorder[0];
	root->left=NULL;
	root->right=NULL;

}
get(int inorder[30],int preorder[30])
{
	int curr,pos,i,j;
	struct stack *left,*right,*top=NULL,*top1=NULL;
	for(i=0;i<n;++i)
	{
		curr=preorder[i];
		for(j=0;j<n;++j)
		{
			if(inorder[j]==curr)
			{
				pos=j;
				break;
			}
		}
		for(j=0;j<pos;++j)
		{
			push(left,top,inorder[j]);
		}
		for(i=pos;i<n;++i)
		{
			push(right,top1,inorder[j]);
		}
		nexcurr=preorder[i+1];
