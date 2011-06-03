import java.awt.*;
import java.awt.event.*;



class gui extends Frame implements ActionListener
{
	
	Button yes,no;
	String msg;
	
	gui()
	{
		mywindowadapter adapter=new mywindowadapter(this);
		addWindowListener(adapter);
		
		setSize(600,600);
	
		yes=new Button("yes");
		no=new Button("no");
		add(yes);
		add(no);
		yes.setSize(30,30);
		no.setSize(40,40);
		
		setVisible(true);
		yes.addActionListener(this);
		no.addActionListener(this);
	}
	

	public void actionPerformed(ActionEvent e)
	{
		System.out.println(e.getActionCommand());	//shows no
		//if(e.getActionCommand()=="no")
		
		
	}
	
	
}

class mywindowadapter extends WindowAdapter
{
	Frame sample;
	
	mywindowadapter(Frame th)
	{
		this.sample=th;
	}
	
	public 	void windowClosing(WindowEvent e)
	{
		System.exit(0);
	}
}


class mad
{
	
	public static void main(String args[])
	{
		gui mygui=new gui();
		
		
	}
	
}