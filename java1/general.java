import java.applet.*;
import java.awt.*;

/*
<applet code=general width=200 height=200>
<param name = fontname value= courier>
<param name= fontsize value = 14>


</applet>
*/


public class general extends Applet
{
	String fontname;
	int fontsize;
	
	public void start()
	{
		String param;
		fontname=getParameter("fontname");
		if(fontname==null)
			fontname="not found";
			
		param=getParameter("fontsize");
		if(param!=null)
			fontsize=Integer.parseInt(param);
		else
			fontsize=0;
			
	}
			
		
		
	public void paint(Graphics g)
	{
		g.drawString("font name :" + fontname,0,10);
		g.drawString("font size :"+ fontsize,0,26);
	}
	
}