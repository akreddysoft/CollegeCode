import java.awt.*;
import java.io.*;
import javax.imageio.*;
import javax.swing.*;

public class mybean extends JLabel
{
	public mybean()
	{
		setBorder(BorderFactory.createEtchedBorder());
	}
	
	public void setFileName(String fileName)
	{
		try
		{
			file=new File(fileName);
			setIcon(new ImageIcon(ImageIO.read(file)));
		}
		catch(Exception e)
		{
			file=null;
			setIcon(null);
			
		}
	}
	
	
	/*public void setFileName(String fileName)
	{
		file=new File(fileName);
		Image image=Toolkit.getDefaultToolkit().getImage(fileName);
		MediaTracker tracker=new MediaTracker(this);
		tracker.addImage(image,0);
		try
		{
			tracker.waitForID(0);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		setIcon(new ImageIcon(image));
		repaint();
	}*/
	
	public String getFileName()
	{
		if(file==null)return null;
		else
		return file.getPath();
	}
	
	public Dimension getPreferredSize()
	{
		return new Dimension(XPREFSIZE,YPREFSIZE);
	}
	
	private File file=null;
	private static final int XPREFSIZE=200;
	private static final int YPREFSIZE=200;
	
	
	
}