import javax.swing.*;
import java.awt.event.*;
import java.awt.*;

class Actions
{
	
	public static void main(String args[])
	{
		MyFrame mf=new MyFrame();
		mf.show();
		
	}
}


class MyFrame extends JFrame
{
	JPanel first=new JPanel();
	JPanel second=new JPanel();
	JButton name=new JButton("name");
	JButton marks=new JButton("marks");
	
	MyAction ac=new MyAction("madhur",new ImageIcon("df.gif"),Color.BLUE);
	
	MyFrame()
	{
		first.add(name);
		second.add(marks);
		getContentPane().setLayout(new FlowLayout());
		getContentPane().add(first);
		getContentPane().add(second);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		pack();
	}
}

class MyAction extends AbstractAction
{
	public MyAction(String name,Icon icon,Color c)
	{
		putValue(Action.NAME,name);
		putValue(Action.SMALL_ICON,icon);
		putValue("color",c);
	}
	
	public void actionPerformed(ActionEvent event)
	{
		Color c=(Color)getValue("color");
		setBackground(c);
		repaint();
	}
}