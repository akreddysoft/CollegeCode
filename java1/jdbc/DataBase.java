 import java.sql.*;
 import javax.swing.*;
 import java.awt.event.*;
 import java.awt.*;
 
 class DataBase
{
 private 	static String DriverString;
	 private static String url;
	 private static String login;
	 private static String password;
	  private static String database;
	static String type;
	DataBase()
	{
		//DriverString="com.mysql.jdbc.Driver";
		DriverString="sun.jdbc.odbc.JdbcOdbcDriver";
		login="madhur";
		password="gold";
		url="jdbc:Odbc:stud";
		//url="jdbc:mysql://localhost/test";
		database="test";
		
	}
	
	static void setDriver(String str[])
	{
		DriverString=str[0];
		url=str[1];
		database=str[2];
		login=str[3];
		password=str[4];
		if(url.matches("mysql"))
			type="mysql";
		else
			type="access";
		
	}
	static String init()	
	{
		String retval="";
		try
		{
		
			Class.forName(DriverString);
			if(DataBase.type.equals("mysql"))
			{
				
				Connection con=DriverManager.getConnection(DataBase.getDriverString()[1],DataBase.getDriverString()[3],DataBase.getDriverString()[4]);
				Statement st=con.createStatement();
				st.execute("show tables");
				st.close();
				con.close();
		}
			
		}
		catch(Exception e)
		{
			 retval=e.toString();
		}
		return retval;
	}
	static String[] getDriverString()
	{
	
		return new String[]{DriverString,url,database,login,password};
		
	}
	
}

class SetDriverFrame
{
	private JFrame mainframe;
	private JTextField DriverString;
	private JTextField login;
	private JTextField password;
	private JTextField database;
	private JTextField url;
	private JTextArea testarea;
	private JButton ok,test,exit;
	private GridBagConstraints gbc=new GridBagConstraints();
	private GridBagLayout gbl;
	
	SetDriverFrame()
	{
		gbl=new GridBagLayout();
		
		mainframe=new JFrame();
		mainframe.getContentPane().setLayout(gbl);
		addwidgets();
		mainframe.pack();
		mainframe.setVisible(true);
		
	}
	
	private void addwidgets()
	{
//		gbc.HORIZONTAL;
		
		gbc.anchor=gbc.WEST;
		gbc.fill=gbc.NONE;
		//DriverString =new J(DataBase.getDriverString()[0]);
		Layout.buildConstraints(mainframe,gbl,new JLabel("Driver String"),gbc,0,0,1,1,80,30);
		
		gbc.fill=gbc.HORIZONTAL;
		DriverString =new JTextField(DataBase.getDriverString()[0],30);
		Layout.buildConstraints(mainframe,gbl,DriverString,gbc,1,0,1,1,70,0);
		
		gbc.fill=gbc.NONE;
		//DriverString =new J(DataBase.getDriverString()[0]);
		Layout.buildConstraints(mainframe,gbl,new JLabel("URL"),gbc,0,1,1,1,0,30);
		
		gbc.fill=gbc.HORIZONTAL;
		url =new JTextField(DataBase.getDriverString()[1],25);
		Layout.buildConstraints(mainframe,gbl,url,gbc,1,1,1,1,0,0);
		
		gbc.fill=gbc.NONE;
		//DriverString =new J(DataBase.getDriverString()[0]);
		Layout.buildConstraints(mainframe,gbl,new JLabel("Database"),gbc,0,2,1,1,0,30);
		
		gbc.fill=gbc.HORIZONTAL;
		database =new JTextField(DataBase.getDriverString()[2],10);
		Layout.buildConstraints(mainframe,gbl,database,gbc,1,2,1,1,0,0);
		
		gbc.fill=gbc.NONE;
		//DriverString =new J(DataBase.getDriverString()[0]);
		Layout.buildConstraints(mainframe,gbl,new JLabel("Login"),gbc,0,3,1,1,0,30);
		
		gbc.fill=gbc.HORIZONTAL;
		login =new JTextField(DataBase.getDriverString()[3],10);
		Layout.buildConstraints(mainframe,gbl,login,gbc,1,3,1,1,0,0);

		gbc.fill=gbc.NONE;
		//DriverString =new J(DataBase.getDriverString()[0]);
		Layout.buildConstraints(mainframe,gbl,new JLabel("Password"),gbc,0,4,1,1,0,30);
		
		gbc.fill=gbc.HORIZONTAL;
		password =new JTextField(DataBase.getDriverString()[4],10);
		Layout.buildConstraints(mainframe,gbl,password,gbc,1,4,1,1,0,0);
		
		gbc.fill=gbc.NONE;
		gbc.anchor=gbc.WEST;
		ok =new JButton("OK");
		Layout.buildConstraints(mainframe,gbl,ok,gbc,0,5,1,1,0,30);

		//gbc.anchor=gbc.EAST;
		gbc.fill=gbc.NONE;
		test =new JButton("Test");
		Layout.buildConstraints(mainframe,gbl,test,gbc,1,5,1,1,0,0);


		gbc.anchor=gbc.CENTER;
		gbc.fill=gbc.NONE;
		exit =new JButton("Exit");
		Layout.buildConstraints(mainframe,gbl,exit,gbc,1,5,1,1,0,0);

		
		testarea =new JTextArea(10,20);
		testarea.setLineWrap(true);
		JScrollPane sp=new JScrollPane(testarea);
		//sp.add(testarea);
		
		gbc.fill=gbc.BOTH;
		//gbc.anchor=gbc.D
		
		Layout.buildConstraints(mainframe,gbl,sp,gbc,0,6,2,1,0,40);
		
		
		
		exit.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				
				System.exit(0);
			}
		});
		
		test.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				DataBase.setDriver(new String[]{DriverString.getText(),url.getText(),database.getText(),login.getText(),password.getText()});
				if(DataBase.init().equals(""))
					testarea.setText("Test Successful");
				else
					testarea.setText(DataBase.init());
				
				
			}
		});
	
		ok.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				DataBase.setDriver(new String[]{DriverString.getText(),url.getText(),database.getText(),login.getText(),password.getText()});
				if(DataBase.init().equals(""))
				{
					mainframe.dispose();
					new MainWindow();
			
				}
				else
				{
					JOptionPane.showMessageDialog(null,"Test Failed","JDBC",JOptionPane.ERROR_MESSAGE);		
					
				}
			}
		});
	
	}
}
