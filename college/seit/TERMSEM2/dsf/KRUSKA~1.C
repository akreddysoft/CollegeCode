/* Program to demonstrate Kruskal's Algorithm */
void swap(int *,int *);
void main()
 {
  int ver,edges,arr[20][3],i,j,edge[20],count=0;
  clrscr();
  printf("\t\t\tKruskal's Algorithm\n");
  printf("\t\t\t--------- ---------\n\n");
  printf("\n\nEnter the no. of vertices: ");
  scanf("%d",&ver);
  printf("\n\nEnter the no. of edges: ");
  scanf("%d",&edges);
  printf("\n\nEnter the vertices and weights of the following edges: \n");
  for(i=0;i<edges;i++)
  {
	printf("Edge %d:",i+1);
	scanf("%d %d %d",&arr[i][0],&arr[i][1],&arr[i][2]);
  }
  for(i=0;i<=edges;i++)
	edge[i]=i;
  for(i=0;i<edges-1;i++)
   {
	for(j=0;j<edges-i-1;j++)
	 {
	  if(arr[j][2]>arr[j+1][2])
		swap(&arr[j][0],&arr[j+1][0]);
	 }
   }
  /////////////////////////////////////////////////////////
  for(i=0;i<edges;i++)
   {
	if(edge[arr[i][0]]!=edge[arr[i][1]])
	 {
	  count++;
	  printf("%d  %d  %d\n",arr[i][0],arr[i][1],arr[i][2]);
	  if(edge[arr[i][0]]==arr[i][0]&&edge[arr[i][1]]==arr[i][1])
			edge[arr[i][1]]=edge[arr[i][0]];
	  else
	   {
		if(edge[arr[i][1]]!=arr[i][1])
			edge[arr[i][0]]=edge[arr[i][1]];
		else
			edge[arr[i][1]]=edge[arr[i][0]];
	   }
	  if(count==(ver-1))
		break;
	 }
   }
/////////////////////////////////////////////////////////
  getch();
 }


void swap(int *a,int *b)
 {
  int temp;
  temp=*a;
  *a=*b;
  *b=temp;

  temp=*(a+1);
  *(a+1)=*(b+1);
  *(b+1)=temp;

  temp=*(a+2);
  *(a+2)=*(b+2);
  *(b+2)=temp;
 }
