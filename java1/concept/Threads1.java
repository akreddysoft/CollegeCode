/*class Threads1
{
	
	public static void main(String args[])
	{
		final Thread ff=Thread.currentThread();
		Thread a=new Thread(new Runnable()
		{
			public void run()
			{
				for(int i=0;i<10;++i)
					System.out.println(i);
			}
		});
		a.start();
		System.out.println("main exited");
	
	}
	
	
}*/

class parent
{
}

class derived1 extends parent
{
}

class test
{

public static void main(String args[])
{

derived1 d1= new derived1();
parent p = new parent();
d1=(derived1)p;
}

}

