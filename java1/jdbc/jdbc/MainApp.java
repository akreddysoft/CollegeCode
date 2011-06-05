import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import java.sql.*;
import javax.swing.table.*;
import javax.swing.event.*;

class MainApp
{
	public static void main(String args[])
	{
		new DataBase();
		new SetDriverFrame();
		
	}
}


class MainWindow extends JDialog
{
	private JTable maintable;
	private JScrollPane mainpane;
	private JTextArea recview;
	private JLabel lookup;
	private JTextField lookfield;
	private JButton create,edit,delete;
	private GridBagConstraints gbc=new GridBagConstraints();
	private GridBagLayout gbl;
	private JMenu laf;
	private JMenuBar mainbar;
	private MyModel mm;
	
	private void addwidgets()
	{
		mm=new MyModel();
		maintable=new JTable(mm);
		
		gbc.fill=gbc.NONE;
	//	gbc.anchor=gbc.NORTH;
		buildConstraints(gbc,0,0,2,1,30,30);
		mainpane=new JScrollPane(maintable);
		gbl.setConstraints(mainpane,gbc);
		getContentPane().add(mainpane);
		
		gbc.fill=gbc.NONE;
	//	gbc.anchor=gbc.NORTH;
		buildConstraints(gbc,2,0,2,1,30,0);
		recview =new JTextArea(30,25);
		gbl.setConstraints(recview,gbc);
		getContentPane().add(recview);
		
		gbc.fill=gbc.NONE;
		gbc.anchor=gbc.WEST;
		buildConstraints(gbc,0,1,1,1,0,10);
		lookup=new JLabel("Lookup");
		gbl.setConstraints(lookup,gbc);
		getContentPane().add(lookup);
		
		gbc.fill=gbc.NONE;
		gbc.anchor=gbc.WEST;
		buildConstraints(gbc,1,1,1,1,0,0);
		lookfield=new JTextField(30);
		gbl.setConstraints(lookfield,gbc);
		getContentPane().add(lookfield);
		
		gbc.fill=gbc.NONE;
		gbc.anchor=gbc.WEST;
		buildConstraints(gbc,0,2,1,1,0,10);
		create=new JButton("Create");
		gbl.setConstraints(create,gbc);
		getContentPane().add(create);
		
		gbc.fill=gbc.NONE;
		gbc.anchor=gbc.WEST;
		buildConstraints(gbc,1,2,1,1,0,0);
		edit=new JButton("Edit");
		gbl.setConstraints(edit,gbc);
		getContentPane().add(edit);

		gbc.fill=gbc.NONE;
		gbc.anchor=gbc.CENTER;
		buildConstraints(gbc,1,2,1,1,0,0);
		delete=new JButton("Delete");
		gbl.setConstraints(delete,gbc);
		getContentPane().add(delete);
		
		mainbar=new JMenuBar();
		
		
		JMenu filemenu=new JMenu("File");
		ButtonGroup group=new ButtonGroup();
		JMenu laf=new JMenu("Look and Feel");
	
		filemenu.add(laf);
		JRadioButtonMenuItem javamenu=new JRadioButtonMenuItem("Windows");
		
		
		JRadioButtonMenuItem winmenu=new JRadioButtonMenuItem("Java");
		winmenu.setSelected(true);
		
		JRadioButtonMenuItem motmenu=new JRadioButtonMenuItem("Motif");
	
		group.add(javamenu);
		group.add(winmenu);
		group.add(motmenu);
		
		laf.add(javamenu);
		laf.add(winmenu);
		laf.add(motmenu);
		
		filemenu.add("Exit").addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				System.exit(0);
			}
		});
				
		javamenu.addActionListener(new ActionListener()
		{
			
			public void actionPerformed(ActionEvent e)
			{
				try
				{
				
					String cl=UIManager.getSystemLookAndFeelClassName();				
					UIManager.setLookAndFeel(cl);
					SwingUtilities.updateComponentTreeUI(MainWindow.this);
					pack();
				}
				catch(Exception ee)
				{
					ee.printStackTrace()	;
				}
				
			}
		}) ;
			
			
		winmenu.addActionListener(new ActionListener()
		{
			
			public void actionPerformed(ActionEvent e)
			{
				try
				{
				
					String cl=UIManager.getCrossPlatformLookAndFeelClassName()				;
					UIManager.setLookAndFeel(cl);
					SwingUtilities.updateComponentTreeUI(MainWindow.this);
					pack();
				}
				catch(Exception ee)
				{
					ee.printStackTrace();
				}
				
			}
		}) ;
		
		motmenu.addActionListener(new ActionListener()
		{
			
			public void actionPerformed(ActionEvent e)
			{
				try
				{
										
					String cl="com.sun.java.swing.plaf.motif.MotifLookAndFeel";
					UIManager.setLookAndFeel(cl);
					SwingUtilities.updateComponentTreeUI(MainWindow.this);
					pack();
				}
				catch(Exception ee)
				{
					ee.printStackTrace();
				}
				
			}
		}) ;
		
		mainbar.add(filemenu);
		
		this.setJMenuBar(mainbar);
	
	//	maintable.setSelectionModel(new MyListModel());

		maintable.getSelectionModel().setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		recview.setBackground(Color.GRAY);
		recview.setFont(Font.getFont("Arial"));
		TableColumnModel tcm=maintable.getColumnModel();
		tcm.getColumn(0).setResizable(false);
		
		maintable.getSelectionModel().addListSelectionListener(new ListSelectionListener()
		{
			
			public void valueChanged(ListSelectionEvent e)
			{
				int row=maintable.getSelectedRow();
				if(row==-1)
				{
					 recview.setText("");
					 return ;
				}
				
				String id=(String)maintable.getValueAt(row,0);
				
				try
				{
					Connection con=DriverManager.getConnection(DataBase.getDriverString()[1],DataBase.getDriverString()[3],DataBase.getDriverString()[4]);
					Statement st=con.createStatement();
					st.execute("select id,name,address,telephone,marks1,marks2,marks3 from student where id="+id);
					ResultSet rs=st.getResultSet();
					rs.next();
					int marks1=rs.getInt(5);
					int marks2=rs.getInt(6);
					int marks3=rs.getInt(7);
					int average=(marks1+marks2+marks3)/3;
					recview.setText("Name:" + rs.getString(2)+"\n"+
									"Address: "+rs.getString(3)+"\n"+
									"Telephone: "+rs.getString(4)+"\n"+
									"Marks1: "+marks1+"\n"+
									"Marks2: "+marks2+"\n"+
									"Marks3: "+marks3+"\n"+
									"Average: "+average+"\n");
			
					st.close();
					con.close();
				}
				catch(Exception ee)
				{
					ee.printStackTrace();
				}
			}
			
			
		});
		
		
		create.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				new AddRec(mm,MainWindow.this,false,null);
			}
			
		});
		
		edit.addActionListener(new ActionListener()
		{
			
			public void actionPerformed(ActionEvent e)
			{
				
				int row=maintable.getSelectedRow();
				if(row==-1)	return ;
				
				String id=(String)maintable.getValueAt(row,0);
				
				ResultSet rs=null;
				try
				{
				
					Connection con=DriverManager.getConnection(DataBase.getDriverString()[1],DataBase.getDriverString()[3],DataBase.getDriverString()[4]);
					Statement st=con.createStatement();
					String qr="select * from student where id="+id;
					System.out.println(qr);
					st.execute(qr);
					rs=st.getResultSet();				
					
				}
				catch(Exception ee)
				{
					ee.printStackTrace();
				}
				
				new AddRec(mm,MainWindow.this,true,rs);
			}
			
		});
		
		delete.addActionListener(new ActionListener()
		{
			
			public void actionPerformed(ActionEvent e)
			{
				int row=maintable.getSelectedRow();
				if(row==-1)	return ;
				String id=(String)maintable.getValueAt(row,0);
				
				try
				{
				
					Connection con=DriverManager.getConnection(DataBase.getDriverString()[1],DataBase.getDriverString()[3],DataBase.getDriverString()[4]);
					String qr="delete from student where id="+id;
					Statement st=con.createStatement();
					st.execute(qr);
					System.out.println(qr);
					con.close();								
				}
				catch(Exception ee)
				{
					ee.printStackTrace();
				}
				mm.GetData();
				mm.fireTableDataChanged();
			
				
			}
		});
		
		recview.setEditable(false);
	}
	
	
	MainWindow()
	{
		try
		{
			
			Connection con=DriverManager.getConnection(DataBase.getDriverString()[1],DataBase.getDriverString()[3],DataBase.getDriverString()[4]);
			Statement st=con.createStatement();
			boolean df=st.execute("create table student(id int primary key,name text,address text,telephone text,marks1 int,marks2 int,marks3 int)");
			System.out.println(df);
			st.close();
			con.close();
		}
		catch(Exception e)
		{
			//e.printStackTrace();
			
		}
		
		gbl=new GridBagLayout();
		getContentPane().setLayout(gbl);
		setTitle("Address Book");
		addwidgets();
		pack();
		setVisible(true);
	}
	
	private void buildConstraints(GridBagConstraints gbc, int gx, int gy,  int gw, int gh, int wx, int wy) 
	{
	    gbc.gridx = gx;
	    gbc.gridy = gy;
	    gbc.gridwidth = gw;
	    gbc.gridheight = gh;
	    gbc.weightx = wx;
	    gbc.weighty = wy;
  	}
}

