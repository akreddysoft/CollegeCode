import javax.swing.*;
import javax.swing.event.*;
class MyDocumentListener implements DocumentListener 
{
    String newline = "\n";
    private JTextField from,to,server;
    private JButton ss;
    MyDocumentListener(JTextField f,JTextField t,JTextField s,JButton sss)
    {
    	from=f;to=t;server=s;
    	ss=sss;
    }
 
    public void insertUpdate(DocumentEvent e)
    {
    		updatelog();
    }
    public void removeUpdate(DocumentEvent e)
     {
    	updatelog();
    }
    public void changedUpdate(DocumentEvent e) 
    {
    	updatelog();
    }
    
    void updatelog()
    {
    	
    	if(server.getText().equals("")||from.getText().equals("")||to.getText().equals(""))
    		ss.setEnabled(false);
    	else
    		ss.setEnabled(true);
    }
	
}


  
class iptextlistener implements DocumentListener 
{
    String newline = "\n";
    private JTextField from,to;
    private JButton ss;
    iptextlistener(JTextField f,JTextField t,JButton sss)
    {
    	from=f;to=t;
    	ss=sss;
    }
 
    public void insertUpdate(DocumentEvent e)
    {
    		updatelog();
    }
    public void removeUpdate(DocumentEvent e)
     {
    	updatelog();
    }
    public void changedUpdate(DocumentEvent e) 
    {
    	updatelog();
    }
    
    void updatelog()
    {
    	
    	if(from.getText().equals("")||to.getText().equals(""))
    		ss.setEnabled(false);
    	else
    		ss.setEnabled(true);
    }
	
}


    