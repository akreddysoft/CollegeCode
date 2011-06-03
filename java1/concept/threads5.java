class madhur
{
	public static void main(String args[])
	{
		new Thread(new test1()).start();
		new Thread(new test1()).start();
	
	}
}


class test1 implements Runnable
{
	static int counter;
	
	test1(){
		
	}
	
	public void run()
	{
		for(int i=0;i<10;++i)
		{
			System.out.println(Thread.currentThread()+" "+counter);
			synchronized(this)
			{
			
				counter++;
			}
		}
		
	
	}
}
