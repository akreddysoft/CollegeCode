/*42. -true / false - inner class

1. inner class can be instantiated only in it's enclosing class
2. they can be accessed only within the enclosing class
3. they cannot implement interface
4. they can access final varaibles within their declaration scope
*/

class Madhur
{
	class Inner
	{
		Inner()
		{
			System.out.println("madhur");
		}
	}
	
}


class Test
{
	public static void main(String args[])
	{
			Madhur a=new Madhur();
		
			Madhur.Inner aa=new Madhur().new Inner();
			
			
	}
}