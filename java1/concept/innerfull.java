class test
{
	
	class inner1
	{
		
		inner1()
		{
			System.out.println("inner");
			
		}
	}
	
	
	/*class inner2
	{
		
		static void some()	//inner classes cannot have static declarations
		{
			System.out.println("some");
		}
	}*/
	
	static class inner2
	{
		
		void some()	
		{
			System.out.println("some");
		}
	}
	
}



class innerfull
{
	
	
	public static void main(String args[])
	{
		
		new test().new inner1();
		test.new inner2();
		
	}
}