class num
{
	
	public static void main(String args[])
	{
	

    Double a = new Double(Double.NaN);
    Double b = new Double(Double.NaN);
	            
    if( Double.NaN == Double.NaN )
	System.out.println("True");
    else
	System.out.println("False");
			
    if( a.equals(b) )
	System.out.println("True");
   else
	System.out.println("False");
	
	System.out.println(Double.NaN);
	}
}

