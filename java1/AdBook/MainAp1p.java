import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import java.io.*;
import javax.swing.table.*;

import javax.swing.event.*;

class MainApp
{
	public static void main(String args[])
	{
		MainWindow mw=new MainWindow();
		mw.setDefaultCloseOperation(JDialog.EXIT_ON_CLOSE);
		
		mw.show();
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
	
	private MyFile mf;
	private MyModel mm;
	
	private void addwidgets()
	{
		mm=new MyModel(mf);
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
					//String cl="com.sun.java.swing.plaf.motif.MotifLookAndFeel";
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
				
					//String cl=UIManager.getCrossPlatformLookAndFeelClassName()				;
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
				String name=(String)mm.getValueAt(row,0);
				
				ObjectInputStream ois=mf.getReader();
				int count=0;
				
				if(ois==null)	return;
				
				MyData data;
				Object obj1=null;

				while(true)
				{
					try
					{
						obj1=ois.readObject();
					}
					catch(EOFException ee)
					{
						System.out.println("eof2 reached");
						break;
					}
					catch(Exception ee)
					{
						ee.printStackTrace();
						break;
					}
					
					
					if(obj1 instanceof Null)
					{
						try
						{
							ois=new ObjectInputStream(mf.br);
							obj1=ois.readObject();
						}
						catch(EOFException ee)
						{
							System.out.println("eof3 reached");
							break;
						}
						catch(Exception ee)
						{
							ee.printStackTrace();
							break;
						}
						
					}
					count++;
					String str[]=obj1.toString().split(":");
		 			if(str[0].equals(name))
		 			{
		 				mf.close();	//this is very important, dont 
		 				//new AddRec(mf,mm,count,new MyData(str[0],str[1],str[2]));
		 				recview.setText(str[0]+"\nAddress: "+str[1]+"\nTelephone: "+str[2]);
		 				break;

		 			}
				}
				
			}
			
			
		});
		
		
		create.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				new AddRec(mf,mm,MainWindow.this,"Add Record",true);
				System.out.println(MainWindow.this);
			
			}
			
		});
		
		edit.addActionListener(new ActionListener()
		{
			
			public void actionPerformed(ActionEvent e)
			{
				int row=maintable.getSelectedRow();
				if(row==-1)	return ;
				
				String name=(String)mm.getValueAt(row,0);
				ObjectInputStream ois=mf.getReader();
				int count=0;

				
				if(ois==null)	return;
				
				MyData data;
				Object obj1=null;

				while(true)
				{
					try
					{
						obj1=ois.readObject();
					}
					catch(EOFException ee)
					{
						System.out.println("eof2 reached");
						break;
					}
					catch(Exception ee)
					{
						ee.printStackTrace();
						break;
					}
					
					
					if(obj1 instanceof Null)
					{
						try
						{
							ois=new ObjectInputStream(mf.br);
							obj1=ois.readObject();
						}
						catch(EOFException ee)
						{
							System.out.println("eof3 reached");
							break;
						}
						catch(Exception ee)
						{
							ee.printStackTrace();
							break;
						}
						
					}
					count++;
					String str[]=obj1.toString().split(":");
		 			if(str[0].equals(name))
		 			{
		 				mf.close();	//this is very important, dont 
		 				new AddRec(mf,mm,count,new MyData(str[0],str[1],str[2]));
		 				break;

		 			}
				}			
			}
			
		});
		
		delete.addActionListener(new ActionListener()
		{
			
			public void actionPerformed(ActionEvent e)
			{
				int row=maintable.getSelectedRow();
				if(row==-1)	return ;
				
				String name=(String)mm.getValueAt(row,0);
				ObjectInputStream ois=mf.getReader();
				MyFile mf1=new MyFile("madhur1.txt");
				
				if(ois==null)	return;
				
				MyData data;
				Object obj1=null;
				ObjectOutputStream oos1=mf1.getWriter();
				while(true)
				{
					try
					{
						obj1=ois.readObject();
					}
					catch(EOFException ee)
					{
						System.out.println("eof2 reached");
						break;
						
					}
					catch(Exception ee)
					{
						ee.printStackTrace();
						break;
					}
					
					
					if(obj1 instanceof Null)
					{
						try
						{
							ois=new ObjectInputStream(mf.br);
							obj1=ois.readObject();
						}
						catch(EOFException ee)
						{
							System.out.println("eof3 reached");
							break;
						}
						catch(Exception ee)
						{
							ee.printStackTrace();
							break;
						}
						
					}
					
					String str[]=obj1.toString().split(":");
		 			if(str[0].equals(name))
		 				continue;
		 			else
		 			{
		 				try
		 				{	
		 					oos1.writeObject(obj1);
		 					System.out.println(obj1);
		 				}
		 				catch(Exception ee)
		 				{
		 					ee.printStackTrace();
		 				}
		 			}
				}
				try
				{
				
					oos1.writeObject(new Null());
				
				}
				catch(Exception ee)
				{
					ee.printStackTrace();
					
				}
				mf1.close();		
				mf.close();		
				
				File f1=new File("madhur.txt");
								
				boolean res=f1.delete();
				if(res==false)
				{
					JOptionPane.showMessageDialog(null,"Fatal error:Delete","Address Book",JOptionPane.ERROR_MESSAGE);
				}
					
					
				File f2=new File("madhur1.txt");
				res=f2.renameTo(f1);
				if(res==false)
				{
					JOptionPane.showMessageDialog(null,"Fatal error:Rename","Address Book",JOptionPane.ERROR_MESSAGE);
				}
					
				mm.GetData();
				mm.fireTableDataChanged();
				
			}
		});
		
		recview.setEditable(false);
	}
	
	
	MainWindow()
	{
		gbl=new GridBagLayout();
		getContentPane().setLayout(gbl);
		setSize(800,600);
		mf=new MyFile("madhur.txt");
		setVisible(true);
		setTitle("Address Book");
		addwidgets();
		pack();
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
	private JTextField namef,addf,telf;
	private JButton OK,cancel;
	private GridBagLayout gbl=new GridBagLayout();
	private GridBagConstraints gbc=new GridBagConstraints();
	private MyFile mf;
	private MyModel mm;
	private boolean update;	
	private int updateindex;
	
	AddRec(MyFile mf,MyModel mm,Dialog owner,String title,boolean modal)
	{
		
		super(owner,title,modal);
		System.out.println("df");
		this.mm=mm;
		this.mf=mf;
		setSize(500,300);
		addwidgets();
		
		getContentPane().setLayout(gbl);
	
		validate();
		pack();
		update=false;
		setVisible(true);
		
	}
	
	AddRec(MyFile mf,MyModel mm,int index,MyData md)
	{
		
		getContentPane().setLayout(gbl);
		addwidgets();
		
		String fields[]=md.toString().split(":");
		this.namef.setText(fields[0]);
		this.addf.setText(fields[1]);
		this.telf.setText(fields[2]);
		setVisible(true);
		getContentPane().setLayout(gbl);
		pack();
		
		update=true;
		this.mm=mm;
		this.mf=mf;
		this.updateindex=index;
		
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
		gbc.anchor=GridBagConstraints.WEST;
		
		OK=new JButton("OK");
		Layout.buildConstraints(this,gbl,OK,gbc,1,3,1,1,0,10);
		
		gbc.fill=gbc.NONE;
		gbc.anchor=GridBagConstraints.CENTER;
		cancel=new JButton("Cancel");
		Layout.buildConstraints(this,gbl,cancel,gbc,1,3,1,1,0,10);
	
		OK.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)	
			{
				String name=namef.getText();
				if(name.equals(""))
				{
					JOptionPane.showMessageDialog(null,"Cannot Add/update null","Address Book",JOptionPane.ERROR_MESSAGE);
					return ;
				}
				if(addf.getText().equals(""))
					addf.setText("-");
				if(telf.getText().equals(""))
					telf.setText("-");
					
				MyData md=new MyData(name,addf.getText(),telf.getText());
				if(update==false)
				{
				
					try
					{
						
						ObjectOutputStream oos=mf.getWriter();
				
						oos.writeObject(md)	;
						oos.writeObject(new Null());
						mf.close();	
					}
					catch(Exception ee)
					{
						ee.printStackTrace();
					}
					
				
				}
				else
				{
							//updating code 
					ObjectInputStream ois=mf.getReader();
					MyFile mf1=new MyFile("madhur1.txt");
					
					if(ois==null)	return;
					int count=0;
					MyData data;
					Object obj1=null;
					ObjectOutputStream oos1=mf1.getWriter();
					while(true)
					{
						try
						{
							obj1=ois.readObject();
						}
						catch(EOFException ee)
						{
							System.out.println("eof2 reached");
							break;
						
						}
						catch(Exception ee)
						{
							ee.printStackTrace();
							break;
						}
						
						
						if(obj1 instanceof Null)
						{
							try
							{
								ois=new ObjectInputStream(mf.br);
								obj1=ois.readObject();
							}
							catch(EOFException ee)
							{
								System.out.println("eof3 reached");
								break;
							}
							catch(Exception ee)
							{
								ee.printStackTrace();
								break;
							}
							
						}
						count++;
					
			 			if(count==updateindex)
			 			{
			 				try
			 				{
			 				
			 					oos1.writeObject(new MyData(namef.getText(),addf.getText(),telf.getText()));	
			 				}
			 				catch(Exception ee)
			 				{
			 					ee.printStackTrace();
			 				}
			 				
			 			}
			 			
			 			else
			 			{
			 				try
			 				{	
			 					oos1.writeObject(obj1);
			 					System.out.println(obj1);
			 				}
			 				catch(Exception ee)
			 				{
			 					ee.printStackTrace();
			 				}
			 			}
					}
					try
					{
					
						oos1.writeObject(new Null());
					}
					catch(Exception ee)
					{
						ee.printStackTrace();
						
					}
					mf1.close();		
					mf.close();		
					File f1=new File("madhur.txt");
					boolean res=f1.delete();
					if(res==false)
					{
						JOptionPane.showMessageDialog(null,"Fatal error:Delete","Address Book",JOptionPane.ERROR_MESSAGE);
					}
					
					
					File f2=new File("madhur1.txt");
					res=f2.renameTo(f1);
					if(res==false)
					{
						JOptionPane.showMessageDialog(null,"Fatal error:Rename","Address Book",JOptionPane.ERROR_MESSAGE);
					}
					
					
				}
			
				mm.GetData();
				mm.fireTableDataChanged();
			
				AddRec.this.setVisible(false);
			
			}
			
			
		});
		
		
		telf.addKeyListener(new KeyAdapter()
		{
			public void keyPressed(KeyEvent e)
			{
				if(e.getKeyChar()<'0'&&e.getKeyChar()>'9')
					e.consume();
			}
			
		});
		
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
	public static void buildConstraints(JDialog win,GridBagLayout gbl,Component cmp, GridBagConstraints gbc, int gx, int gy,  int gw, int gh, int wx, int wy) 
	{
	    gbc.gridx = gx;
	    gbc.gridy = gy;
	    gbc.gridwidth = gw;
	    gbc.gridheight = gh;
	    gbc.weightx = wx;
	    gbc.weighty = wy;
	    gbl.setConstraints(cmp,gbc);
	    win.getContentPane().add(cmp);
	    
  	}
}

