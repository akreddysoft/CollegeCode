
/*class voidmain
{
	
	public static void main(String args[])
	{
		System.out.println("hello madhur");
	}
}*/

//if public is missing: error
//main method not public


//writing a hello world program without main().
/*
 
class voidmain
{
	
	static
	{
		System.out.println("hello madhur");
		System.exit(0);
	}
}


*/


class main
{
	
	public static void main(String args[])
	{
		System.out.println("hello world");
		new main();
	}
	
	public main(String args[])
	{
		System.out.println("hello madhur");
		
	}
	public main()
	{
		System.out.println("hello another");
	}
}


