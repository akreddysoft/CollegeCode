import java.awt.event.*;
import javax.swing.*;
import java.io.*;

class Filetest 
{
	
	private static showgui()
	{
		
		JFrame mframe=new mframe();
		mframe.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		addwidgets();
		
		mframe.pack();
		mframe.setVisible(true);
	}
	
	void addwidgets()
	{
		
	}
	
	
	
	public static void main(String args[])
	{
		SwingUtilities.invokeLater(new Runnable{
			public void run()
			{
			
				showgui();
			}
		})
		
	}
}