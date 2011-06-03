import java.awt.*;
import javax.swing.*;
import java.awt.Container;
import java.awt.FlowLayout;
import java.sql.*;
import java.io.*;
import java.awt.event.*;

import javax.swing.JFrame;


public class jdbcswg 
 {
 	 public static void main(String args[])
 	  {
 	 
 	 MyFrame frame = new MyFrame();
 	 frame.setDefaultCloseOperation(frame.EXIT_ON_CLOSE);
 	 frame.setSize(400,400);
 	 frame.setVisible(true);
 	 
 	} 
 }
 
class MyFrame extends JFrame implements ActionListener
 {
 	 JTextField text1;
 	 JButton add,del,edit,next,prev;
 	 static String url="jdbc:odbc:demo2";;
 	 static String driver ="sun.jdbc.odbc.JdbcOdbcDriver";;
	String name,clas;
	int rollno;
	Connection con;
	Statement stmt;
    ResultSet rs;
    
	    
 	 
 	 MyFrame() 
 	  {
 	  	 Container contentPane = getContentPane();
 	  	 text1 = new JTextField(20);
 	  	 
 	  	 add = new JButton("add");
 	  	 add.setActionCommand("add");
 	  	 add.addActionListener(this);
 	  	 
 	  	 
 	  	 
 	  	 next = new JButton("next");
 	  	 next.setActionCommand("next");
 	  	 next.addActionListener(this);
 	  	 
 	  	 
 	  	 prev = new JButton("previous");
 	  	 prev.addActionListener(this);
 	  	 prev.setActionCommand("prev");
 	  	 
 	  	 
 	  	 FlowLayout flow = new FlowLayout();
 	  	
         JPanel panel = new JPanel();
     	 panel.setLayout(flow);
     	 panel.add(add);
 	  	 panel.add(next);
 	  	 panel.add(prev);
 	  	 
 	  	 JPanel panel2 = new JPanel();
 	  	 panel2.add(text1);
 	  	 contentPane.setLayout(flow);
 	  	 contentPane.add(panel);
 	  	 contentPane.add(panel2);
 	  	 
 	  	 
 	  	 try
 	  	  {
 	  	  
 	  	 
 	  	 initialize();
 	  	 createTable();
 	  	 stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		String sql="select * from STUDENT";
		 rs=stmt.executeQuery(sql);
		 rs.next();
	    
		text1.setText(rs.getString("NAME"));
	     //rs.close();
		//stmt.close();
 	  	 } catch(SQLException e)
 	  	  {
 	  	  	
 	  	  }
 	  	  catch(ClassNotFoundException e)
 	  	   {
 	  	   	
 	  	   }
 	  	 
 	  	 contentPane.setVisible(true); 
 	  }
 	  
   public void initialize() throws SQLException,ClassNotFoundException
	{
		Class.forName(driver);
		con=DriverManager.getConnection(url,"","");		
	}
 	  
   	public void createTable() 
	{
		try{
		stmt=con.createStatement();
		stmt.executeUpdate("CREATE TABLE STUDENT (NAME TEXT,CLASS TEXT,ROLLNO NUMBER)");
		stmt.close();
		}catch(SQLException e)
		{
		
		}
	}
	
public void addName(String name)
 {
 	 try
 	  {
 	    System.out.println(name);
 	    String name1 = name;
 	    String clas ="brt";
 	    int rollno = 3;
 	    //String sql="INSERT INTO STUDENT VALUES ('"+name+"')";
 	    String sql="INSERT INTO STUDENT VALUES ('"+name1+"','"+clas+"','"+rollno+"')";
		//stmt=con.createStatement();
		//String sql="select * from STUDENT";
		//String sql="INSERT INTO STUDENT VALUES ('"+name1+"','"+rs.getString("NAME")+"')";
		stmt=con.createStatement(rs.TYPE_SCROLL_INSENSITIVE,rs.CONCUR_UPDATABLE);
		//stmt.executeUpdate(sql);
		stmt.execute(sql);
		
		/*rs.moveToInsertRow();
		rs.updateString("NAME",name1);
		rs.updateString("CLASS",clas);
		rs.updateInt("ROLLNO",rollno);*/
		//System.out.println("i am insert row");
		//rs.insertRow();
		//System.out.println("inserted  row");
		//int i= rs.getRow();
		//System.out.println("i am insert row  "+ i);
		//rs.last();
		//rs.moveToCurrentRow();
		//i= rs.getRow();
		con.commit();
		System.out.println("i am insert row  ");
		 con.close();
		 stmt.close();
  	  	     
  	  	     con=DriverManager.getConnection(url,"","");
  	  	     stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
  	  	    stmt.execute("select * from student");
  	  	     rs=stmt.getResultSet();
  	  	     rs.next();
  	  	     final String name2=rs.getString(1);
  	  	     System.out.println(name2);

  	  	   
  	  	     	//	text1.setText(name2);
  	
  	  	  
  	  	    
		//stmt.executeUpdate(sql);
		//rs.updateRow();
		con.close();
		stmt.close();
	  } catch(SQLException e)
	    {
	    e.printStackTrace(System.out);	
	    }
 }	
	
public void actionPerformed(ActionEvent e)
  {
  	/*try
  	 {
  	 
  	stmt=con.createStatement();
	String sql="select * from STUDENT";
    rs=stmt.executeQuery(sql);
    //rs.moveToCurrentRow();
     } catch(SQLException e1)
      {
      	
      }
      */
     
  	 if(e.getActionCommand()=="next")
  	  {
  	  	try
  	  	 {
  	  	  if(!rs.isLast())
  	  	  {
  	  	  	  rs.next();
  	  	   
  	  	    
  	  	  text1.setText(rs.getString("NAME"));
  	  	  }
  	  	 // text1.setText("hii");
  	  	 }catch(SQLException e1)
  	  	  {
  	  	  	e1.printStackTrace();
  	  	  }
  	  	  catch(NullPointerException e1)
  	  	   {
  	  	   	
  	  	   } 
  	  }
  	  
  	 if(e.getActionCommand()=="prev")
  	  {
  	  	try
  	  	 {   
  	  	     //rs.refreshRow();
  	  	      	if(!rs.isFirst())
  	  	      {
  	  	      		 rs.previous();
  	  	      		  text1.setText(rs.getString("NAME"));
  	  	      }
  	  	    
  	  	 	    
  	  	 	
  	  	 	 //	rs.close();
  	  	 	 //	stmt.close();   
  	  	 } catch(SQLException e1)
  	  	  {
  	  	  	e1.printStackTrace();
  	  	  }
  	  	  catch(NullPointerException e1)
  	  	   {
  	  	   	
  	  	   } 
  	  }
  	  
  	 if(e.getActionCommand()=="add")
  	  {
  	    //JOptionPane.showMessageDialog(null,"hi","hi",JOptionPane.INFORMATION_MESSAGE);
  	   	Diag dialog = new Diag(this,"Input");  
  	  }
  	 
  	
  }	
	  
 	  
 }
 
 class Diag extends JDialog implements ActionListener 
  {
  	 JTextField text3, text4,text2;
   	 JButton ok,cancel;
   MyFrame fr;
	  	 public Diag(MyFrame parent, String title)
   	  {
   	  	super(parent,title,false);
   	  	 fr=parent;
   	  	 if(parent!=null)
   	  	  {
   	  	  	 Dimension size = parent.getSize();
   	  	  	 Point p = parent.getLocation();
   	  	  	 setLocation(p.x + size.width/4,p.y + size.height/4);
   	  	  	 
   	  	  } 
   	  	  
   	  	  JPanel panel = new JPanel();
   	  	  panel.add(new JLabel("Enter ur name"));
   	  	   text3 = new JTextField(20);
   	  	   this.text2=text2;
   	  	   
   	  	  
   	  	   //panel.add(new JLabel("Enter ur roll no"));
   	  	   //text4 = new JTextField(20);
   	  	  
   	  	  panel.setLayout(new FlowLayout()); 
   	  	  panel.add(text3);
   	  	 // panel.add(text4);
   	  	  
   	  	  JPanel panel2 = new JPanel();
   	  	   ok = new JButton("Ok");
   	  	  ok.setActionCommand("ok"); 
   	  	  ok.addActionListener(this);
   	  	  
   	  	  
   	  	   cancel = new JButton("Cancel");
   	  	   cancel.setActionCommand("cancel");
   	  	   cancel.addActionListener(this);
   	  	  panel.setLayout(new FlowLayout());
   	  	  panel2.add(ok);
   	  	  panel2.add(cancel);
   	  	  
   	  	 Container content = getContentPane();
   	  	 content.setLayout(new FlowLayout());
   	  	 content.add(panel);
   	  	 content.add(panel2); 
   	  	  setDefaultCloseOperation(DISPOSE_ON_CLOSE);
   	  	  pack();
   	  	  setVisible(true);
  }
  
   public void actionPerformed(ActionEvent e)
   	   {
   	   	
   	   	 if(e.getActionCommand()=="ok")
   	   	 {
              String str = text3.getText();
   	   	 	//JOptionPane.showMessageDialog(null,str,"hi",JOptionPane.INFORMATION_MESSAGE);
   	   	  
   	   	    // String str1 = text4.getText();
   	   	     //int roll = Integer.parseInt(str1);
   	   	     //SwingFrame fr1 = new SwingFrame();
   	   	     //fr1.add(str,str1);
   	   	     
   	   	     //MyFrame fr = new MyFrame();
   	   	     //MyFrame fr=this.getParent()
   	   	     
   	   	     fr.addName(str);
   	   	     //text2.setText(str);
   	   	     
   	   	     
   	   	   setVisible(false);
   	   	   dispose();
   	   	 }
   	   	 if(e.getActionCommand()=="cancel")
   	   	    {
   	   	    	setVisible(false);
   	   	          dispose();
   	   	    }
   	   }
  
  }