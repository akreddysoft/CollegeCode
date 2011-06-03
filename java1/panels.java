import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
//import javax.swing.
class madhur
{
	public static void main(String args[])
	{
		new myframe();
	}
}

class myframe
{
	JFrame md;
	GridBagLayout gbl=new GridBagLayout();
	GridBagConstraints gbc=new GridBagConstraints();
	JButton c,e,d;
	myframe()
	{
		md=new JFrame();
		//md.getContentPane().setLayout();
		JButton a=new JButton("Dffd");
		JButton c=new JButton("Dffd1");
		JButton e=new JButton("Dffd2");
		JButton d=new JButton("Dffd3");
		JPanel md1=new JPanel(gbl);
		ButtonGroup bg=new ButtonGroup();
		final JRadioButton br=new JRadioButton("Windows",false);
		final JRadioButton br1=new JRadioButton("java",false);
		final JRadioButton br2=new JRadioButton("motif",false);
		JTextField madhur=new JTextField(4);
		madhur.add(a);

		bg.add(br);
		bg.add(br1);
		bg.add(br2);

		final JComboBox combo=new JComboBox(new DefaultComboBoxModel());
		combo.addItem("madhur");
		combo.addItem(new Boolean(true));
		combo.setEditable(true);
		
		
	
		combo.addActionListener(new ActionListener()
		{
			
			public void actionPerformed(ActionEvent e)
			{
				System.out.println(combo.getSelectedItem());
				
				
			}
		});
			String data[]={"madhur","ahuja","sdsd","dd"
		};
		
		JList mylist=new JList(data);
		
	
		gbc.fill=gbc.NONE;

		Layout.buildConstraints(md1,gbl,a,gbc,0,0,1,1,50,50);
		Layout.buildConstraints(md1,gbl,c,gbc,1,0,1,1,50,0);
				
		Layout.buildConstraints(md1,gbl,e,gbc,0,1,1,1,0,50);
		Layout.buildConstraints(md1,gbl,d,gbc,1,1,1,1,0,0);
		
		Layout.buildConstraints(md1,gbl,br,gbc,0,2,1,1,0,0);
		Layout.buildConstraints(md1,gbl,br1,gbc,1,2,1,1,0,0);
		Layout.buildConstraints(md1,gbl,br2,gbc,2,2,1,1,0,0);
		
		Layout.buildConstraints(md1,gbl,madhur,gbc,3,0,1,1,0,0);
		Layout.buildConstraints(md1,gbl,combo,gbc,0,4,1,1,0,0);
		Layout.buildConstraints(md1,gbl,mylist,gbc,1,4,1,1,0,0);
		
		md.getContentPane().add(md1);
		md1.setBorder(BorderFactory.createTitledBorder("dfdf"));
			
		a.setBorder(BorderFactory.createTitledBorder("hello madhur"));
		
		md.pack();
		a.setMnemonic(KeyEvent.VK_5);
		
	
		
		a.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				JFileChooser a=new JFileChooser()		;
				a.setMultiSelectionEnabled(true);
				a.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
				a.showOpenDialog(null);
				try
				{
				
				System.out.println(a.getSelectedFile().getCanonicalPath());
				}
				catch(Exception ee)
				{
					ee.printStackTrace();
				}
				
				//a.show(true);
				
				
			}
		});
		
		md.setVisible(true);
		
	
	}
	
}


class Layout
{
	
  	static void buildConstraints(JPanel win,GridBagLayout gbl,Component cmp, GridBagConstraints gbc, int gx, int gy,  int gw, int gh, int wx, int wy) 
	{
	    gbc.gridx = gx;
	    gbc.gridy = gy;
	    gbc.gridwidth = gw;
	    gbc.gridheight = gh;
	    gbc.weightx = wx;
	    gbc.weighty = wy;
	    gbl.setConstraints(cmp,gbc);
	 
	    JPanel jd=(JPanel)win;
	    jd.add(cmp);
	}

}
