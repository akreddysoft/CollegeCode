/*Problem definition : Write a program to display image on awt button
 *
 *Name of Programmer : Madhur Ahuja
 *
 *version 			 : JDK 1.4.1_01
 *
 *Special Packages   : javax.swing.filechooser.*
 *					   javax.swing.*
 */

import javax.swing.*;
import javax.swing.filechooser.*;
import java.awt.*;
import java.awt.event.*;
import java.awt.FileDialog;
import java.io.*;

class myframe extends JFrame 
{
	
	JButton main,load;
	butimage main1;
	FileDialog fd;
	awtlistener lst;
	myframe(String title)
	{
	
		super(title);
		addWindowListener(new winlistener());
		
		lst=new awtlistener(this);
		setSize(640,480);
		main=new JButton("");
		main.setSize(100,100);
		main.setLocation(30,30);
	
		main1=new butimage("");
		main1.setSize(100,100);
		main1.setLocation(230,30);
		
		load=new JButton("Load File");
		load.addActionListener(lst);
		load.setSize(100,30);
		load.setLocation(300,300);
		main.addActionListener(lst);
		
		getContentPane().add(main);
		getContentPane().add(load);
		getContentPane().setLayout(null);
		getContentPane().add(main1);
		
		Dimension winSize = getSize();
        Dimension screenSize =
        Toolkit.getDefaultToolkit().getScreenSize();
        
        validate();
	}
	
	
	void drawimage(ImageIcon img,Image img1)
	{
		main.setIcon(img);
		if(img.getIconHeight()>main.getHeight() || img.getIconWidth()>main.getWidth())
		{
			int ret=JOptionPane.showConfirmDialog(this,"Image is Larger","Button Program",JOptionPane.YES_NO_OPTION,JOptionPane.WARNING_MESSAGE);
			if(ret==JOptionPane.YES_OPTION)
				main.setSize(img.getIconWidth(),img.getIconHeight());		
		}
		
		System.out.println(img.getIconHeight() +" "+img.getIconWidth());
	}
	
	
class awtlistener implements ActionListener
{
	myframe parentframe;
	
	awtlistener(myframe t)
	{
		parentframe=t;
	}
	
	public void actionPerformed(ActionEvent e)
	{
		
		if(e.getActionCommand()=="Load File")
		{
			String fname;
			
			FileDialog fd=new FileDialog(app.window,"Load Image");
			
			fd.setMode(FileDialog.LOAD);
			fd.setVisible(true);
			fname=fd.getFile();
			
			if(fname==null)	
				return ;
			
			String directory = fd.getDirectory();
			System.out.println(directory+fname);
			
	    	File f = new File(directory, fname);
	    	if (f.exists()) 
	    	{

				ImageIcon img=new ImageIcon(directory+"\\"+fname);
				Image img1=img.getImage();
				main1.img=img1;
				parentframe.drawimage(img,img1);
			
			}
		}
	}
	
}

}

class butimage extends Button
{
	Image img;
	butimage(String st)
	{
		
		super(st);
	}
	
	public void paint(Graphics g)
	{
		if(img!=null)
			g.drawImage(img,0,0,null);
	}
	
	
}


class app 
{
	static myframe window;
	public static void main(String args[])
	{
		window=new myframe("Gui Program");
		window.setVisible(true);
	}
	
}

class winlistener extends WindowAdapter
{
	public void windowClosing(WindowEvent e)
	{
		System.exit(0);
		
	}
}

