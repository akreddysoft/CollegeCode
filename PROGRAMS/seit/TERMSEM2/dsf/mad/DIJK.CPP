#include<iostream.h>
#include<conio.h>
#include<stdio.h>
#include<stdlib.h>

void stpt(int w[][5],int s,int t,int *pd,int prcd[])
{
int dis[5],pem[5],cr,i,k,d,sd,nd;
for(i=0;i<5,i++)
{
pem[i]=0;
dis[i]=30000;
}
pem[s]=1;
dis[s]=0;
cr=s;
while(cr!=t){
sd=30000;
d=dis[cr];
