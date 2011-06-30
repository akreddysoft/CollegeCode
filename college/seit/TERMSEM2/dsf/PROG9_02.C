/* PROGRAM 9.02 : POSTFIX TO PREFIX USING STRINGS */
 #include<stdio.h>
 #include<string.h>

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
 { return(c=='+' || c=='-' || c=='*' || c== '/');
 }

  main( )
  { char s1[100],s2in[100],s3[100],e1[30],e2[30],e3[100],opr[2];
      int i,j,k,l,m,n,m1,m2;
      clrscr( );
     printf("Give the postfix expression...\n\n\n");
      gets(s1);
     for(i=0;s1[i]!='\0';i++);
      l=i;
      k=0;
     for(i=0;i<l;i++)
       {   if ( ! isopr(s1[i]))
               { s3[k]=s1[i];
                 s3[k+1]='\0';
                 push(k);
                 k=k+2;
               }
          else
              { opr[0]=s1[i];
                opr[1]='\0';
                m2=pop();
                m1=pop();
                strcpy(e2,s3+m2);
                strcpy(e1,opr);
                strcat(e1,s3+m1);
                strcat(e1,e2);
                strcpy(s3+m1,e1);
               for(j=m1;s3[j]!='\0';j++);
                 k=j+1;
                push(m1);
              }
         }
    m1=pop();
    printf("\n\nPREFIX EXPRESSION IS ....\n\n");
    puts(s3+m1);
    getch( );
 }

