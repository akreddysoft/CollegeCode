package sunw.demo.InfoBean;

import java.awt.*;
import java.beans.*;


public class InfoBean extends Canvas 
{
	
	private String path="dfdf";
	Image img;
	PropertyChangeSupport pc=new PropertyChangeSupport(this);
	
	public String getPath()
	{
		return path;
	}
	
	public void setPath(String str)
	{
		String df=path;
		path=str;
		pc.firePropertyChange("path",df,str);
		repaint();
	}
	
	public void paint(Graphics g)
	{
		img=Toolkit.getDefaultToolkit().getImage(path);
		if(img!=null)
		{
				
				g.drawImage(img,0,0,null);
		}
		else
			g.drawString(path,10,10);
			
	}

	public void addPropertyChangeListener(
	                PropertyChangeListener l)
	{
	    pc.addPropertyChangeListener(l);
	}
	public void removePropertyChangeListener(
	                PropertyChangeListener l)
	{
	    pc.removePropertyChangeListener(l);
	}

	
	
}