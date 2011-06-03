/*Problem definition : Write a program to develop TicTacToe Applet
 *
 *Name of Programmer : Madhur Ahuja
 *
 *version 			 : JDK 1.4.1_01
 *
 *Special Packages   : java.applet.Applet
 *					   java.awt.event.*
 *					   java.awt.*
 *					   javax.swing.*
 *					   java.util.Random
 *					   java.util.jar
 */
 

import java.awt.*;
import java.awt.event.*;
import java.applet.Applet;
import javax.swing.*;
import java.util.Random;

/*<applet code=game.class height=400 width=600>
 </applet>*/
 
public class game extends Applet implements ActionListener
{
	JButton x[][]=new JButton[3][3];	
	Button reset,start;
	static	boolean win,draw;
	static int movecount;
	TextArea turn1;
	ImageIcon not,cross;
	Image not1,cross1;
	public game()
	{
		win=draw=false;
		movecount=0;	
			
	}
	
	public void paint(Graphics g)
	{
	
		g.drawLine(120,20,120,270);
		g.drawLine(220,20,220,270);
		g.drawLine(50,90,300,90);
		g.drawLine(50,190,300,190);	
		doLayout();
	}
		
	public void init()
	{
		
    	int countx=0,county=0;
             
        cross1=getImage(getCodeBase(),"images/cross.gif");
        not1=getImage(getCodeBase(),"images/not.gif");
        cross=new ImageIcon(cross1);
        not=new ImageIcon(not1);
        setLayout(null);         
		setBackground(Color.lightGray);
		
		for(int i=0;i<3;++i)
		{
			
			for(int j=0;j<3;++j)
			{
			
				x[i][j]=new JButton("");				
				x[i][j].setEnabled(false);
				add(x[i][j]);
				
				x[i][j].setLocation(50+j*100,20+i*100);
				x[i][j].setSize(40,40);
				
				x[i][j].addActionListener(this);
			}
			county++;
			countx=0;
			
		}
		reset=new Button("Reset");
		reset.setEnabled(false);
		reset.addActionListener(this);
		add(reset);
		
		reset.setLocation(50,300);
		reset.setSize(100,30);
		
		start=new Button("Start");
		start.addActionListener(this);
		add(start);
		
		start.setLocation(200,300);
		start.setSize(100,30);
		
		turn1=new TextArea("",10,10,TextArea.SCROLLBARS_NONE);
		turn1.setEditable(false);
		turn1.setBackground(Color.white);

		add(turn1);
		
		turn1.setLocation(350,20);
		turn1.setSize(200,300);
	
		doLayout();
		validate();
		
	}
	
	
	void reset()
	{
		win=draw=false;
		for(int i=0;i<3;++i)
		{
			for(int j=0;j<3;++j)
			{
				x[i][j].setEnabled(false);		
				x[i][j].setIcon(null);
			}
					
		}

	}
	    
    boolean checkwin(Object button)
    {
 
    	int count=0;  
    	for(int i=0;i<3;++i)
    	{
    		
    		for(int j=0;j<3;++j)
    		{
    		
    			Icon nw=x[0][0].getIcon();		
   				if(nw!=null)
    			if(nw==x[0][1].getIcon()&&nw==x[0][2].getIcon() ||nw==x[1][0].getIcon()&&nw==x[2][0].getIcon()||nw==x[1][1].getIcon()&&nw==x[2][2].getIcon())
    			{
    				win=true;
    				break;
    			}
    			else
    				win=false;

				nw=x[0][1].getIcon();
				if(nw!=null)
    			if(nw==x[1][1].getIcon()&&nw==x[2][1].getIcon())
    			{
    				win=true;
    				break;
    			}
    			else
    				win=false;
    	
    			nw=x[0][2].getIcon();
    			if(nw!=null)
    			if(nw==x[1][1].getIcon()&&nw==x[2][0].getIcon()||nw==x[1][2].getIcon()&&nw==x[2][2].getIcon())
    			{
    				win=true;
    				break;
    			}
    			else
    				win=false;
    	
    			nw=x[1][0].getIcon();
    			if(nw!=null)
    			if(nw==x[1][1].getIcon()&&nw==x[1][2].getIcon())
    			{
    				win=true;
    				break;
    			}
    			else
    				win=false;
    	
    			nw=x[2][0].getIcon();
    			if(nw!=null)
    			if(nw==x[2][1].getIcon()&&nw==x[2][2].getIcon())
    			{
    				win=true;
    				break;
    			}
    			else
    				win=false;
    		
    		}
    	}
    	
    	return win;    	
    }
    
    
JButton getmove()
    {
 
    	int count=0;  
    	for(int i=0;i<3;++i)
    	{
    		
    		for(int j=0;j<3;++j)
    		{
    		
    			Icon nw=x[0][0].getIcon();		
   				if(nw==null)
    			if(nw!=x[0][1].getIcon()&&x[0][1].getIcon()==x[0][2].getIcon() ||nw!=x[1][0].getIcon()&&x[1][0].getIcon()==x[2][0].getIcon()||nw!=x[1][1].getIcon()&&x[1][1].getIcon()==x[2][2].getIcon())
					return x[0][0];

				nw=x[0][1].getIcon();
				if(nw==null)
    			if(nw!=x[1][1].getIcon()&&x[1][1].getIcon()==x[2][1].getIcon())
					return x[0][1];
    	
    			nw=x[0][2].getIcon();
    			if(nw==null)
    			if(nw!=x[1][1].getIcon()&&x[1][1].getIcon()==x[2][0].getIcon()||nw!=x[1][2].getIcon()&&x[1][2].getIcon()==x[2][2].getIcon())
 					return x[0][2];
    	
    			nw=x[1][0].getIcon();
    			if(nw==null)
    			if(nw!=x[1][1].getIcon()&&x[1][1].getIcon()==x[1][2].getIcon())
    				return x[1][0];
    			
    			nw=x[1][1].getIcon();
    			if(nw==null)
    			if(nw!=x[0][0].getIcon()&&x[0][0].getIcon()==x[2][2].getIcon() || nw!=x[0][1]&&x[0][1].getIcon()==x[2][1].getIcon()||nw!=x[0][2].getIcon()&&x[0][2].getIcon()==x[2][0].getIcon()||nw!=x[1][0].getIcon()&&x[1][0].getIcon()==x[1][2].getIcon())
    				return x[1][1];
    				
    			nw=x[1][2].getIcon();
    			if(nw==null)
    			if(nw!=x[0][2].getIcon()&&x[0][2].getIcon()==x[2][2].getIcon())
    				return x[1][2];

    			nw=x[2][0].getIcon();
    			if(nw==null)
    			if(nw!=x[2][1].getIcon()&&x[2][1].getIcon()==x[2][2].getIcon())
    				return x[2][0];
    				
    			nw=x[2][1].getIcon();
	   			if(nw==null)
    			if(nw!=x[2][0].getIcon()&&x[2][0].getIcon()==x[2][2].getIcon()||nw!=x[0][1].getIcon()&&x[0][1].getIcon()==x[1][1].getIcon())
    				return x[2][1];
    				
    			
    			nw=x[2][2].getIcon();
	   			if(nw==null)
    			if(nw!=x[2][0].getIcon()&&x[2][0].getIcon()==x[2][1].getIcon()||nw!=x[0][2]&&x[0][2].getIcon()==x[1][2].getIcon()||nw!=x[0][0].getIcon()&&x[0][0].getIcon()==x[1][1].getIcon())
    				return x[2][2];
    			

    		}
    	}
    	
    	return null;   	
    }
  
    
    
