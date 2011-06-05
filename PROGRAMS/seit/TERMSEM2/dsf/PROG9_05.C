/*	 PROGRAM 9.05 : CREATION OF EXPRESSION TREE FROM PRFIX */
	 #include<stdio.h>
	 #include<alloc.h>

	 typedef struct tree
	 { char c;
	   struct tree *left,*right;
	 } *TR;

	 TR header,stack[20];
	 int top=-1;
	 int isopr(char c)
	 { return(c=='+'||c=='-'||c=='*'||c=='/');
	  }
	
	  push(TR t)
	  { top++;
	    stack[top]=t;
	  }
	
	  TR pop()
	  { top--;
	    return(stack[top+1]);
	  }
	

  TR create( )
	  { TR new;
	    new=malloc(sizeof(struct tree));
	    new->left=NULL;
    new->right=NULL;
    return(new);
  }
  inorder( TR t)
  { if( t )
     { inorder(t->left);
        putchar(t->c);
       inorder(t->right);
      } 
  }
  postorder( TR t)
  { if( t )
    { postorder(t->left);
      postorder(t->right);
      putchar(t->c);
    }
}
  main( )
  { char prefix[30],op1;
    TR temp,new;
    int i=0,flag;
    clrscr();
    printf("Give the prefix expression \n");
    gets(prefix);
    header=create();                     /*creates header */
    temp=header;
   for(i=0;prefix[i]!='\0';i++)
    { new = create();
      new->c=prefix[i];
      while(isopr(new->c))             /* while operators attach as left son*/
          {   temp->left=new;
              push(temp);                   /* Push the node in the stack */
              temp=temp->left;
              new=create();
               i++;
              new->c=prefix[i];
           }
      temp->left=new;                  /* operand after operator as left son */
      flag=0;
      do{
              i++;
            new=create();
             new->c=prefix[i];
            temp->right=new;               /* next char is attached as right son */
	    if( isopr(new->c))
	               {	temp=new;                   /* if opearator  above procedure */
		            flag=1;
	               }
	             else
		    if(top!=-1)
		         temp=pop();               /* otherwisw if not stack empty , pop */
	        }while(flag==0&&top!=-1);
	     }
	    printf("\n\n The inorder expression is .... \n");
	   inorder(header->left);
	    printf("\n\n The postorder expression is .... \n");
	   postorder(header->left);
	    getch();
	 }
