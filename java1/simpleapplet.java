import java.applet.*;
import java.awt.*;

/*
<applet code=simpleapplet width=200 height=200> </applet>
*/


public class simpleapplet extends Applet
{
	public void paint(Graphics g)
	{
		g.drawString("A simple applet",20,20);
	}
}