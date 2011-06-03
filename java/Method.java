class Method
{
	static void main(String args[])
	{
		String a=new String("madhur"); //we can also use sting a="madhur"
		System.out.println(storage(a));
	}	
        static  int storage(String s) 
	{
  		return s.length() * 2;
	}
}



