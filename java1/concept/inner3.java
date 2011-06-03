/*42. -true / false - inner class

1. inner class can be instantiated only in it's enclosing class
2. they can be accessed only within the enclosing class
3. they cannot implement interface
4. they can access final varaibles within their declaration scope
*/

class Inner
{
	Inner()
	{
		System.out.println("dfdf");
	}
	class Madhur
	{
		Madhur()
		{
			System.out.println("madhur");
		}
	}
	static	class Madhur1
	{
		Madhur1()
		{
			System.out.println("madhur");
		}
	}
	
	
}


class Test
{
	public static void main(String args[])
	{
			try
			{
			
				Inner a=(Inner)Class.forName("Inner").newInstance();
				Class.forName("Inner.Madhur1").newInstance();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
	}
}