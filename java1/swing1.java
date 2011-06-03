import javax.swing.*;
import java.awt.event.*;

class swing1
{
	public static void main(String args[])
	{
		JFrame mad=new JFrame("hello world");
		
		mad.addWindowListener(new myadapter(mad));
		mad.setSize(400,400);
		//mad.pack();
		mad.setVisible(true);
		
	}
}


class myadapter extends WindowAdapter
{
	JFrame th;
	myadapter(JFrame fr)
	{
		this.th=fr;
	}
	
	public void windowClosed(WindowEvent e)
	{
		System.exit(0);
	}
	
}