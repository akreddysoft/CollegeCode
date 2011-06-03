class ff
{
	public static void main(String args[])
	{
		
		System.out.println("ff");
	}
}

class ss extends ff
{
	
	public static void main(String args[])
	{
		System.out.println("ss");
	}
}


class mainclass
{
	public static void main(String args[])
	{
		ff ins=new ss();
		ins.main(new String[]{});
		
	}
}