import javax.swing.*;

class MyFrame extends JFrame
{
	
	public MyFrame()
	{
		this.setSize(100,100);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
	}

	public MyFrame(int h,int w)
	{
		setSize(w,h);
		
	}
}

class SimpleSwing
{
	public static void main(String args[])
	{
		MyFrame mf=new MyFrame(100,100);
	//	mf.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		mf.show();
		
	}
}
