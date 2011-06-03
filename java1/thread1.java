class nthread implements Runnable
{
	Thread t;
	
	nthread()
	{
		t=new Thread(this,"demo thread");
		System.out.println("child thread" + t);
		t.start();
	}
	
	public void run()
	{
		try
		{
			for(int i=5;i>0;i--)
			{
				System.out.println("child thread " +i);
				Thread.sleep(500);
			}
		}
			catch(InterruptedException e)
			{
				System.out.println("child interrupted");
			}
			System.out.println("existing child thread");
		
	}
};

class tdemo
{
	public static void main(String args[])
	{
		new nthread();
		try
		{
			for(int i=5;i>0;--i)
			{
				System.out.println("main thread :" + i);
				Thread.sleep(1000);
			}
		}
		catch(InterruptedException e)
		{
			System.out.println("main thread interrupted");
		}
		System.out.println("main thread exiting");
	}
};	