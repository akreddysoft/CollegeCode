import javax.swing.*;
import java.awt.event.*;
class GUIThread 
{
	
	JFrame myframe;
	JButton mybutton=new JButton("dffd");
	GUIThread()
	{
		myframe=new JFrame();
		myframe.getContentPane().add(new JLabel("dfd"));
		myframe.getContentPane().add(mybutton);
		myframe.pack();
		myframe.setVisible(true);
		mybutton.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
					System.out.println("bb"+Thread.currentThread());
			}
		});
	
		
	}
	
	public static void main(String args[])
	{
		
		new GUIThread();
		System.out.println(Thread.currentThread());
	
		SwingUtilities.invokeLater(new Runnable()
		{
			public void run()
			{
				System.out.println(Thread.currentThread());
			}
		});
	}
	
	
}