class AddRec extends JDialog
{
	private JLabel name,address,telephone;
	private JTextField namef,addf,telf,marks1,marks2,marks3;
	private JButton OK,cancel;
	private GridBagLayout gbl=new GridBagLayout();
	private GridBagConstraints gbc=new GridBagConstraints();

	private MyModel mm;
	private boolean update;	
	private int updateindex;
	private String  updateid;
	private ResultSet updateset;
	AddRec(MyModel mm,Dialog owner,boolean update,ResultSet rs)
	{
		
		super(owner,true);

		this.mm=mm;
		this.updateset=rs;
		this.update=update;
			
		addwidgets();
		
		getContentPane().setLayout(gbl);

		pack();
		
		if(update==true)
		{
			try
			{
				
				rs.next();
				this.updateid=rs.getString("id");
				namef.setText(rs.getString("name"));
				addf.setText(rs.getString("address"));
				telf.setText(rs.getString("telephone"));
				marks1.setText(rs.getString("marks1"));
				marks2.setText(rs.getString("marks2"));
				marks3.setText(rs.getString("marks3"));
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		
		setVisible(true);
		
	}
	
	private void addwidgets()
	{
		gbc.fill=gbc.NONE;
		name=new JLabel("Name");
		Layout.buildConstraints(this,gbl,name,gbc,0,0,1,1,30,10);
		
		gbc.fill=gbc.NONE;
		namef=new JTextField(30);
		Layout.buildConstraints(this,gbl,namef,gbc,1,0,1,1,70,0);
		
		gbc.fill=gbc.NONE;
		address=new JLabel("Address");
		Layout.buildConstraints(this,gbl,address,gbc,0,1,1,1,0,10);
		
		gbc.fill=gbc.NONE;
		addf=new JTextField(30);
		Layout.buildConstraints(this,gbl,addf,gbc,1,1,1,1,0,0);
		
		gbc.fill=gbc.NONE;
		telephone=new JLabel("Telephone");
		Layout.buildConstraints(this,gbl,telephone,gbc,0,2,1,1,0,10);
		
		gbc.fill=gbc.NONE;
		telf=new JTextField(30);
		Layout.buildConstraints(this,gbl,telf,gbc,1,2,1,1,0,0);
		
		gbc.fill=gbc.NONE;
		Layout.buildConstraints(this,gbl,new JLabel("Marks1"),gbc,0,3,1,1,0,10);
		
		gbc.fill=gbc.NONE;
		marks1=new JTextField(30);
		Layout.buildConstraints(this,gbl,marks1,gbc,1,3,1,1,0,0);
		
		gbc.fill=gbc.NONE;
		Layout.buildConstraints(this,gbl,new JLabel("Marks2"),gbc,0,4,1,1,0,10);
		
		gbc.fill=gbc.NONE;
		marks2=new JTextField(30);
		Layout.buildConstraints(this,gbl,marks2,gbc,1,4,1,1,0,0);

		gbc.fill=gbc.NONE;
		Layout.buildConstraints(this,gbl,new JLabel("Marks3"),gbc,0,5,1,1,0,10);
		
		gbc.fill=gbc.NONE;
		marks3=new JTextField(30);
		Layout.buildConstraints(this,gbl,marks3,gbc,1,5,1,1,0,0);
		
		gbc.fill=gbc.NONE;
		gbc.anchor=GridBagConstraints.WEST;
		OK=new JButton("OK");
		Layout.buildConstraints(this,gbl,OK,gbc,1,6,1,1,0,10);
		
		gbc.fill=gbc.NONE;
		gbc.anchor=GridBagConstraints.CENTER;
		cancel=new JButton("Cancel");
		Layout.buildConstraints(this,gbl,cancel,gbc,1,6,1,1,0,10);
	
		OK.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)	
			{
				String name=namef.getText();
				if(name.equals("") || marks1.getText().equals("") ||marks2.getText().equals("") || marks3.getText().equals(""))
				{
					JOptionPane.showMessageDialog(null,"Cannot Add/update null","Address Book",JOptionPane.ERROR_MESSAGE);
					return ;
				}
				if(addf.getText().equals(""))
					addf.setText("-");
				if(telf.getText().equals(""))
					telf.setText("-");
					
				if(update==false)	
				{
					try
					{
						Connection con=DriverManager.getConnection(DataBase.getDriverString()[1],DataBase.getDriverString()[3],DataBase.getDriverString()[4]);
						Statement st=con.createStatement();
						boolean df=st.execute("select max(id) from student");
						ResultSet rs=st.getResultSet();
						rs.next();
						int nextid=rs.getInt(1);
						
						nextid++;
						String qr="insert into student values("+nextid+",'"+namef.getText()+"','"+ addf.getText()+"','"+ telf.getText()+"',"+marks1.getText()+","+marks2.getText()+","+marks3.getText()+")";
						System.out.println(qr);
						df=st.execute(qr);
						
						st.close();
						con.close();
					}
					catch(Exception ee)
					{
						ee.printStackTrace();
						JOptionPane.showMessageDialog(null,ee.getMessage(),"JDBC",JOptionPane.ERROR_MESSAGE);
					}
				}
				else
				{
					
					try
					{
					
						Connection con=DriverManager.getConnection(DataBase.getDriverString()[1],DataBase.getDriverString()[3],DataBase.getDriverString()[4]);
						Statement st=con.createStatement();
						String qr="update student set name='"+name+"',address='"+addf.getText()+"',telephone='"+telf.getText()+"',marks1="+marks1.getText()+",marks2="+marks2.getText()+",marks3="+marks3.getText()+" where id="+updateid;
						System.out.println(qr);
						st.execute(qr);
						con.close();
						st.close();
					}
					catch(Exception ee)
					{
						ee.printStackTrace();
					}
				}
			
				mm.GetData();
				mm.fireTableDataChanged();
			
				AddRec.this.setVisible(false);
			
			}
			
			
		});
		
		
		telf.addKeyListener(new NumKeys());

		
		cancel.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				AddRec.this.setVisible(false);
			}
		});
	
	}
	
}


