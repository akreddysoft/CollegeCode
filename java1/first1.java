class HelloWorld
{
	
	public static void main(String args[])
	{		//these are neccessary
    	HelloWorld a =new HelloWorld();
    	a.madhur();
    	//madhur();		//if madhur is static, it can be called like this
    }
    
    private int madhur()
    {
    	System.out.println("call from function");
    	return 1;
    }
    
}

    