class Method1
{
	static void main(String args[])
	{
		String a=new String("madhur"); //we can also use sting a="madhur"
		func b=new func(); // if we do func b only, we get uninitialised error
		System.out.println(b.storage(a));
	}	
}

class func
{

        int storage(String s) 
	{
  		return s.length() * 2;
	}
}



