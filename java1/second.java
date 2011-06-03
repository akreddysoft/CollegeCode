class Hello
{
	
	public static void main(String args[])
	{		//these are neccessary
    		
    	madhur a=new madhur();
    	a.mad1();		//private function cannot be called here, public or protected can be called
    }
    
}

class madhur
{
    private int mad()	//if protected then compile error, function not found
    {
    	System.out.println("call from function and class");
    	return 1;
    }
    
    protected void mad1()
    {
    	mad();
    }
    
}

    