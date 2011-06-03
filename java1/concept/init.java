/*
> Quite often I have a hierarchy of classes where
> I want a specific accessor method to be
> present in all classes. Therefore I specify
> it in the base class. But the information
> that this function returns only depends on the
> actual class, so it should static, shouldn't it?
> 
> I ran into the neccessity to do so sometimes
> during design and started wondering why Java
> actually forbids it.
*/

class init
{
	
	static int i;
	static int a[]=new int[10];
	
	public static void main(String args[])
	{
	
		new test();
		test a=new test2();
		a.madhur();	
	}
	
}

class init1 extends init
{
	public static void main(String args[])
	{
		System.out.println("madhur")	;
	}
	
	
}
class test
{
	int i;
	int a[]=new int[10];
	
	test()
	{
		int j=2;
		int k;			//no meaning of static here
	
	
	}
	static void madhur()
	{
		System.out.println("in test1");
	}
	
}

class test2 extends test
{
	static void madhur()
	{
		System.out.println("in test2");
	}
}