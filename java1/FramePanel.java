import javax.swing.*;
import java.awt.*;

class MyFrame extends JFrame
{
	
	MyFrame()
	{
		setSize(300,300);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		MyPanel mp=new MyPanel();
		this.getContentPane().add(mp);
	}
}


class FramePanel
{
	
	public static void main(String args[])
	{
		MyFrame mf=new MyFrame();
		mf.show();
		
		String font[]=GraphicsEnvironment.getLocalGraphicsEnvironment().getAvailableFontFamilyNames();
		for(int i=0;i<font.length;++i)
			System.out.println(font[i]);
	}
}


class MyPanel extends JPanel
{
	
	public void paintComponent(Graphics g)
	{
		super.paintComponent(g);
		//this line must be there
		
		g.drawString("not a hello world",75,100);
	}
	public MyPanel()
	{
		this.add(new JLabel("heello world"));
	}
}