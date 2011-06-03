import java.applet.*;
import java.awt.*;
import java.awt.event.*;
/*
<applet code=event width=200 height=200> </applet>
*/


//this class is both the source and listener of its events
//listeners are created by implementing one or more interfaces
public class event extends Applet implements MouseListener,MouseMotionListener,KeyListener
{
	int x,y;
	int a,b;
	int stat,stat1;
	int k;
	char ch;
	String msg;
	
	public event()
	{
		addMouseListener(this);			//register a listener
		addMouseMotionListener(this);
		addKeyListener(this);
		setBackground(Color.orange);
		
	}
	
	public void paint(Graphics g)
	{
		g.drawString(x+ " "+y,20,20);
		g.drawString("mouse pressed", a,b);
		g.drawString(stat+ " "+ stat1,30,30);
		showStatus(x+ " "+y);
		showStatus("key pressed : " + ch + " key code " + k + " "+msg);
	}
	
	public void mouseClicked(MouseEvent e)
	{
		x=e.getX();
		y=e.getY();
		a=x;
		b=y;
		stat=e.MOUSE_CLICKED;
		stat1=e.MOUSE_MOVED;
		
		repaint();
	}
	
	public void mousePressed(MouseEvent e)
	{
	}
	
	public void mouseReleased(MouseEvent e)
	{
	}
	
	public void mouseEntered(MouseEvent e)
	{
	}
	
	public void mouseExited(MouseEvent e)
	{
	}
	
	public void mouseDragged(MouseEvent e)
	{
	}
	public void mouseMoved(MouseEvent e)
	{
		x=e.getX();
		y=e.getY();
		repaint();
	}
	
	public void keyPressed(KeyEvent e)
	{
		
	}
	
	public void keyReleased(KeyEvent e)
	{
		
	}
	
	public void keyTyped(KeyEvent e)
	{
		ch=e.getKeyChar();
		k=e.getKeyCode();
		msg=e.getKeyText(k);
		repaint();
	
	}	
		
		
	
}