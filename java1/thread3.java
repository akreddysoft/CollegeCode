//second way to create threadss
class th1 extends Thread
{
	int i;
	
	th1()
	{
		this.start();
	}
	public void run()
	{
		for(int i=0;i<5;++i)
		{
			System.out.println(i);
		}
	}
};


class th1test
{
	public static void main(String args[])
	{
		th1 thred=new th1();
	//	thred.start();
	}
};

