//this shows how to consume an event.
//not all events can be consumed
//this one is without panel

import javax.swing.*;
import java.awt.event.*;


class ConsumeEvent1{
	

	public static void main(String args[]){
	
		MyFrame mf=new MyFrame();
		mf.pack();	//set to minimum size
		mf.show();
			
	}
}


class MyFrame extends JFrame {
	
	MyPanel mp;
	JTextField name;
	public MyFrame(){
		
		setSize(200,200);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		mp=new MyPanel();
		getContentPane().add(mp);
		
		name=new JTextField();
		
		getContentPane().add(name);
		//setLayout(null);
		name.setText("123456789");
		//name.setSize(100,100);
		name.addKeyListener(new KeyListener(){
			
			public void keyTyped(KeyEvent e){
				if(e.getKeyChar()>='0'&&e.getKeyChar()<='9')
				;
				else
					e.consume();
				
			}
			
			public void keyReleased(KeyEvent e){
				
			}
			
			public void keyPressed(KeyEvent e){
				
				
			}
		});
		
		
		
	}
}

