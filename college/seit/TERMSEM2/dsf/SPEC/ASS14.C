/*REPRESENT A GIVEN GRAPH USING ADJENCY LIST OF ARRAY
  AND GENERATE A MINIMUM SPANNING TRERE USING
  KRUSKAL AND PRIM ALGORITHM

  MADHUR AHUJA
  ROLL NO 22
*/
void swap(int *,int *);
void kruk();
void prim();
#define MAX 50
#define infinity 32767
void main()
{
 int ch;
 clrscr();
 printf("\n1 Prim's Algorithm");
 printf("\n2 Kruskal Algorithm");
 printf("\n0 Exit");
 printf("\nEnter choice:");
 scanf("%d",&ch);
 switch(ch)
 {
  case 2:
	kruk();
	break;
  case 1:
   prim();
   break;
  case 0:
   exit(1);
 }
 getch();
}


void kruk()
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

 void prim()
 {
  struct vertex
   {
	int considered;
   }v[MAX];
  struct edge
   {
	int v1,v2,weight,considered;
   }e[MAX*MAX];
  int wt,ed,nv,ne,i,j,exit;
  clrscr();
  printf("Enter the no. of vertices (max. %d) ",MAX);
  scanf("%d",&nv);
  for(i=1;i<=nv;i++)
   {
	v[i].considered=0;
   }
  printf("Enter no. of edges ");
  scanf("%d",&ne);
  printf("Enter the edges & their coresponding weights (e.g.:v1 v2 wt)\n");
  for(i=0;i<ne;i++)
   {
	printf("Enter edge no.%d  ",i+1);
	scanf("%d %d %d",&e[i].v1,&e[i].v2,&e[i].weight);
	e[i].considered=0;
   }
  v[1].considered=1;
  exit=0;
  while(exit==0)
   {
	wt=infinity;
	for(i=1;i<=nv;i++)
	 {
	  if(v[i].considered==1)
	   {
	for(j=0;j<ne;j++)
	 {
	  if(e[j].considered==0)
	   {
		if((e[j].v1==i&&v[e[j].v2].considered==0)||(e[j].v2==i&&v[e[j].v1].considered==0))
		 {
		  if(e[j].weight<wt)
		   {
		wt=e[j].weight;
		ed=j;
		   }
		 }
	   }
	 }
	   }
	 }
	v[e[ed].v1].considered=1;
	v[e[ed].v2].considered=1;
	e[ed].considered=1;
	exit=1;
	for(i=1;i<=nv;i++)
	 {
	  if(v[i].considered==0)
	   {
	exit=0;
	   }
	 }
   }
  printf("\nThe minimal spanning tree obtained by Prim's algorithm is:");
  for(i=0;i<ne;i++)
   {
	if(e[i].considered==1)
	 {
	  printf("\n%d---(%d)---%d",e[i].v1,e[i].weight,e[i].v2);
	 }
   }
  getch();
}

/*

1 Prim's Algorithm
2 Kruskal Algorithm
0 Exit
Enter choice:0

*/













                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
