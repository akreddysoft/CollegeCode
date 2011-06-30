/*PROGRAM TO CREATE A BINARY SEARCH TREE AND PERFORM
*/
#include<alloc.h>
#include<graphics.h>
struct tree
{
int data;       //DECLARING STRUCTURE FOR TREE
struct tree *left,*right;
};

struct tree *root,*temp,*root1,*temp1;
int no,flag=0,k=0,count,a[15],i=0,k,height;
menu()
{
   printf("\n\n\n THE PROGRAM TO REPRESENT A BINARY SEARCH TREE\n\n");

   printf("\n 1. CREATE A BINARY TREE");

   printf("\n 2. DISPLAY OF THE TREE");
   printf("\n 3. INSERT THE ELEMENT IN THE TREE");
   printf("\n 4. DELETION OF THE ELEMENT");
   printf("\n 5. EXIT \n\n");
   printf("\n ENTER YOUR CHOICE");
   return 0;
}

main()          //MAIN FUNCTION STARTS
{   int ch,gd=DETECT,gm,h;
	while(1)
	{	menu();
		scanf("%d",&ch);
		switch(ch)
		{   case 1:
		   loop2:
		    printf("\n ENTER THE NUMBER YOU WANT TO INSERT");
			  scanf("%d",&no);
			  if(root==NULL)
			  {
			  temp=(struct tree *)malloc(sizeof(struct tree));
				  temp->left=NULL;
				  temp->right=NULL;
				  temp->data=no;
				  root=temp;
				  root1=root;}
			  else
				 insert(root);        //CALLING INSERTION FUNCTION
			  break;
			case 2:

			if(root==NULL)
			 printf("\n THE TREE IS EMPTY ");
			  else
			   {

			   initgraph(&gd,&gm,"e:\\tc\\bgi");
			  //CALLING FUNCTION FOR DISPLAY
				 display(root,1,getmaxx()+1,15,1);  // 640 is the getmaxx
				 setcolor(14);
				 outtextxy(370,15,"<--- ROOT");
				 setcolor(4);
				 settextstyle(4,0,3);
				 outtextxy(200,430,"Fig :-  BINARY TREE ");
				 setcolor(getmaxcolor());
				 getch();
				 closegraph();

			   } break;
			case 3:
			    goto loop2;
		      case 4:
	     //	      for(i=0;i<15;i++)
	       //	      a[i]=0;
		      del();
		     break;
		case 5:
		exit(1);
}	}	}

// DISPLAYING THE GRAPHICAL REPRESENTATION OF THE TREE
display(struct tree *trav,int lval,int hval,int y,int level)
{  char msg[10];
   int n=1,i;
   sprintf(msg,"%d",trav->data);
   outtextxy((lval+hval)/2,y,msg);
   circle(((lval+hval)/2)+3,y+3,10);	//FOR DISPLAY OF CIRCLE
   getch();
   for(i=0;i<level;i++)
   n=n*2;
   if(trav->left!=NULL)
   {  flag=1;
	  line((lval+hval)/2-4,y-4,(lval+(hval-(640/n)))/2,y+40);  //FOR DISPLAY OF LINE
	  display(trav->left,lval,hval-(640/n),y+40,level+1);
   }
   if(trav->right!=NULL)
   {  flag=0;
	  line((lval+hval)/2+4,y-4,(lval+(640/n)+hval)/2,y+40);
	  display(trav->right,lval+(640/n),hval,y+40,level+1);
   }
   return;
}
/* INSERTION FUNCTION */
insert(struct tree *trav)
{   if(no<trav->data)
	{   if(trav->left==NULL)
		{   temp=(struct tree *)malloc(sizeof(struct tree));
			temp->left=NULL;
			temp->right=NULL;
			temp->data=no;
			trav->left=temp;
		}
		else
		insert(trav->left);
	}
	else
	{  if(trav->right==NULL)
		{   temp=(struct tree *)malloc(sizeof(struct tree));
			temp->left=NULL;
			temp->right=NULL;
			temp->data=no;
			trav->right=temp;
		}
		else
		 insert(trav->right);
}
  return 0;
 }


del()          //FUNCTION FOR DELETION OF THE ELEMENT
{
	  int flag=0,height;
	printf("\n ENTER THE NUMBER YOU WANT TO DELETE ");
	scanf("%d",&no);
	intrav(root);
	 count=i;
	 for(i=0;i<count;i++)
	{        flag=1;
		 if(no==a[i])
		 break;
	 }

	height=height1(root,1);
	i++;
	k=0;
	temp=root;
	temp1=malloc(sizeof(struct tree));
	while(height!=k)
{
	if(no==temp->data)
	{
		if(no==root->data)
		{
		  temp->data=a[i];
		  i++;
		  temp1=temp->right;
		  start:
		  if(temp1->data==a[i])
		       {
			temp1->left=NULL;
		       break;
		       }
		       else
			{
			if(temp1->data<no)
			 temp1=temp1->right;
				else
				{
				if(temp1->data>no)
				temp1=temp1->left;
				}
				goto start;
			}
		}
	      else
	      { 	 k++;
			flag=1;
			if(temp->left==NULL)
			{
			temp1=temp->right;
			temp=temp1;
			break;
			}
			if(temp->right==NULL)
			{temp1=temp->left;
			temp=temp1;
			break;
			}

			 temp->data=a[i];
		    again:
			 temp1=temp->left;

			if(temp1->data==a[i])
				{
				temp->left=NULL;
				   break;
				}
			 else
				{   temp1=temp->right;
				  if(temp1->data==a[i])
					{
					temp->right=NULL;
					  break;
					 }
				   else
				      {
				   if(no<a[i])
				     temp=temp->right;
				     else
				     temp=temp->left;
				     goto again;
				}      }
	      }

	  break;
	 }
	 else
	 {
		k++;
		if(no<temp->data)
		temp=temp->left;
		 else
		 if(no>temp->data)
		temp=temp->right;
	  }
	}

	 if(flag==0)
	 printf("\n data can not be found");
	 getch();
	 return 0;
}

 intrav(struct tree *trav)  /* FUNCTION FOR  IN-ORDER TRAVERSAL */
	   {
		if(trav!=NULL)
		{
	     intrav(trav->left);
		 a[i++]=trav->data;
	     intrav(trav->right);
		 }
 return 0;
 }


int  height1(struct tree *trav,int level)    //FUNCTION TO FIND THE HEIGHT
{      if(trav!=NULL)
	{
		if((trav->left==NULL)&&(trav->right==NULL))
		{
		if(level>k)
		k=level;
		}
		else
		{
			height1(trav->left,level+1);
			height1(trav->right,level+1) ;
		}
	}
	return k;
}

