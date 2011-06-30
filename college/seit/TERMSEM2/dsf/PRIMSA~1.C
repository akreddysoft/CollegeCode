#define infinity 32767
#define MAX 10
struct vertex
{
	int considered;
}v[MAX];
struct edge
{
	int v1,v2,weight,considered;
}e[MAX*MAX];

void main()
 {
  int wt,ed,nv,ne,i,j,exit;
  clrscr();
  printf("Enter the no. of vertices (max. %d) ",MAX);
  scanf("%d",&nv);
  for(i=1;i<=nv;i++)
	v[i].considered=0;
  printf("Enter no. of edges ");
  scanf("%d",&ne);
  printf("Enter the edges & their coresponding weights (e.g.:v1 v2 wt)\n");
  for(i=0;i<ne;i++)
   {
	printf("Enter edge no.%d  ",i+1);
	scanf("%d %d %d",&e[i].v1,&e[i].v2,&e[i].weight);
	e[i].considered=0;
   }
///////////////////////////////////////////////////////////////
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
		if(v[i].considered==0)
			exit=0;
  }
///////////////////////////////////////////////////////////////////
  printf("\nThe minimal spanning tree obtained by Prim's algorithm is:");
  for(i=0;i<ne;i++)
   {
	if(e[i].considered==1)
	  printf("\n%d---(%d)---%d",e[i].v1,e[i].weight,e[i].v2);
   }
  getch();
 }