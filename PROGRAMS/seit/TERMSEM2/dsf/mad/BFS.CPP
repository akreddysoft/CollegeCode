#include<stdio.h>
#include<conio.h>
#include<alloc.h>
#include<stdlib.h>
#include<iostream.h>
struct node
{
	char c;
	node*rt;
};
struct node1
{
	char c;
	node*rt;
	node1*dn;
}*st;
void getnode(int n)
{
		st=NULL;
		node1*temp,*tr;
		cout<<"enter the nodes";
		for(int i=0;i<n;i++)
		{
			temp=new node1;
			cin>>temp->c;
			temp->dn=NULL;
			temp->rt=NULL;
			if(st==NULL)
				st=temp;
			else
			{
				tr=st;
				while(tr->dn!=NULL)
					tr=tr->dn;
				tr->dn=temp;
			}
		}
}

void getgraph()
{
	node1*p;
	node*pt;
	p=st;
	while(p!=NULL)
	{
		cout<<"how many nodes are linked with "<<p->c<<" ";
		int n;
		cin>>n;
		cout<<"enter the nodes\n";
		for(int i=0;i<n;i++)
		{
			pt=new node;
			cin>>pt->c;
			pt->rt=NULL;
			if(p->rt==NULL)
				p->rt=pt;
			else
			{
				pt->rt=p->rt;
				p->rt=pt;
			}
		}
		p=p->dn;
	}
}

void showgraph()
{
	cout<<"\nthe graph entered is as follows\n";
	cout<<"node\t\t:\t\tlinked nodes";
	node1*p;
	node*pt;
	p=st;
	while(p!=NULL)
	{
		cout<<"\n   "<<p->c<<"\t\t:";
		pt=p->rt;
		while(pt!=NULL)
		{
			cout<<pt->c<<"\t";
			pt=pt->rt;
		}
		p=p->dn;
	}
}


void bfs(int n)
{
	char a[20],b[50],pc;
	int sp=0,f=-1,r=-1,se;
	node1*p=st;
	node*pt;
	pc=p->c;
	while(sp<n)
	{
		se=1;
		a[sp++]=p->c;
		pt=p->rt;
		while(pt!=NULL)
		{
			r=(r+1)%50;
			b[r]=pt->c;
			if(f==-1) f=0;
				pt=pt->rt;
		}
		int flag;
		do
		{
			flag=0;
			if(f==((r+1)%50))
			{
				se=0;
				break;
			}
	
			pc=b[f];
			f=(f+1)%50;
			for(int j=0;j<sp;j++)
				if(a[j]==pc)
					flag=1;
		}while(flag);
	
		if(!se)
			break;
		else
		{
			p=st;
		while(p->c!=pc)
			p=p->dn;
	}
	}
	for(int i=0;i<sp;i++)
	cout<<a[i];

}




void main()
{
clrscr();
cout<<"enter the number of nodes in the graph";
int n;
cin>>n;
getnode(n);
getgraph();
showgraph();
getch();
cout<<"the result of the bfs is as in the new line\n";
bfs(n);
getch();
}