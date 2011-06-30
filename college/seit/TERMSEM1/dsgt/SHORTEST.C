/*   SHORTEST PATH OF THE GIVEN GRAPH */
#define member 1
#define nonmember 0
#define infinity 999
struct arc
{
 int wt;
};
struct arc g[10][10];
int path[10];
void joinwt(struct arc g[][10],int node1, int node2, int wt)
{
 g[node1][node2].wt=wt;
}
cost(struct arc c[][10],int n)
{
 int i,j,wt;
 for(i=0;i<n;i++)
 for(j=0;j<n;j++)
 {
	printf("\t Enter weight of arc [%d][%d] : ",i,j);
	scanf("%d",&wt);
	joinwt(c,i,j,wt);
 }
 printf("\n");
 return (0);
}
mat(struct arc a[][10],int n)
{
 int i,j;
 printf("\n\t");
 for(i=0;i<n;i++)
 {
	for(j=0;j<n;j++)
		 printf("%d\t",a[i][j].wt);
	printf("\n\t");
 }
 return(0);
}
shortpath(struct arc wt[][10],int s,int t,int  preced[10],int n)
{
 int dist[10],prem[10],curr,i,j,k,dc,h=0,smalldist,newdist;
 for(i=0;i<n;i++)
 {
	prem[i]=nonmember;
	dist[i]=infinity;
 }
 prem[s]=member;
 dist[s]=0;
 curr=s;
 while(curr!=t)
 {
	smalldist=infinity;
	dc=dist[curr];
	for(i=0;i<n;i++);
	if(prem[i]==nonmember);
	{
	 newdist=dc+wt[curr][i].wt;
	 if(newdist<dist[i])
	 {
		dist[i]=newdist;
		preced[i]=curr;
	 }
	 if(dist[i]<smalldist)
	 {
		smalldist=dist[i];
		k=i;
	 }
	}
	curr=k;
	prem[curr]=member;
	path[h++]=curr;
 }
 printf("\n\n\t PATH IS = %d",s+1);
 for(i=0;i<h;i++)
 printf(" -> %d",(path[i]+1));
 return(dist[t]);
}
void main()
{
 struct arc c[10][10];
 int n,s,t,preced[10],x;
 clrscr();
 printf("\n\t ENTER HOW MANY NODES YOU WANT: ");
 scanf("%d",&n);
 printf("\n\t ENTER \"999\" IF NO EDGE EXISTS.\n");
 cost(c,n);
 printf("\t THE ADJACENCY MATRIX OF WEIGHT IS : ");
 mat(c,n);
 getch();
 printf("\n\t ENTER SOURCE AND DESTINATION : ");
 scanf("%d %d",&s,&t);
 printf("\n\t SHORTEST PATH FROM %d TO %d IS",s,t);
 x=shortpath(c,s-1,t-1,preced,n);
 printf("\n\t THE PATH LENGTH IS %d",x);
 getch();
}
/*OUTPUT

				 ENTER HOW MANY NODES YOU WANT: 3

				 ENTER "999" IF NO EDGE EXISTS.
				 Enter weight of arc [0][0] : 1
				 Enter weight of arc [0][1] : 2
				 Enter weight of arc [0][2] : 3
				 Enter weight of arc [1][0] : 4
				 Enter weight of arc [1][1] : 5
				 Enter weight of arc [1][2] : 6
				 Enter weight of arc [2][0] : 5
				 Enter weight of arc [2][1] : 4
				 Enter weight of arc [2][2] : 6

				 THE ADJACENCY MATRIX OF WEIGHT IS :
				1       2       3
				4       5       6
				5       4       6

				 ENTER SOURCE AND DESTINATION : 1
4

				 SHORTEST PATH FROM 1 TO 4 IS

				 PATH IS = 1 -> 4
				 THE PATH LENGTH IS 4
*/