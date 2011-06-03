class test{
	
	public static void main(String args[]){
		new test1();
	}
}

class test1{
	
	test1()	{
		
			synchronized(this){
			
				threadtest tt=new threadtest(this);
				
				try{
				
					wait();
				}
				
				catch(Exception e){
					e.printStackTrace();
				}
		
			}
			
		for(int i=0;i<10;++i)
			System.out.println(i);
		
	}
}

class threadtest extends Thread{
	
	test1 classref;
	public void run(){
		
			synchronized(classref)	{	
			
				for(int i=0;i<10;++i)	{
					
					System.out.println("madhur "+i);
					
				}
				System.out.println("notified");
				classref.notifyAll();
			}
	}
	
	threadtest(test1 threadref){
		
		this.classref=threadref;
		start();
	}
}