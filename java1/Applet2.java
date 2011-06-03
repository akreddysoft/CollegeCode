import java.applet.*;
import java.awt.*;

//<applet code=Applet2.class height=100 width=100></applet>
public class Applet2 extends Applet 
{
	
	public Applet2()
	{
	//	java.util.Enumeration en=this.getAppletContext().getApplets();
	
		Thread ff=new Thread( new Runnable()
		{
			
				public void run()
				{
					for(int i=0;i<10000;++i)
					{
						System.out.println(i);
			
						try
						{
			
							Thread.sleep(100);
						}
						catch(Exception e)
						{
							e.printStackTrace();
						}
					}
				}
			
			
		});
		ff.start();
	}
	
	public static void main(String args[])
	{
		new Applet2();
	}

	
	
	
}