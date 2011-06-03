import javax.swing.*;
import java.net.*;
import java.awt.*;
import java.awt.event.*;


class Net
{
	public static void main(String args[])
	{
		MainDialog md=new MainDialog();
	}
	
}


class MainDialog extends JDialog
{
	
	private GridBagLayout gbl;
	private GridBagConstraints gbc;
	JButton connect;
	JTextField hostname;
	JList users;
	JScrollPane userpane;
	
	MainDialog()
	{
		addwidgets();
		pack();
		setVisible(true);
	}
	
	private addwidgets()
	{
		users=new JList();
		
		
		
	}
	
	
	
}