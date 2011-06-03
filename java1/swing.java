import javax.swing.*;
import java.awt.event.*;

class swing
{
	public static void main(String args[])
	{
		JFrame mad=new JFrame("hello swing");
		mad.setVisible(true);
		mad.setSize(100,100);
	  
	    mad.addWindowListener(new WindowAdapter() 
	    {
        	public void windowClosing(WindowEvent e)
        	{
        		System.exit(0);
        	}
    	}
    );

	//	System.exit(0);
	}
}
	
