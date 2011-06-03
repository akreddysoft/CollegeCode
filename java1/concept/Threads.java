
class MyThread
{
	public static void main(String args[])
	{
		/*t1 a=new t1()	;
		
		t1 b=new t1();
		
		new t1();*/
		value v=new value();

		t2 a=new t2(v)	;
		
		t2 b=new t2(v);
		
		new t2(v);


}



}


class t1 extends Thread
{
	
	t1()
	{
		this.start();
		
	}
	
	
	public  void run()
	{
		synchronized(this)
		{
			
			for(int i=0;i<10;++i)
			{
				System.out.println(i);
			}
		}
	}
	
}


class t2 extends Thread
{
	
	private int i;
	value v;
	t2( value v)
	{
		this.v=v;
		this.start();
		
	}
	
	
	public  void run()
	{
		synchronized(v)
		{
			
			for(;v.getval()<100;v.incr())
			{
				try{
					
				
				if(v.getval()==50)
					wait();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
				System.out.println(v.getval()+ " " + Thread.currentThread());
			}
		}
	}
	
}


class value
{
	private int i;
	
	value()
	{
		i=0;
	}
	
	void incr(){
		i++;
	}
	
	int getval()
	{
		return i;
	}
}