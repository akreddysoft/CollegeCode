class emp
{
	private int year;
	private int month;
	private int day;
	
	emp(int year,int month,int day)
	{
		this.year=year;
		this.month=month;
		this.day=day;
	}
	
	
	
}

class man extends emp
{
	int bonus;
	
	man(int year,int month,int day,int bonus)
	{
		super(year,month,day);	//this is a mehtod to initialize private vars in subclassed
		this.bonus=bonus;
	}
	
	
	
}


abstract class Person
{
	public Person(String n)
	{
		name=n;
	}
	
	public abstract String getDescription();
//	public abstract String getDescription1(){}
	
	public String getName()
	{
		return name;
	}
	
	private String name;
}

class concept
{
	public static void main(String args[])
	{
	//	Person p=new Person("madhur");
	}
}