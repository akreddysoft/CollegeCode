#include<iostream.h>
#include<conio.h>
#include<iomanip.h>
#include<stdio.h>
class matrix
{
	 float *mat[9][9];
	 int k,l;
 public:
	 friend istream& operator>>(istream &a,matrix &ma);
	 friend ostream& operator<<(ostream &a,matrix &ma);
	 matrix operator*(matrix);
	 void inverse(matrix);
	 void transpose(matrix);
	 void check();
};
istream& operator>>(istream &a,matrix &ma)
{
 int i,j;
 cout<<"\nEnter the rows and column of matrix:";
 cin>>ma.k>>ma.l;
 cout<<"\nEnter the matrix:";
 for(i=0;i<ma.k;++i)
 {
	for(j=0;j<ma.l;++j)
	{
	 ma.mat[i][j]=new float;
	 a>>*ma.mat[i][j];
	}
 }
}
ostream& operator<<(ostream &b,matrix &ma)
{
 int i,j;
 for(i=0;i<ma.k;++i)
 {
	for(j=0;j<ma.l;++j)
	 b<<*ma.mat[i][j]<<setprecision(2)<<"   ";
	cout<<endl;
 }
}
matrix matrix::operator *(matrix m1)
{
 matrix temp;
 int i,j,jj;
 for(i=0;i<k;++i)
	for(j=0;j<l;++j)
	{
	 temp.mat[i][j]=new float;
	 *temp.mat[i][j]=0;
	 for(jj=0;jj<m1.l;++jj)
		*temp.mat[i][j]=*temp.mat[i][j]+*mat[i][jj]**m1.mat[jj][j];
	}
 temp.k=k;
 temp.l=m1.l;
 return temp;
}

void matrix::transpose(matrix m1)
{
 int i,j;
 for(i=0;i<m1.k;++i)
 {
	for(j=0;j<m1.l;++j)
	{
	 mat[i][j]=new float;
	 *mat[i][j]=*m1.mat[j][i];
	}
 }
 k=m1.k;
 l=m1.l;
}
void matrix::inverse(matrix m1)
{
 int i,j,p,b,c,q,d=0;
 for(i=0;i<3;i++)
	for(j=0;j<3;j++)
	{
	 if(i==0)    { 		b=1;		c=2;	 }
	 if(i==1)	 {		b=0;		c=2;	 }
	 if(i==2)	 {		b=0;		c=1;	 }
	 if(j==0)	 {		p=1;		q=2;	 }
	 if(j==1)	 {		p=0;		q=2;	 }
	 if(j==2)	 {		p=0;		q=1;	 }
	 mat[i][j]=new float;
	 *mat[j][i]=*m1.mat[b][p]*(*m1.mat[c][q])-*m1.mat[b][q]*(*m1.mat[c][p]);
	 if(i==0)
		d=d+*m1.mat[b][p]*(*m1.mat[c][q])-*m1.mat[b][q]*(*m1.mat[c][p]);
	}
 for(i=0;i<3;i++)
	for(j=0;j<3;j++)
	 *mat[i][j]=*mat[i][j]/d;
 k=3;
 l=3;
}
void matrix::check()
{
 int flag1=1,flag2=1,flag3=1,i,j;
 int r1=0,r2=0,r3=0,c1=0,c2=0,c3=0,diag=0;
 for(i=0;i<k&&flag1==1;++i)
 {
	for(j=0;j<l&&flag1==1;++j)
	{
	 if(*mat[i][j]==*mat[j][i])
		flag1=1;
	 else
		flag1=0;
	}
 }
 for(i=0;i<k&&flag2==1;++i)
 {
	for( j=0;j<l&&flag2==1;++j)
	{
	 if(*mat[i][j]==-*mat[j][i])
	 flag2=1;
	 else
		flag2=0;
	}
 }
 for(i=0;i<k;++i)
 {
	r1=r1+*(mat[i][0]);
	r2=r2+*(mat[i][1]);
	r3=r3+*(mat[i][2]);
 }
 for(i=0;i<l;++i)
 {
	c1=c1+*(mat[0][i]);
	c2=c2+*(mat[1][i]);
	c3=c3+*(mat[2][i]);
 }
 for(i=0;i<k;++i)
	 diag=diag+*mat[i][i];
 if(r1==r2)
 {
	if(r2==r3)
	if(r3==c1)
	if(c1==c2)
	if(c2==c3)
	if(c3==diag)
	 flag3=1;
 }
 else
	 flag3=0;

 if(flag1)
 cout<<"\nfirst Matrix is symmetric";
 else
 cout<<"\nfirst Matrix is not symmetric";
 if(flag2)
 cout<<"\nFirst matrix is skew symmetric\n";
 else
 cout<<"\nfirst matrix is not a skew symmetric\n";
 if(flag3)
 cout<<"first matrix is magic square";
 else
 cout<<"first matrix is not a magic square";
}

void main()
{
	clrscr();
	matrix m1,m2,m3,m4,m5;
	cin>>m1;
	m1.check();
	cin>>m2;
	m3=m1*m2;
	m4.transpose(m1);
	m5.inverse(m1);
	cout<<"\nThe multiplication is:\n";
	cout<<m3;
	cout<<"\nThe transpose is:\n";
	cout<<m4;
	cout<<"\nThe inverse is:\n";
	cout<<m5;
	getch();
}