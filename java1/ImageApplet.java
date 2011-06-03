import java.awt.*;
import javax.swing.*;
import java.awt.event.*;


public class ImageApplet extends JApplet
{
	
	private Image img,img1;
	JFrame df;
	JTextField file;
	JButton click;
	public ImageApplet()
	{
	
		
	}
	
	
	public void init()
	{
			file=new JTextField("dfFD");
		click=new JButton("Set");
		//img=getImage("c:\\windows\\cloud.gif");
		//System.out.println(getDocumentBase());
		//System.out.println(getCodeBase().getHost());
		//System.out.println(System.getProperty("user.home"));
		img=Toolkit.getDefaultToolkit().getImage("c:\\windows\\cloud.gif");
		this.getContentPane().setLayout(new GridLayout(2,2));
		this.getContentPane().add(new JLabel("dfdf"));
		this.getContentPane().add(file);
		this.getContentPane().add(click);

		click.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				img=Toolkit.getDefaultToolkit().getImage(click.getText());
				ImageApplet.this.repaint();
				
				
			}
		});
	
			
		
	}
	
	
	public void paint(Graphics g)
	{
		g.drawImage(img,0,0,null);
		
	}
	
	
	
}