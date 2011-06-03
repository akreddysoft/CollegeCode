class th
{
	public static void main(String args[])
	{
		Thread t=Thread.currentThread();
		System.out.println("current +" + t);
		
		t.setName("madhur");
		System.out.println("after change "+ t);
		
		try
		{
			for(int n=5;n>0;n--)
				System.out.println(n);
			Thread.sleep(1000);
		}
			
			catch(InterruptedException e)
			{
				System.out.println("main thread interupted");
			}
	}
};