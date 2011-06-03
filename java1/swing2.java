import javax.swing.*;
import java.awt.event.*;

class myframe extends JFrame
{
	myframe(String str)
	{
		super(str);
		JButton but=new JButton("madhur");
		but.setSize(50,50);
		getContentPane().add(but);
		addWindowListener(new myadapter(this));
		setSize(400,400);
		setVisible(true);
	}
	
}

class swing2
{
	public static void main(String args[])
	{
		myframe mad=new myframe("hello world");
	}
}


class myadapter extends WindowAdapter
{
	JFrame th;
	myadapter(myframe fr)
	{
		this.th=fr;
	}
	
	public void windowClosed(WindowEvent e)
	{
		System.exit(0);
	}
	
}