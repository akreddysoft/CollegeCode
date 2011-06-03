import javax.swing.*;
import java.awt.event.*;

public class NetChat
{
	
	public static void main(String args[])
	{
		MainDialog md=new MainDialog();
		md.show();
	
		
	}
}

class MainDialog extends JDialog
{
	
	MainDialog()
	{
		setSize(400,400);
		
	}
}