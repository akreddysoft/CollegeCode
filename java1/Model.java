import javax.swing.*;
import java.awt.*;
import java.awt.event.*;


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
	//	JFrame.setDefaultLookAndFeelDecorated(true);
		MyFrame mf=new MyFrame();
		mf.show();
		
		String font[]=GraphicsEnvironment.getLocalGraphicsEnvironment().getAvailableFontFamilyNames();
		for(int i=0;i<font.length;++i)
			System.out.println(font[i]);
			
		try{
			UIManager.setLookAndFeel(UIManager.getCrossPlatformLookAndFeelClassName());
		}
		catch(Exception e){}
		SwingUtilities.updateComponentTreeUI(mf)	;
		System.out.println(UIManager.getSystemLookAndFeelClassName());
	}
}


class MyPanel extends JPanel
{
	JButton first=new JButton("first");
	JButton second;
	JButton third=new JButton("third");
	DefaultButtonModel model=first.getModel();
	//System.out.println(model.getActionCommand());
	System.out.println(model.getActionCommand());
	DefaultButtonModel model1=second.getModel();
	
	second=new JButton("second");
	
	public void paintComponent(Graphics g)
	{
		super.paintComponent(g);
		//this line must be there
		
		g.drawString("not a hello world",75,100);
	}
	public MyPanel()
	{
		this.add(new JLabel("heello world"));
		add(first);
		add(second);
		add(third);
		
		
		first.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e){
				
				//setBackground(Color.YELLOW);
				try{
			
					UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
					SwingUtilities.updateComponentTreeUI(MyPanel.this)	;
				}
				catch(Exception fe){
					
				}
				
			}
			
		});
		
		second.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e){
				
			
				//setBackground(Color.RED);
				try{
					
				
					UIManager.setLookAndFeel(UIManager.getCrossPlatformLookAndFeelClassName());
					SwingUtilities.updateComponentTreeUI(MyPanel.this)	;
			
				}
				catch(Exception fe){
					
				}
			}
		}
		);
		
		third.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e)
			{
				try{
				
					UIManager.setLookAndFeel("com.sun.java.swing.plaf.gtk.GTKLookAndFeel");
				}
				catch(Exception fe){
				}
				JFrame.setDefaultLookAndFeelDecorated(true);
				SwingUtilities.updateComponentTreeUI(MyPanel.this)	;
			//	setBackground(Color.BLUE);
			}
		});
		
		
	}
}
