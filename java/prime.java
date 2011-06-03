class prime
{
	static void main(String args[])
	{
		int prime=0;
	 for(int i=2;i<100;++i)
	 {
		for(int j=2;j<i;++j)
		{
			if(i%j!=0)
				prime=1;
			else
			{
				prime=0;
			 	break;
			}
		}
		if(prime==1)
		System.out.println(i);
	}}
}