import javax.swing.*;
class forname
{

	public static void main(String args[])
	{
	
try
{

	Class cls=Class.forName("madhur.display");
//	JFrame df=new JFrame();


		madhur.display df=(madhur.display)cls.newInstance();
	}
	catch(Exception e){
		e.printStackTrace()		;
	}
	
	}
		
	//System.out.println()
	
}
