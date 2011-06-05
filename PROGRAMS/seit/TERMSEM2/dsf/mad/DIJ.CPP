#include<stdlib.h>
#include<conio.h>
#include<stdio.h>
int getshtpt(char*a,char*s,int*d,char*z,int n,int k,char sn,char en);
int min(int x,int y)
{
if(x<y)
return x;
else
return y;
}
void main()
{
char a[20],s[20],z[20],sn,en;
int d[20],sd;
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
printf("the nodes in the graph are \n");
for(i=0;i<k;i++)
printf("%c ",z[i]);
getch();

printf("\nenter the nodes from to find the shortest distance between them\n");
fflush(stdin);
sn=getche();
printf("       ");
en=getche();
sd=getshtpt(a,s,d,z,n,k,sn,en);
printf("\nthe shortest path is %d",sd);
getch();
}
int getshtpt(char*a,char*s,int*d,char*z,int n,int k,char sn,char en)
{
int fl1=0,fl2=0,i,j,ds,o;
char pm[20],tm[20][2],pt,pt1;
int per[20],temp[20];
for(i=0;i<k;i++)
{
temp[i]=30000;
tm[i][0]='n';
tm[i][1]=z[i];
if(sn==z[i])
{
fl1=1;
tm[i][0]='y';
}
if(en==z[i])
fl2=1;
}
if((!fl1)&&(!fl2))
{
printf("\none of the nodes is not present");
exit(1);
}
pt=sn;
pm[0]=sn;
per[0]=0;
int cn=1;
do
 {
  for(i=0;i<k;i++)
  {
   if(tm[i][0]=='n')
   {
   pt1=tm[i][1];
   for(j=0;j<n;j++)
   {
    if(a[j]==pt&&s[j]==pt1)
    {
    temp[i]=min(temp[i],per[cn-1]+d[j]);
    break;
    }
    if(a[j]==pt1&&s[j]==pt)
    {
    temp[i]=min(temp[i],per[cn-1]+d[j]);
    break;
    }
   }
   }
  }
  ds=30000;
  for(i=0;i<k;i++)
  if(tm[i][0]=='n')
  if(temp[i]<ds)
  {
   o=i;
   ds=temp[i];
  }
  pm[cn++]=tm[o][1];
  tm[o][0]='y';
  per[cn-1]=ds;
  if(en==pm[cn-1])
  return ds;
 }while(cn<k);
 return -1;
 }

