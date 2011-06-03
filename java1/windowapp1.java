import java.applet.*;
import java.awt.*;
import java.awt.event.*;
/*
<applet code=windowapp1 width=200 height=200> </applet>
*/


public class windowapp1 extends Applet 
{
	public windowapp1()
	{
		madhur mad=new madhur();
	}
	
	public void paint(Graphics g)
	{
		g.drawString("A simple applet",20,20);
	}
	
}

class madhur extends Frame implements WindowListener
{
	
	madhur()
	{
		setVisible(true);
	}
	
	public void windowClosing(WindowEvent  e)
	{
	}
	
	public void windowClosed(WindowEvent e)
	{
	}
	
	public void windowActivated(WindowEvent e)
	{
	}	
	
	public void windowDeactivated(WindowEvent e)
	{
	}
	
	public void windowDeiconified(WindowEvent e)
	{
	}
	
	public void windowIconified(WindowEvent e)
	{
	}
	
	public void windowOpened(WindowEvent  E)
	{
	}
	
	
		
}