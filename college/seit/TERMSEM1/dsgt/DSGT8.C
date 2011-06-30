void main()
{
	int node[20][3],i,nn,nc,j;
	clrscr();
	for(i=0;i<20;i++)
		node[20][1]=0,node[20][2]=0;
	printf("\nEnter the number of nodes : ");
	scanf("%d",&nn);
	printf("\nEnter the node names starting with root node : ");
	for(i=0;i<nn;i++)
	{
		scanf("%d",&node[i][0]);
		node[i][1]=0;
		node[i][2]=0;
	}
	printf("\nEnter the number of connections?");
	scanf("%d",&nc);
	printf("\nEnter the nodes in ordered pair format\n");
	printf("starting from the root node e.g. 1 2\n");
	for(i=0;i<nc;i++)
	{
		int a,b;
		scanf(" %d%d",&a,&b);
		for(j=0;j<nn;j++)
		{
			if(node[j][0]==a) node[j][1]++;
			if(node[j][0]==b) node[j][2]++;
		}
	}
	printf("\nNode\tOut Degree\tIn Degree\n");
	for(i=0;i<nn;i++)
		printf("%4d\t%12d\t%12d\n",node[i][0],node[i][1],node[i][2]);
	getch();
}

/*Enter the number of nodes : 5

Enter the node names starting with root node : 2
1
3
4
5

Enter the number of connections?2

Enter the nodes in ordered pair format
starting from the root node e.g. 1 2
1 2
2 3

Node    Out Degree      In Degree
	 2               1               1
	 1               1               0
	 3               0               1
	 4               0               0
	 5               0               0


	*/
