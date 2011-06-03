import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
class ButtonTest
{
	JFrame frame;
	JButton start,stop,pause;
	ButtonTest()
	{
		frame=new JFrame();
		frame.getContentPane().setLayout(new GridLayout(0,1));
		addwidgets();
		frame.pack();
		frame.setVisible(true);
	}
	
	private void addwidgets()
	{
		start=new JButton("Start");
		stop=new JButton("Stop");
		pause=new JButton("Pause");
		frame.getContentPane().add(start);
		frame.getContentPane().add(stop);
		frame.getContentPane().add(pause);
		pause.setEnabled(false);
		stop.setEnabled(false);
		
		start.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				stop.setEnabled(true);
				pause.setEnabled(true);
				Test a=new Test();
				try
				{
				
					a.join();
				}
				catch(Exception ee)
				{
					ee.printStackTrace();
				}
				stop.setEnabled(false);
				pause.setEnabled(false);

				
				
			}
		});
	
	}
}


class Test extends Thread
{
	Test()
	{
		start();

	}
	public static void main(String args[])
	{
		SwingUtilities.invokeLater(new Runnable()
		{
			public void run()
			{
				new ButtonTest();		
			}
		});
		
	}
	
	public void run()
	{
		try
		{
		
			Thread.sleep(1000);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}