public class inner
{
	
	public static void main(String args[])
	{
		statictest a=new statictest();
		statictest.acstatic();
		
		
	}
}



class statictest
{
	
	private int a;
	static void acstatic()
	{
		
		a=0;//  non-static variable a cannot be referenced from a static context
		
		//this error is prefectly valid, since this function can be called 
		//as statictest.acstatic(), we cannot specify, whose object's a we want 
		//to increment
	
		
	}
}