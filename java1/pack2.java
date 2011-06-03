import madhur.test;

class test2 extends test
{
	public static void main(String args[])
	{
		test ob;
		ob=new test();
		System.out.println(ob.a+ob.b+ob.d);	
		
	}
};

/* errors:
test class shoud be public since it is being accessed from different package
test() is not public , cannot be accessed outside package
a,b,d cannot be accessed ,since outside package