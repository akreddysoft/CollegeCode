class dump
{
	public static void main(String args[])
	{
	
	double f=1.3;
//	boolean b=null;
	StringBuffer sb1 = new StringBuffer("Amit"); 
   StringBuffer sb2= new StringBuffer("Amit"); 
   String ss1 = "Amit"; 
   /*System.out.println(sb1==sb2); 
   System.out.println(sb1.equals(sb2)); 
   System.out.println(sb1.equals(ss1)); 
   System.out.println("Poddar".substring(3)); */
   
   
    String s1 = "Amit"; 
    String s2 = "Amit"; 
    String s3 = new String("abcd"); 
    String s4 = new String("abcd"); 

    System.out.println(s1.equals(s2)); 
    System.out.println((s1==s2)); 
    System.out.println(s3.equals(s4)); 
    System.out.println((s3==s4)); 

    
	}
	
}