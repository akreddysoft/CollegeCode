    class Test
    {
    	static void show()
    	{
			System.out.println("non-static method in Test");
		}
    }
    
    class Q3 extends Test
    {

	   	 void show()
		{
			System.out.println("Overridden non-static method in Q3");
		}
            
       public static void main(String[] args)
       {
              Q3 a = new Q3();
         
       }
    }
