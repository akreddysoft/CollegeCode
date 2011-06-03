class nth implements Runnable
{

	int count;
	Thread t;
	nth()
	{
		count=5;
		t=Thread.currentThread();
	}
	
	public void run()
	{
		try
		{
		
			for(int i=0;i<5;++i)
			{
				System.out.println(count);
				Thread.sleep(1000);	//this requires the try and catch block
				count--;
			
			}
			System.out.println("child thread exiting");
		}
		catch(InterruptedException e )
		{
			System.out.println("exception" + e);
		}
	}
	
};


class madhur
{
	public static void main(String args[])
	{
		nth ob= new nth();
		Thread t=new Thread(ob,"madhur");
		t.start();					//these statements can be put in the constructor
		
		
		System.out.println("main thread exiting");
		
	}
};


			
	
	