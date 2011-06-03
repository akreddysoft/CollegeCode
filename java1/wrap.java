class wrap
{
	public static void main(String args[])
	{
		int n;
		try
		{
			n=Integer.parseInt(args[0],10);
		
		}
		catch(Exception ArrayIndexOutOfBoundsException)
		{
			System.out.print("pass the argument");
			System.exit(0);
		}
		System.out.println(n*2);
	}
}

	