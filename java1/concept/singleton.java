 class SimpleSingleton
 {
    private static final SimpleSingleton instance = new SimpleSingleton();


	int a;

	void dowork()
	{
		System.out.println(instance);
	}
	
	   private SimpleSingleton(){
	   }
	
	
	public static SimpleSingleton getInstance()
	{
				return instance;
	}

 }


class test
{
	
	public static void main(String args[])
	{
	//	SimpleSingleton df=new SimpleSingleton()		;		//will not compile
	//	SimpleSingleton df1=new SimpleSingleton()		;		//will not compile
		System.out.println(SimpleSingleton.getInstance());
		System.out.println(SimpleSingleton.getInstance());	
		System.out.println(System.getProperty("user.home"));
	}
}