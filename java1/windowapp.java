import java.applet.*;
import java.awt.*;
import java.awt.event.*;
/*
<applet code=windowapp width=200 height=200> </applet>
*/


public class windowapp extends Applet implements WindowListener
{
	public void paint(Graphics g)
	{
		g.drawString("A simple applet",20,20);
	}
	
	public windowapp()
	{
		//addWindowListener(this);
	}
	
	public void init()
	{
		Frame madhur= new Frame("madhur");
		madhur.setVisible(true);
		
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