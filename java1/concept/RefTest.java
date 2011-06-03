
class RefTest
{
	static String madhur="madhur";
	public static void main(String args[])
	{
		doTest();
	}
	
	
	static void doTest()
	{
		
		another an=new another();
		an.mad="ahuja";
		an.id=5;
	
		Test.MakeNull(madhur,an);
		System.out.println(madhur);
		
		System.out.println(an)	;
		
		
	}
}


class Test
{
	public static void MakeNull(String st,another a)
	{
		System.out.println(st);
		st=null;
		System.out.println(st);
		
		a.id=4;
		
		
		
		
	}
	
	
}


class another
{
	
	String mad;
	int id;
	
	public String toString()
	{
		return mad + ""+id;
	}
	
}