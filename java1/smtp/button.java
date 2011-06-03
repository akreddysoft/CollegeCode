import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
class ButtonTest implements SomeJobListener
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
	
	public void jobDone()
	{
			stop.setEnabled(false);
			pause.setEnabled(false);	
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
				Thread a=new Thread(new Test(ButtonTest.this));
				a.start();
			}
		});
	
	}
}

interface SomeJobListener {
    public void jobDone(); // Called when SomeJob is finished.
}

class Test implements Runnable
{
	private final SomeJobListener callback;
	Test(SomeJobListener callback)
	{
		 this.callback = callback;
		 Thread a=Thread.currentThread();
	}

	public static void main(String args[])
	{
		new ButtonTest();
	}
	
	public void run()
	{
		try
		{
			Thread.sleep(1000);
			callback.jobDone();	//must call through SwingUtilities.invokelater
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}