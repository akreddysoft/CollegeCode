import javax.swing.*;
import java.awt.event.*;

class Dialog extends JDialog
{
	
	Dialog(JFrame owner,String title,boolean modal)
	{
		super(owner,title,modal);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setSize(200,200);
	}
}


class DialogTest
{
	public static void main(String args[])
	{
		Dialog mydialog=new Dialog(null,"madhur",true);
		mydialog.show();
		
		
	}
}