class argument
{
	public static void main(String args[])
	{
		test(new String[]{"a","b","c"});
		String []a= {"a","b","c"};
//		a={"d","E","f"};
		String []b={"d","E","f"};	
		a=new String []{"f","g","h"};
		
		
		
		
		
	}
	
	static void test(String [] a)
	{
		for(int i=0;i<a.length;++i)
		{
			System.out.println(a[i]);
		}
	}
	
	
}