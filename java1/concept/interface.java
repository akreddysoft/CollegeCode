interface getmadhur
{
	 
}


class test implements  getmadhur
{
	
	

}


class mytest
{
	public static void main(String args[])
	{
		
		test a=new test();
		if(a instanceof getmadhur)
		{
			System.out.println("madhur");
			System.out.println(a.getClass());
			System.out.println(test.class);
		}
	}


}