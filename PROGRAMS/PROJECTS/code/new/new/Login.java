import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import java.io.*;
import java.util.*;
import java.net.*;

class Login extends JFrame implements ActionListener
{
	Container cp;
	JPanel jpLogin;
	JButton jbLogin,jbCancel,jbReset;
	JLabel jlName,jlPass,jlClick,jlMess;
	JTextField jtName;
	JPasswordField jtPass;
    Connection con ;
	PreparedStatement  st;
	ResultSet rs;
	String Name;
	public Login()
	{
		super("Login");
		setLogin();
		addWindowListener(new WindowAdapter()
						{
							public void windowClosing(WindowEvent we)
							{
								System.exit(0);
							}
						});
	}
	public void setLogin()
	{
		
		try
		{
		   cp=getContentPane();   
		   jpLogin=new JPanel();
		   jpLogin.setLayout(null);
		   jlName=new JLabel("User Name");
		   jlName.setBounds(20,40,70,27);
		   jpLogin.add(jlName);
		   jtName=new JTextField();
		   jtName.setBounds(100,40,180,27);
		   jpLogin.add(jtName);
		   jlPass=new JLabel("Password");
		   jlPass.setBounds(20,70,70,27);
		   jpLogin.add(jlPass);
		   jtPass=new JPasswordField();
		   jtPass.setBounds(100,70,180,27);
		   jpLogin.add(jtPass);

		   jbLogin=new JButton("Login");
		   jbLogin.setBounds(50,110,80,27);
		   jpLogin.add(jbLogin);
		   jbCancel=new JButton("Cancel");
		   jbCancel.setBounds(180,110,80,27);
		   jpLogin.add(jbCancel);
		   jbReset=new JButton("Reset");
		   jbReset.setBounds(120,155,80,27);
		   jpLogin.add(jbReset);

		   jlClick=new JLabel("Forgot Password Then Click on Link");
		   jlClick.setBounds(50,195,250,27);
		   jpLogin.add(jlClick);
			
		
		   jtName.setNextFocusableComponent(jtPass);
		   jtPass.setNextFocusableComponent(jbLogin);
		   jbLogin.setNextFocusableComponent(jbCancel);
		   jbCancel.setNextFocusableComponent(jbReset);
		    	
		   cp.add(jpLogin);
		   
		   setSize(330,300);
	       setVisible(true);
		   jbLogin.addActionListener(this);
		   jbCancel.addActionListener(this);
		   jbReset.addActionListener(this);
		}
		catch(Exception e2)
		{
			System.out.println(e2);
		}
	}

    public void actionPerformed(ActionEvent e1)
    {
	   
    	try
    	{
		    	if(e1.getSource()==jbLogin)
		    	{
					try
					{
						if(jtName.getText().trim().equals(""))
						{
							JOptionPane.showMessageDialog(null,"Please eneter the user name");
							return;
						}
						if(jtPass.getText().trim().equals(""))
						{
							JOptionPane.showMessageDialog(null,"Please eneter the password");
							return;
						}
			
						Socket clientSoc=new Socket("localhost",4444);
						PrintWriter pw=new PrintWriter(clientSoc.getOutputStream(),true);
						String loginString=jtName.getText().trim()+":"+jtPass.getText().trim();
						pw.println(loginString);
						BufferedReader buf=new BufferedReader(new InputStreamReader(clientSoc.getInputStream()));
						String ss=buf.readLine();
						if((ss+"").trim().equalsIgnoreCase("LoggedIn"))
						{
							new ComMan(jtName.getText().trim());
							setVisible(false);
						}
						else
						{
							JOptionPane.showMessageDialog(null,ss);
							jtName.setText("");
							jtPass.setText("");
						}
					}
					catch(Exception e)
					{
						System.out.println(e);
					}
				}
				else if(e1.getSource()==jbCancel)
				{
					System.exit(0);
				}
				else if(e1.getSource()==jbReset)
				{
					jtName.setText("");
					jtPass.setText("");
				}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	public static void main(String[] args)
    {
		new Login();	
    }
}     
