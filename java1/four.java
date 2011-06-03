//this demonstrates recursive calling of functio
class Hello
{
	
	public static void main(String args[])
	{		//these are neccessary
    		
    	madhur a=new madhur();
    	a.mad1('a');		//private function cannot be called here, public or protected can be called
    	madhur b=new madhur();
    	b.mad1('c');
    }
}

class madhur
{
  	Hello dd=new Hello();
    private int mad(char a)	//if protected then compile error, function not found
    {
    	System.out.println("character:"+a);
    	return 1;
    }
    
    protected void mad1(char ac)
    {
    	String args[]={"dfdfs"};
    	dd.main(args);
    	mad(ac);
    }
    
}

    