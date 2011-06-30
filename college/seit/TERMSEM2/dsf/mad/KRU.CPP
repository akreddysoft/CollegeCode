#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
void main()
{
char a[20],s[20],z[20],sn,en;
int d[20],f[20],f2[20],sd;
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
f2[i]=0;
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

for(i=1;i<n;i++)
for(j=0;j<n-i;j++)
if(d[j]>d[j+1])
{
 y1=d[j];
 d[j]=d[j+1];
 d[j+1]=y1;
 sn=a[j];
 a[j]=a[j+1];
 a[j+1]=sn;
 sn=s[j];
 s[j]=s[j+1];
 s[j+1]=sn;
}

printf("the nodes in the graph are \n");
for(i=0;i<k;i++)
{
printf("%c ",z[i]);
f[i]=0;
}
getch();
printf("\nthe graph entered is \n");
for(i=0;i<n;i++)
//if(f2[i])
printf("%c\t%c\t%d\n",a[i],s[i],d[i]);
getch();

for(i=0;i<n;i++)
{
 int fl1=0,fl2=0;
 for(j=0;j<k;j++)
 {
 if(!f[j])
 {
 if(a[i]==z[j])
 fl1=1;
 if(s[i]==z[j])
 fl2=1;
 }
 }
 if((!fl1)&&(!fl2))
 break;
 else
 {
 f2[i]=1;
 for(j=0;j<k;j++)
 {
  if(a[i]==z[j])
  f[j]=1;
  if(s[i]==z[j])
  f[j]=1;
 }
 }
}
printf("\nthe minimal spanning tree is \n");
for(i=0;i<n;i++)
if(f2[i])
printf("%c\t%c\t%d\n",a[i],s[i],d[i]);
getch();
}