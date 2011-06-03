/* Here the variable 'b' will go upto 127. 
       After that overflow will occur, so 'b' will be set to -ve value, the loop ends and prints "Welcome to Java" */
       
       
class range
{
	public static void main(String args[])
	{
		range.infiniteLoop();
	}

        
        static void infiniteLoop()
        {
            byte b = 1;
            
            while ( ++b > 0 )
                ;
            System.out.println("Welcome to Java");
        }
}
    