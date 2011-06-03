import javax.swing.*;
import java.awt.*;

class MyFrame extends JFrame
{
	
	public MyFrame()
	{
		
	}

	public MyFrame(int h,int w)
	{
		setSize(w,h);
		this.setSize(100,100);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		Toolkit kit= Toolkit.getDefaultToolkit();
		Dimension size=kit.getScreenSize();
		int height=size.height;
		int width=size.width;
		
		setSize(width/2,height/2);
		setLocation(width/4,height/4);
		
		setTitle("madhur frame");
		
		
	}
}

class CenterFrame
{
	public static void main(String args[])
	{
		MyFrame mf=new MyFrame(100,100);
	//	mf.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		mf.show();
		
	}
}