class Layout
{
	/*static void buildConstraints(JDialog win,GridBagLayout gbl,Component cmp, GridBagConstraints gbc, int gx, int gy,  int gw, int gh, int wx, int wy) 
	{
	    gbc.gridx = gx;
	    gbc.gridy = gy;
	    gbc.gridwidth = gw;
	    gbc.gridheight = gh;
	    gbc.weightx = wx;
	    gbc.weighty = wy;
	    gbl.setConstraints(cmp,gbc);
	    win.getContentPane().add(cmp);
	    
  	}*/
  	static void buildConstraints(Window win,GridBagLayout gbl,Component cmp, GridBagConstraints gbc, int gx, int gy,  int gw, int gh, int wx, int wy) 
	{
	    gbc.gridx = gx;
	    gbc.gridy = gy;
	    gbc.gridwidth = gw;
	    gbc.gridheight = gh;
	    gbc.weightx = wx;
	    gbc.weighty = wy;
	    gbl.setConstraints(cmp,gbc);
	    if(win.getClass()==AddRec.class )
	    {
	    	JDialog jd=(JDialog)win;
	    	jd.getContentPane().add(cmp);	
	    }
	    else
	    {
	    	JFrame jd=(JFrame)win;
	    	jd.getContentPane().add(cmp);
	    }
	    
	    
  	}

}


class NumKeys extends  KeyAdapter
{

			public void keyPressed(KeyEvent e)
			{
				if(e.getKeyChar()<'0'&&e.getKeyChar()>'9')
					e.consume();
			}
			
}
		