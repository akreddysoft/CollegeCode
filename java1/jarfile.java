import java.util.jar.*;
import java.util.*;



class jarfile
{
	
	public static void main(String args[])
	{
	JarFile df=null;
try
{

	 df=new JarFile("d:\\beans\\jars\\df.jar")		;
Enumeration en=	df.entries();
while(en.hasMoreElements())
{
	System.out.println(en.nextElement());
}

	
		
		
	}	catch(Exception e)
		{
			e.printStackTrace();
		}
	
		
	}
}