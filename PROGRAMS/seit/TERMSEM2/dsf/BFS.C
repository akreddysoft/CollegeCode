/********* PROGRAM TO REPRESENT A GRAPH USING ADJECENCY LIST */
#define NULL 0
struct node
{
	int data, flag;
	struct node *next;
	struct edge *headedge;
};
struct edge
{
	struct node *adnode;
	struct edge *nextedge;
};

void insertedge( struct node *s, int from , int to);
void bfs( struct node *s);
void dfs( struct node *s);
void main()
{
	struct node *start = NULL, *npr, *curnode;
	struct edge *curedge;
	int total, i, n1,n2, ch;
	char dir;
	do
	{
		clrscr();
		printf("\n 1. Create new graph");
		printf("\n 2. Add new node to graph");
		printf("\n 3. Add new edge to the graph");
		printf("\n 4. Depth first search traversal ");
		printf("\n 5. Breadth first search traversal");
		printf("\n 6. Display the tree ");
		printf("\n 7. Exit");
		printf("\n Enter your choice ");
		scanf("%d",&ch);
		switch(ch)
		{
			case 1:
			clrscr();
			start = NULL;
			printf("\n Enter the total number of nodes :");
			scanf("%d",&total);

			for( i=0; i<total; i++)
			{
				npr = (struct node *) malloc (sizeof(struct node));
				printf("\n Enter the node value :");
				scanf("%d",&npr->data);
				npr->flag = 0;
				npr->next = NULL;
				npr->headedge = NULL;

				if ( start == NULL)
					curnode = start = npr;
				else
				{
					curnode->next = npr;
					curnode = curnode->next;
				}
			}
			clrscr();
			printf("\n Enter total number of edges :");
			scanf("%d",&total);
			printf("\n Graph is directed or not ? [y/n] ");
			flushall();
			scanf("%c",&dir);

			for (i=0; i<total ; i++)
			{
				printf("\n Enter the edges from to = ");
				scanf("%d %d",&n1, &n2);
				insertedge(start, n1, n2);
				if ((dir != 'y') && (dir != 'Y'))
					insertedge(start, n2, n1);
			}
			break;

			/******ADD NEW NODE TO EXISTING GRAPH ***************/
			case 2 :
			npr = ( struct node *) malloc(sizeof(struct node));
			printf("\n Enter the node value :");
			scanf("%d",&npr->data);
			npr->flag = 0;
			npr->next = NULL;
			npr->headedge = NULL;
			if ( start == NULL)
				curnode = start = npr;
			else
				{
					curnode = start;
					while( curnode->next != NULL)
						curnode = curnode->next;
					curnode->next = npr;
					curnode = curnode->next;
				}
			break;

			/******** ADD NEW EDGE TO EXISTING GRAPH *****/
			case 3:
			printf("\n Graph is directed or not ? [y/n]");
			flushall();
			scanf("%c", &dir);
				printf("\n Enter the edges from to = ");
				scanf("%d %d",&n1, &n2);
				insertedge(start, n1, n2);
				if ( (dir != 'y') && ( dir != 'Y' ))
					insertedge( start, n2, n2);

			break;

			/* ************* DFS TRAVERSAL *****************/
			case 4 :
			curnode = start;
			while( curnode != NULL)
			{
				curnode->flag = 0;
				curnode = curnode->next;
			}
			clrscr();
			printf("\n Depth first search traversal is :");
			dfs(start);
			do
			{
				curnode = start;
				while( curnode->flag == 1)
				{
					curnode = curnode->next;
					if ( curnode == NULL)
						break;
				}
				if ( curnode != NULL )
					dfs(curnode);
			} while( curnode != NULL);
			break;

			/**************BFS traversal **********/
			case 5:
			curnode = start;
			while( curnode != NULL)
			{
				curnode->flag = 0;
				curnode = curnode->next;
			}
			clrscr();
			printf("\n The breadth first search traversal is :");
			bfs(start);
			do
			{
				curnode = start;
				while( curnode->flag == 1)
				{
					curnode = curnode->next;
					if ( curnode == NULL)
						break;
				}
					if ( curnode != NULL)
						bfs(curnode);
			} while( curnode != NULL);
			break;

			case 6 :
			clrscr();
			printf("\n The given graph is :\n\n");
			printf("       NODE\tConnected to \n");
			curnode = start;
			while( curnode != NULL)
			{
				printf("\n\t %d  =>",curnode->data);
				curedge = curnode->headedge;
				while( curedge != NULL)
				{
					printf("\t%d",curedge->adnode->data);
					curedge = curedge->nextedge;
				}
				curnode = curnode->next;
			}
			break;

			case 7:
			exit(0);
			default :
			printf("\n Invalid operation ");
			break;
		}
		getch();
	}while(1);
}

/*******FUNCTION FOR ADDING THE EDGE BETWEEN TWO NODES ***************/
void insertedge( struct node *s, int from, int to)
{
	struct node *cnode = s;
	struct edge *cedge, *ptredge;

	while( cnode->data != from)
	{
		cnode = cnode->next;
		if ( cnode == NULL)
		{
			printf("\n\t Node value  %d does not exists .\n\n",from);
			return;
		}
	}
	ptredge = ( struct edge *) malloc ( sizeof(struct edge));
	ptredge->nextedge = NULL;
	cedge = cnode->headedge;

	if ( cedge == NULL)
		cnode->headedge =ptredge;
	else
	{
		while( cedge->nextedge != NULL)
			cedge = cedge->nextedge;
		cedge->nextedge = ptredge;
	}
	cnode = s;
	while( cnode->data != to)
	{
		cnode = cnode->next;
		if ( cnode == NULL)
		{
			printf("\n\t Node value %d does not exists ",to);
			return;
		}
	}
	ptredge->adnode = cnode ;
}

/************** FUNCTION FOR DFS ********************/
void dfs( struct node *s)
{
	struct node *cnode=s, *STACK[50];
	struct edge *cedge;
	int top = 0;
	if ( cnode == NULL)
	{
		printf("\n\n Graph does not exists ");
		return;
	}
	printf("\t%d",cnode->data);
	cnode->flag = 1;
	top++;
	STACK[top] = cnode;
	while( top != 0)
	{
		cedge = STACK[top]->headedge;
		while( cedge->adnode->flag != 0)
		{
			cedge = cedge->nextedge;
			if ( cedge == NULL)
			break;
		}
		if ( cedge != NULL)
		{
			printf("\t%d",cedge->adnode->data);
			cedge->adnode->flag = 1;
			top++;
			STACK[top] = cedge->adnode;
		}
		else
			top--;
	}
}

/************** FUNCTION FOR BFS TRAVERSAL ***************************/

void bfs( struct node *s)
{
	struct node *cnode=s, *Q[50];
	struct edge *cedge;
	int front=0, rear = -1;

	if ( cnode == NULL)
	{
		printf("\n The graph does not exists ");
		return;
	}
	printf("\t%d",cnode->data);
	cnode->flag = 1;
	cedge = cnode->headedge;
	while( cedge != NULL)
	{
		rear++;
		Q[rear] = cedge->adnode;
		cedge = cedge->nextedge;
	}
	while( front <= rear)
	{
		cnode = Q[front];
		front++;
		if ( cnode->flag == 0)
			printf("\t%d",cnode->data);
		cnode->flag = 1;
		cedge = cnode->headedge;

		while( cedge != NULL)
		{
			rear++;
			Q[rear] = cedge->adnode;
			cedge = cedge->nextedge;
		}
	}
}