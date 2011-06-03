package mypack;
class balance
{
	String Name;
	double bal;
	
	balance(String n, double b)
	{
		Name=n;
		bal=b;
	}
	
	void show()
	{
		if(bal<0)
			System.out.println("-->");
		System.out.println(Name+": $"+bal);
	}
};

class acc
{
	public static void main(String args[])
	{
		balance curr[]=new balance[3];
		curr[0]=new balance("madhur",23);
		curr[1]=new balance("ahuja",25);
		curr[2]=new balance("mohan",-34);
		
		for(int i=0;i<3;++i)
			curr[i].show();
	}
};