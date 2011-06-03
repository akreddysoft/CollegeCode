import pkg.*;
/*
class person
{
	private String prv;
	protected String pd="madhur";
	public String mad="ahuja";
	String def="default";
	
}


class person1
{
	private String prv;
	protected String pd="madhur1";
	public String mad="ahuja1";
	String def="default1";
	
}

*/

class emp extends pkg.person
{
	pkg.person1 p1;
	public static void main(String args[])
	{
		emp a =new emp();
		
		a.showdata();
	}
	void showdata()
	{
		p1=new pkg.person1();
		System.out.println(pd+mad+def);		
		//def is not public in pkg.person1,cannot be accessed from outside package
		//pd can be accessed , because it is declared protected and it is subclass
		System.out.println(p1.pd+p1.mad+p1.def);
		//cannot access pd, because it has protected access in person1, only public
		// and default access(if if same package) can be accessed
		
		//def is not public in pkg.person1,cannot be accessed from outside package
		
	}
}