 	public void actionPerformed(ActionEvent e) 
 	{

 		JButton obj=null;
 		Button obj1=null;
 		if(e.getSource().getClass()==JButton.class)
 			obj=(JButton)e.getSource();
 		
 		if(e.getSource().getClass()==Button.class)
 			 obj1=(Button)e.getSource();
 		
 		boolean ans;
 		for(int i=0;i<3;++i)
 		{
 			for(int j=0;j<3;++j)
 			{
 			
 				if(e.getSource()==x[i][j]&&win==false&&draw==false)
 				{				
 					movecount++;		
		 			x[i][j].setIcon(not);
		 	
		 			turn1.append("\nO : ["+i+"] ["+j+"]");
	 			
	 				ans=checkwin(e.getSource());
	 				if(ans)
	 				{
	 					JOptionPane.showMessageDialog(this,"O Wins","TicTacToe",JOptionPane.INFORMATION_MESSAGE);			
	 					win=true;
	 					turn1.append("\nGame end O Wins");
	 					return ;
	 				}
	 				else	//game not ended make a computer move
	 				{
	 					int move,r,c;
	 					Random rr=new Random();
	 					if(movecount==5)
	 					{
	 						turn1.append("\nGame Draw");
	 						draw=true;
	 						return;
	 					}
	 					JButton nextmove=getmove();
	 					if(nextmove==null)
	 					{
	 						while(true)
	 						{
	 						
		 						move=rr.nextInt(9);
		 						r=move/3;
		 						c=move%3;
		 						if(x[r][c].getIcon()==null)
		 						{
		 							System.out.println("random");
		 						
		 							x[r][c].setIcon(cross);
		 							turn1.append("\nX  : ["+i+"] ["+j+"]\n");
		 							break;
		 						}	
		 					}
	 						
	 					}
	 					else
	 					{
	 						nextmove.setIcon(cross);
	 						turn1.append("\nX  : ["+i+"] ["+j+"]\n");
	 					}
	 				}
	 				
	 				
	 				ans=checkwin(e.getSource());
	 				if(ans)
	 				{
	 					JOptionPane.showMessageDialog(this,"X Wins","TicTacToe",JOptionPane.INFORMATION_MESSAGE);			
	 					turn1.append("Game end X Wins");
	 					return ;
	 				}
	 				
	 			}
	 		}
	 	}
	 			
 		
 	//###############################################################
 		
 		if(e.getSource()==start)
 		{
 			for(int i=0;i<3;++i)
 			{
 				for(int j=0;j<3;++j)
 					x[i][j].setEnabled(true);
 			}
 			start.setEnabled(false);
 			reset.setEnabled(true);
 		}
 		
 		//##################################################################
 		else if (e.getSource()==reset)
 		{
 			
 			start.setEnabled(true);
 			reset.setEnabled(false);
 			turn1.setText("");
 			movecount=0;
 			reset();
 		}
 	}
 	
 	public String getAppletInfo() 
 	{
		return "TicTacToe by Madhur Ahuja";
    }
}

