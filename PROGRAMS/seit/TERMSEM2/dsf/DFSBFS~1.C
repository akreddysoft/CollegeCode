/*   PROGRAM FOR DFS AND BFS OF  A GRAPH*/

int chk[25],chb[25],n = 9;
int con[10][10],bon[10][10];
intgrp(int );
push(struct stack *ps,int x);
pop(struct stack *ps);
emp(struct queue *ps);
addq(struct queue *ps,int x);
del(struct queue *ps);
check(void);


struct stack
{
 int top;
 int terms[100];
}*s;

struct queue
{
 int rear,front;
 int items[100];
}q = {-1,0,};

int p,t,col,k,l,tag[25];//,con[25][25];

input()
{
 int i,j,f,c;
 printf("\n\n\tENTER THE NO. OF NODES IN GRAPH :- ");
 scanf("%d",&n);
 intgrp(n);
 for(i = 1;i <= n;i++)
	 tag[i] = 0;
 clrscr();
 for(i = 1;i <= n;i++)
	{
	 printf("\n\tENTER NO. OF NODES CONNECTED WITH %dth NODE :- ",i);
	 scanf("%d",&k);
	 l = k - tag[i];
	 if(i == 1)
	   {
	printf("\n\t\tENTER NODES CONNECTED TO %dth NODE",i);
	printf("\n\t\t컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴");
	   }
	 else
	 {
	  if(l != 0)
	{
	 printf("\n\t\tENTER NODES CONNECTED TO %dth NODE", i);
	 printf("\n\t\t컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴");
	 printf("\n\n\t PLEASE ENTER NODES OTHER THAN FOLLOWING NODES :- ");
	 for(f = 1;f <= 9;f++)
		 if(con[i][f] == 1)
		   printf("%d ",f);
	   }                        // END IF.
	 }				// END ELSE.
	 printf("\n\n");
	 for(j = 1;j <= l;j++)
	{
	 printf("\t%dth NODE :- ",j);
	 scanf("%d",&c);
	 con[i][c] = 1;
	 con[c][i] = 1;
	 tag[c]++;
	}
	}
	return 0;
}

// INITIALISE GRAPH AS UNCONNECTED.
intgrp(int m)
{
 int i,j;
 for(i = 1;i <= m;i++)
	{
	 tag[i] = 0;
	 for(j = 1;j <= m;j++)
	con[i][j] = 0;
	}
	return 0;
}

// MAKES ENTRIES OF ALL ROWS AND Mth COLUMN ZERO.
 intcol(int m)
{
 int i,p,t;
 for(i = 1;i <= n;i++)
	con[i][m] = 0;
	return 0;

}

// DEPTH FIRST SEARCH.

dfs(int row)
{
 int i,ck;
 if(chk[row] == 0)  		// CHECK IF NODE IS VISITED OR NOT.
 printf("%d ",row);
 chk[row] = 1;                  // MARK THE NODE AS VISITED.
 ck = check();			// CHECK IF ALL NODES ARE VISITED OR NOT.
 if(ck == 0)
   {
	getch();
	return 0;//exit(1);
   }

 // CHECK FOR NEXT CONNECTED NODE.
 for(i = 1;i <= n;i++)
	{
	 if(con[row][i] == 1)
	   {
	col = i;                // IF ANY NODE CONNECTED FOUND YET TO BE
	push(s,i);              // VISITED THEN PUSH IT ON STACK.
	break;
	   }
	}
 intcol(col); 			// MAKE COLth COLUMN OF ALL ROWS ZERO.
 p = pop(s);                    // POP THE VISITED ENTRY.

// CHECK IF ANY UNVISITED NODE PRESENT OR NOT.
 for(i = 1;i <= n;i++)
	{
	 if(con[col][i] == 1)
	   {
	t = 1;
	break;
	   }
	 else
	   t = 0;
	}
 if(t == 1)                     // IF ANY UNVISITED NODE PUSH ON STACK
   push(s,col);			// ELSE CONTINUE;
 dfs(p);
 return 0;
}

// PUSH AND POP OPERATION FOR DFS.

