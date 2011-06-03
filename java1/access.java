class test
{
	int a;
	public int b;
	private int c;
	
	void setc(int i)
	{
		c=i;
	}    
	
	int getc()
	{
		return c;
	}
}


class actest
{
	public static void main(String args[])
	{
		test ob;
		ob=new test();
		ob.a=10;
		ob.b=20;
	//	ob.c=30;
		
		ob.setc(100);
		
	}
}
