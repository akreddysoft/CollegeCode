class test
{

	public static void add()
 	{
  	
   		byte []mname=new byte[20];
    	String s="madhur";
    	for(int i=0;i<20;++i)
    	{
    		mname[i]=3;
    	}
    	mname=s.getBytes();
   
   		for(int i=s.length()-1;i<20;++i)
    	{
     
		    // try
		     {
		     
		     	mname[i]=0;
		     }
		  //   catch(Exception e)
		     {
		     	System.out.println("Exception at:" + i);
		     }
    	}
    }
    
    public static void main(String args[])
    {
    	add();
    }
}