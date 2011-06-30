void main()
{
	int i,j,k,n=10,z=0;
	int c1,c2,c3,c4;
	c1=c2=c3=c4=0;
	for(i=0;i<n;++i,++c1)
		for(j=i+1;j<n;++j,++c2)
			for(k=j+1;k<n;++k,++c3)
			{
				z=z+1;c4++;
			}
}