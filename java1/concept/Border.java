import javax.swing.*;
import java.awt.*;
import javax.swing.border.*;


class Border{
	
	public static void main(String args[]){
		
		JFrame ff=new JFrame();
		ff.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		ff.getContentPane().setLayout(new FlowLayout());
		ff.getContentPane().add(new JLabel("madhur"));
		ff.getContentPane().add(new JButton("Hello"));
		
		ff.pack();
		
		BorderFactory.createBevelBorder(0,Color.BLACK,Color.WHITE,Color.YELLOW,Color.CYAN);
		BevelBorder bb=new BevelBorder(1);
		//bb.paintBorder(hello,)
		
		ff.setVisible(true);
		
	}
	
	
}


