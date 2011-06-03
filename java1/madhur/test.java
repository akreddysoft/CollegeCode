//concepts of packages, see pack1.java
package madhur;
class test	//if a class needs to be seen outside package, it must be made public
{
	int a;
	public int b;
	private int c;
	protected int d;
	test()
	{
		a=10;
		b=20;
		c=30;
		d=40;
	}
};





class actest
{
	public static void main(String args[])
	{
		test ob;
		ob=new test();
		System.out.println(ob.a+ob.b+ob.d);	//imp:ob.d can be accessed here, same package non subclass
		
		
	}
};

																																																																																																																						
