import javax.swing.*;
import java.sql.*;
import java.awt.event.*;
import java.util.*;
import java.awt.*;
import javax.swing.table.*;
import javax.swing.event.*;

class MainFrame extends JFrame
{
	GridBagLayout gbl;
	GridBagConstraints gbc;
	JTextField id,name,age;
	JButton add,next,prev;
	String url;
	Connection con;
	ResultSet rs1;
	Statement stt;	
	JTable maintable;
	JScrollPane mainpane;
	
	MainFrame()
	{
		gbl=new GridBagLayout();
		gbc=new GridBagConstraints();
		getContentPane().setLayout(gbl);
	
try
{
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		url="jdbc:odbc:ex";
		
		con=DriverManager.getConnection(url,"","");
		stt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		stt.execute("select * from data");
		rs1=stt.getResultSet();
		rs1.next();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}

		
			addwidgets();
		
		pack();
		setVisible(true);
			
	}
	
	
	private void addwidgets()
	{
		//id=new JTextField();
		buildcons(this,gbl,new JLabel("ID:"),gbc,0,0,1,1,30,30);
		
		
		id=new JTextField(10);
		buildcons(this,gbl,id,gbc,1,0,1,1,70,0);
		
		//id=new JTextField();
		buildcons(this,gbl,new JLabel("Name:"),gbc,0,1,1,1,0,30);
		
		name=new JTextField(10);
		buildcons(this,gbl,name,gbc,1,1,1,1,0,0);
		
		buildcons(this,gbl,new JLabel("age:"),gbc,0,2,1,1,0,30);
		
		age=new JTextField(10);
		buildcons(this,gbl,age,gbc,1,2,1,1,0,0);
		
		add=new JButton("Add");
		buildcons(this,gbl,add,gbc,0,3,1,1,0,30);
		
			
		next=new JButton("next");
		buildcons(this,gbl,next,gbc,1,3,1,1,0,0);
		
			prev=new JButton("prev");
		buildcons(this,gbl,prev,gbc,2,3,1,1,0,0);

		final tablemodel dff=new tablemodel();
		maintable=new JTable(dff);
		mainpane=new JScrollPane(maintable);
		
		maintable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		
		TableColumn sportColumn=maintable.getColumnModel().getColumn(2);
		JComboBox comboBox = new JComboBox();
		comboBox.addItem("Snowboarding");
		comboBox.addItem("Rowing");
		comboBox.addItem("Chasing toddlers");
		comboBox.addItem("Speed reading");
		comboBox.addItem("Teaching high school");
		comboBox.addItem("None");
		sportColumn.setCellEditor(new DefaultCellEditor(comboBox));


//Ask to be notified of selection changes.
ListSelectionModel rowSM = maintable.getSelectionModel();

rowSM.addListSelectionListener(new ListSelectionListener() {
    public void valueChanged(ListSelectionEvent e) {
       
           
		System.out.println(maintable.getSelectedRow())            ;
		           
        
    }
});


		buildcons(this,gbl,mainpane,gbc,0,4,1,1,0,0);

		
		add.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				try
				{
					String id=MainFrame.this.id.getText();
					String name=MainFrame.this.name.getText();
					String age=MainFrame.this.age.getText();
					boolean df=false;
					Statement st=con.createStatement();
					st.execute("insert into data values("+id+",'"+name+"',"+age+","+df+")")		;
					st.close();
					MainFrame.this.id.setText("");
					MainFrame.this.name.setText("");
					MainFrame.this.age.setText("");
					
					//stt.close();
					stt.execute("select * from data");
					rs1=stt.getResultSet();
					dff.fireTableDataChanged();
					maintable.repaint();
				
				
				
				}
				catch(Exception ee)
				{
					ee.printStackTrace();
				}
				
				
				
			}
			
		});
		
		next.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				try
				{
					if(rs1.isLast())
						rs1.last();
					else
					{
							rs1.next();
							id.setText(rs1.getString(1));
							name.setText(rs1.getString(2));
							age.setText(rs1.getString(3));
					}			
				}
				catch(Exception ee)
				{
					ee.printStackTrace();
				}
			}
				
				
				
		});
		
		prev.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				
				try
				{
				
				
					if(rs1.isFirst())
						rs1.first();
					else
					{
							rs1.previous();
							id.setText(rs1.getString(1));
							name.setText(rs1.getString(2));
							age.setText(rs1.getString(3));
					}
				}
				catch(Exception ee)
				{
					ee.printStackTrace();
				}
				
			}
		});

		

	}
	
	private void buildcons(JFrame frame,GridBagLayout gbl,JComponent cmp, GridBagConstraints gbc,int x,int y, int a,int b,int c,int d)
	{
		
		gbc.gridx=x;
		gbc.gridy=y;
		
		gbc.gridheight=a;
		gbc.gridwidth=b;
		
		
		gbc.weightx=c;
		gbc.weighty=d;
		gbl.setConstraints(cmp,gbc);
		frame.getContentPane().add(cmp)	;	
	}
	
	public static void main(String args[])
	{
		SwingUtilities.invokeLater(new Runnable()
		{
			public void run()
			{
				new MainFrame();
			}
		});
	}
	

	
}


class tablemodel extends javax.swing.table.DefaultTableModel
{
	
	ResultSet rs;
	Statement st;
	Connection con;
	java.sql.ResultSetMetaData rsm;

int cnt,rnt=0;
	tablemodel()
	{
	try
	{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection(database.url,"","");
		st=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		rs=st.executeQuery("select * from data");
		rs.next();
		rsm=rs.getMetaData();
		System.out.println("df");
		
		 cnt=rsm.getColumnCount();
		 rs.first();
		 	while(rs.next())
		 		rnt++;
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
		
		
	}
	
	public int getRowCount()
	{
		
		return rnt;
	}
	
	public int getColumnCount()
	{
		try
		{
		
		return cnt;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return 0;
	}
	public void fireTableDataChanged()
	{
		try
		{
		cnt=rnt=0;
		st=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		rs=st.executeQuery("select * from data");
		rs.next();
		rsm=rs.getMetaData();
		System.out.println("df");
		
		 cnt=rsm.getColumnCount();
		 rs.first();
		 	while(rs.next())
		 		rnt++;
		 }
		 catch(Exception e)
		 {
		 	e.printStackTrace();
		 }
		 
	}
	
	public Object getValueAt(int r,int c)
	{
		try
		{
		
		if(c==3)
		{
			rs.absolute(r+1);
			
			boolean d=rs.getBoolean(c+1);
			return new Boolean(d);
		}
		
		else
		{
			rs.absolute(r+1);
			return rs.getString(c+1);
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return null;
	}
	
	public boolean isCellEditable(int r,int c)
	{
		return false;
	}
	

	
	
}

class database
{
	
static String		url="jdbc:odbc:ex";
	
}