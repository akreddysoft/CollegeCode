import java.awt.*;
import java.awt.event.*;

class wind extends Frame 
{
	
	wind()
	{
		setVisible(true);
		mywindadapter adapter= new mywindadapter(this);
		addWindowListener(adapter);
	}
	
}


class madhur
{
	public static void main(String args[])
	{
		wind win1=new wind();
		Button mad=new Button("madhur");
		win1.add(mad);
		//cannot put here system.exit, 
		
			}
}

class mywindadapter extends WindowAdapter
{
	wind newwind;
	public mywindadapter(wind th)
	{
		this.newwind=th;
		
	}
	
	public void windowClosing(WindowEvent we)
	{
		newwind.setVisible(false);
		System.exit(1);
	}
}

