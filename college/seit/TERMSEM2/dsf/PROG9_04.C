/* PROGRAM 9.04 : PREFIX TO POSTFIX */
 int stack[30],top=-1;
 push(int val)
 { top++;
  stack[top]=val;
 }

 pop( )
 {  top--;
   return(stack[top+1]);
 }

 isopr(char c)
 { return(c=='+' || c=='-' || c=='*' || c== '/');}

 main( )
 { char s1[100],s2in[100],s3[100],e1[30],e2[30],e3[100],opr[2];
	int i,j,k,l,m,n,m1,m2;
	clrscr( );
   printf("Give the prefix expression...");
   gets(s1);
   for(i=0;s1[i]!='\0';i++);
	l=i;
	k=0;
   for(i=l-1;i>=0;i--)
	  { if( ! isopr(s1[i]))
		   {  s3[k]=s1[i];
			 s3[k+1]='\0';
			 push(k);
			 k=k+2;
		  }
	 else
		  {  opr[0]=s1[i];
			 opr[1]='\0';
			 m1=pop( );
			 m2=pop( );
			 strcpy(e2,s3+m2);
			 strcpy(e1,s3+m1);
			 strcat(e1,e2);
			 strcat(e1,opr);
			 strcpy(s3+m1,e1);
			for(j=m1;s3[j]!='\0';j++);
			 k=j+1;
			push(m1);
   }
 }
 m1=pop( );
 printf("\n\nPOSTFIX EXPRESSION IS ....");
 puts(s3+m1);
 getch( );
 }
