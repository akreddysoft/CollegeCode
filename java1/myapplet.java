import java.io.*;
import javax.swing.*;
import java.applet.*;
import java.awt.*;

//<applet code=myapplet width=200 height=200></applet>

public class myapplet extends JApplet
{
	String filename;
	ImageIcon aa;
	Image aaa;
	
	public void init()
	{
	
	
	 filename="e:\\programs\\java1\\gui.bmp";
	 aa=new ImageIcon(filename);
	 aaa=aa.getImage();
	 this.getContentPane().add(new butimage1("Dfdffd"));
	}
	
	public void paint(Graphics g)
	{
		
		g.drawString("madhur",10,10);
	//	boolean a=g.drawImage(aaa,0,0,200,200,null);
	//	System.out.println(a);
		
	}
	

}


class butimage1 extends JButton
{
		String filename;
	ImageIcon aa;
	Image aaa;
	Icon a;
	butimage1(String df)
	{
			
	 filename="e:\\programs\\java1\\gui.bmp";
	 aa=new ImageIcon(filename);
	 aaa=aa.getImage();

	this.setIcon(aa);		
		
	}


	
	
	
}