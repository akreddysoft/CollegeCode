class a
{
	public void	finalize()
	{
		System.out.println(" a ended");
	}
}

class b
{
	public void	finalize()
	{
		System.out.println(" b ended");
	}

	
	
}

class c
{
	
	public void	finalize()
	{
		System.out.println(" c ended");
	}

	
}


class test
{
	public static void main(String args[])
	{
		a aa=new a();
		b bb=new b();
		c cc=new c();
		aa=null;
		System.gc();
		bb=new b();
		System.gc();
	}
};