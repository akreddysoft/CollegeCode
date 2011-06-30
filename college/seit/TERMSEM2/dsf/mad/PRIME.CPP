#include<conio.h>
#include<stdio.h>
void main()
{
char a[20],s[20],z[20];
int d[20];
int n,y1,i,k,j;
clrscr();
printf("enter the no. of edges ");
scanf("%d",&n);
printf("enter the edges in the following format\n");
printf("\tstarting node\t\tend node\t\tweight\n");
for(i=0;i<n;i++)
{
y1=wherey();
gotoxy(12,y1);
a[i]=getche();
gotoxy(38,y1);
s[i]=getche();
gotoxy(58,y1);
scanf("%d",&d[i]);
}
k=0;
for(i=0;i<n;i++)
{
 for(j=0;j<k;j++)
 if(a[i]==z[j])
 break;
 if(j==k)
 z[k++]=a[i];
 for(j=0;j<k;j++)
 if(s[i]==z[j])
 break;
 if(j==k)
 z[k++]=s[i];
}
//printf("the nodes in the graph are \n");
//for(i=0;i<k;i++)
//printf("%c ",z[i]);
char y[20],f[20],g[20],h[20],c;
int pos,m;
y[0]=a[0];
j=0;
for(i=0;i<k-1;i++)
{
 c=y[j];
 int ds=-1,flag=1,cn=1;
 while(flag)
 {
 for(int l=0;l<n;l++)
 {
  if(c==a[l])
  {
   for(m=0;m<=j;m++)
   if(s[l]==y[m])
   break;
   if(m>j)
   if(ds==-1)
   {
   ds=d[l];
   pos=l;
   flag=0;
   }
   else
   if(ds>d[l])
   {
   ds=d[l];
   pos=l;
   flag=0;
   }
  }
   if(c==s[l])
  {
   for(m=0;m<=j;m++)
   if(a[l]==y[m])
   break;
   if(m>j)
   if(ds==-1)
   {
   ds=d[l];
   pos=l;
   }
   else
   if(ds>d[l])
   {
   ds=d[l];
   pos=l;
   }
  }
 }
 if(flag)
 c=y[j-cn++];
 }
 //if(c==a[pos])
 f[j]=a[pos];
 g[j]=s[pos];
 h[j]=d[pos];

 if(c==a[pos])
 y[++j]=s[pos];
 else
 y[++j]=a[pos];
}
printf("the minimal spanning tree is \n");
printf("\t\tstarting node\t\tending node\t\tweight\n");
for(i=0;i<k-1;i++)
printf("\t\t%c\t\t\t%c\t\t\t%d\n",f[i],g[i],h[i]);
getch();
}