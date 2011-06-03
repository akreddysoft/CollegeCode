class str
{
	static void comp(String s3,String s4)
	{
		if(s3==s4)
		System.out.println("Equal");
		else
		System.out.println("Not equal");
		if(s3.equals(s4))
		System.out.println("Equal");
		else
		System.out.println("Not equal");
	
	}
}
class compare
{
	static void main(String args[])
	{
		String s1=new String("madhur"); //imp:if we use string s1="madhur" , we get eq
		String s2=new String("madhur");
		str str1=new str();
		str1.comp(s1,s2);
		String s3="madhur";
		String s4="madhur";
		str1.comp(s3,s4);
		String s5="madhur";
		String s6="fdjdsfj";
		str1.comp(s5,s6);
	}
}