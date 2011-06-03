//this shows how to consume an event.
//not all events can be consumed

import javax.swing.*;
import java.awt.event.*;


class ConsumeEvent{
	

	public static void main(String args[]){
	
		MyFrame mf=new MyFrame();
		mf.pack();	//set to minimum size
		mf.show();
			
	}
}


class MyFrame extends JFrame {
	
	MyPanel mp;
	JMenu mymenu;
	JMenuItem item=new JMenuItem("Exit");
	JMenuBar jmb=new JMenuBar();
	public MyFrame(){
		
		mymenu=new JMenu("madhur");
		mymenu.insert(item,1);
		jmb.add(mymenu);
	//	getContentPane().add(jmb);
	//	getRootPane().add(jmb);
		item.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e){
				System.exit(0);
			}
		});
		
		this.setJMenuBar(jmb);
		setSize(200,200);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		mp=new MyPanel();
		getContentPane().add(mp);
		
	}
}


class MyPanel extends JPanel {
	
	JTextField name;
	MyPanel(){
		name=new JTextField();
		add(name);
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