push(struct stack *ps,int x)
{
 ps -> terms[++(ps -> top)] = x;
 return 0;
}

pop(struct stack *ps)
{
 int p;
 p = ps -> terms[ps -> top--];
 return(p);
}

// BREADTH FIRST SEARCH.

 bfs(int row)
{
 int i,ck;
 if(chb[row] == 0)  		// CHECK IF NODE IS VISITED OR NOT.
   printf("%d ",row);
 chb[row] = 1;                  // MARK THE NODE AS VISITED.
 ck = check();			// CHECK IF ALL NODES ARE VISITED OR NOT.
 if(ck == 0)
   {
	emp(&q);
	getch();
	exit(1);
   }
// CHECK FOR NEXT CONNECTED NODE.
 for(i = 1;i <= n;i++)
	{
	 if(con[row][i] == 1)
	   {
	col = i;                // IF ANY NODE CONNECTED FOUND YET TO BE
	intcol(col);
	addq(&q,i);              // VISITED THEN PUSH IT ON STACK.
	   }
	}
 p = del(&q);                    // POP THE VISITED ENTRY.
 if(p == 0)
   {
	getch();
	exit(1);
   }
 bfs(p);
 return 0;
}

check()
{
 int i,j;
 for(i = 1;i <= n;i++)
	{
	 for(j = 1;j <= n;j++)
	{
	 if(con[i][j] == 1)
	   return(1);
	}
	}
 return(0);
}

// ADD AND DELETE OPERATION FOR BFS.

 addq(struct queue *ps,int x)
{
 ps -> items[++ps -> rear] = x;
 return 0;
}

del(struct queue *ps)
{
 int p;
 p = ps -> items[ps -> front++];
 return(p);
}

// EMPTY THE QUEUE IF ALL NODES ARE VISITED.
 emp(struct queue *ps)
{
 int i;
 for(i = ps -> front;i <= ps -> rear;i++)
	   printf("%d ",ps -> items[i]);
 return 0;
}

equal1()
{
 int i,j;
 for(i = 1;i <= n;i++)
	{
	 for(j = 1;j <= n;j++)
	bon[i][j] = con[i][j];
	}
	return 0;
}

equal2()
{
 int i,j;
 for(i = 1;i <= n;i++)
	{
	 for(j = 1;j <= n;j++)
	con[i][j] = bon[i][j];
	}
	return 0;
}

void main()
{
 int choice;
 clrscr();
 printf("\n\n\t\tGRAPH TRAVERSAL.");
 input();
 equal1();
 clrscr();
 printf("\n\n\t\tDEPTH FIRST TRAVERSAL OF THE GRAPH :- ");
 printf("\n\n\t\t");
 push(s,1);
 intcol(1);
 dfs(1);
 equal2();
 printf("\n\n\t\tBREADTH FIRST TRAVERSAL OF THE GRAPH :- ");
 printf("\n\n\t\t");
 addq(&q,1);
 intcol(1);
 bfs(1);
}

				
/*				O U T P U T

				GRAPH TRAVERSAL.

		ENTER THE NO. OF NODES IN GRAPH :- 4

		ENTER NO. OF NODES CONNECTED WITH 1th NODE :- 2

				ENTER NODES CONNECTED TO 1th NODE
				컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴

		1th NODE :- 2
		2th NODE :- 3

		ENTER NO. OF NODES CONNECTED WITH 2th NODE :- 2

				ENTER NODES CONNECTED TO 2th NODE
				컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴

		 PLEASE ENTER NODES OTHER THAN FOLLOWING NODES :- 1

		1th NODE :- 4

		ENTER NO. OF NODES CONNECTED WITH 3th NODE :- 1


		ENTER NO. OF NODES CONNECTED WITH 4th NODE :- 2

				ENTER NODES CONNECTED TO 4th NODE
				컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴

		 PLEASE ENTER NODES OTHER THAN FOLLOWING NODES :- 2

		1th NODE :- 4

		DEPTH FIRST TRAVERSAL OF THE GRAPH :-

		1 2 4 3

		BREADTH FIRST TRAVERSAL OF THE GRAPH :-

		1 2 3 4
*/