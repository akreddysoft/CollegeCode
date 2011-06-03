import java.applet.*;
import java.awt.*;

/*
<applet code=simp width=200 height=200> </applet>
*/


public class simp extends Applet
{
	String msg;
	int i;
	
	public simp()
	{
		i=20;
	}
	
	public void paint(Graphics g)
	{
		g.drawString(msg,20,i);
	}
	
	public void init()
	{
		setBackground(Color.cyan);
		setForeground(Color.red);
		msg="Inside init() --";
		i=i+5;
	}
	
	public void start()
	{
		msg +="Inside start()--";
		i=i+5;
	}
	
	public void stop()
	{
		msg += "inside stop()--";
		i=i+5;
	}
	
	
	
	
	
}


