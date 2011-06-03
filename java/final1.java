class f
{
	public void finalize()
	{
		System.out.println("hi");
	}
}

class final1
{
	static void main(String args[])
	{
		f f1=new f();
		new f();
		System.gc();
	}
}