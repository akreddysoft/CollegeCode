import javax.swing.*;
import java.awt.*;

class AddRec extends JDialog
{
	JButton OK,cancel;
	
	AddRec(Dialog owner,String title,boolean modal)
	{
		super(owner,title,modal);
		System.out.println(owner)	;
		setSize(500,300);
	
		OK=new JButton("hello");
		getContentPane().add(OK);
			setVisible(true);
	}
	
}


class DialogTest
{
	public static void main(String args[])
	{
		JDialog MyFrame=new JDialog();
		MyFrame.setSize(500,500);
		MyFrame.setVisible(true);
		new AddRec(MyFrame,"Dialog",true);
	}
}