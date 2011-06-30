/*REPRESENT A GIVEN GRAPH USING ADJENCY LIST OF ARRAY
  AND FIND THE SHORTEST PATH USING DIJKSTRA'S ALGORITHM

  MADHUR AHUJA
  ROLL NO 22
*/
#include<math.h>
int m,n,p[30][30],vertex[30],c = 1,d;
char tag[30];
int small(int);
int check(int);
void main()
{
 int a,i,t,j,n,n1,e,f,sum,count;
 char ch,path[30];
 clrscr();
 sum = 0;
 printf("\n\t\DIJKSTRA'S ALGORITHM");
 printf("\n\n\tENTER THE NO. OF VERTICES :- ");
 scanf("%d",&n);
 n1 = n;
 for(i = 1;i <= n;i++) //INITIALISATION OF THE VERTEX,TAG,DIAGONAL ELEMENTS
	{
	 vertex[i] = 1;
	 tag[i] = 'f';
	 p[i][i] = 0;
	}
 tag[1] = 't';
 printf("\n\n");
 ch = 64;
 for(i = 1;i <= n;i++)
	{
	 for(j = (i + 1);j <= n;j++)
	{
	 printf("\nWT. OF EDGE JOINING VERTICES %c AND %c :- ",(ch + i),(ch + j));
	 scanf("%d",&p[i][j]);
	 p[j][i] = p[i][j];
	}
	}
 for(i = 1;i <= n;i++)
	{
	 for(j = 1;j <= n;j++)
	 {
	 if(p[i][j]==3200)
	 printf("\tX");
	 else
	 if(i==j)
	 printf("\tX");
	 else
	 printf("\t%d",p[i][j]);
	 }
	 printf("\n");
	}
 while(!check(n))
	 {
	  a = small(n);
	  tag[d] = 't'; // MAKE TAG OF SMALLEST VARIABLE 't'.
	  for(i = 1;i <= n;i++)
	 {
	  if(tag[i] == 't')
		continue;
	  else
	  {
	   if(p[d][i] == 0)
		   continue;
	   else
	   {
	   if((p[d][i] + p[1][d]) < p[1][i])   //min(old L(x), L(v) + w(v,x))
		 {
		  p[1][i] = (p[d][i] + p[1][d]);
		  vertex[i] = d;          //REPLACE WITH SMALLEST VARIABLE.
		 }        // END IF.
	   }          // END ELSE.
	  }           // END ELSE.
	 }            // END i LOOP.
	 }                // END WHILE.
 printf("\n\tMINIMUM SHORTEST PATH :- ");
 ch = 64;
 path[0] = (ch + n);
 count = 1;
 while(n != 1)
   {
	path[count] = (ch + vertex[n]);
	count++;
	e = vertex[n];
	n = e;
   }
 for(i = count - 1;i >= 0;i--)
	{
	 printf(" %c -> ",path[i]);
	}
 printf("\b\b\b\b");
 printf("       ");
 printf("\n\n\tWEIGHT = %d",p[1][n1]);
 getch();
}

//FUNCTION TO CHECK THE SMALLEST WEIGHT.
int small(int n)
{
 int t,sm,i,count,c,j;
 sm = 32000;
 d = 2;
 for(i = 2;i <= n;i++)
	{
	 if(sm > p[1][i] && tag[i] == 'f')
       {
	sm = p[1][i];
	d = i;
       }
    }
 return(sm);
}

// CHECK FOR FINAL NODE HAS TAG 'f'
int check(int n)
{
 int i;
 if(tag[n] == 'f')
    return(0);
 return(1);
}

