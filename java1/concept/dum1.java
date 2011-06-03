//a very conceptual example

    class Test
    {
		static void show()
		{
			System.out.println("Show method in Test class");
		}
	}
	

    class Q2 extends Test
   {

		 static void show()
		{
			System.out.println("Show method in Q2 class");
		}
	
		static void madhur(){
		}
	
		public static void main(String[] args)
		{
			Test t = new Test();
		t.show();
			Q2 q = new Q2();
			q.show();
			
			t = q; 
			t.show();
			
	
			q = (Q2)t; 
			q.show();
		}
 }
