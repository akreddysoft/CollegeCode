import javax.swing.*;
import javax.swing.event.*;
import java.awt.event.*;
import java.awt.*;
import java.net.*;
import java.io.*;


class mainapp implements ActionListener
{
	private JFrame mainframe;
	private JPanel mainpanel,scanpanel;
	private GridBagLayout gbc;
	private GridBagConstraints constraints;
	private JTextField to,server,from;
	private JTextArea body,result;
    private JButton send,resserv,resdomfrom,resdomto;
    private JLabel lfrom,lto,lserver,lbody,lresult;
    private JTextField iphost,ipfrom,ipto;
    
    private JLabel lfromip,ltoip,lport;
    private JTextField fromip,toip,port;
    private JTextArea scanresult;
    private JScrollPane scanpane;
    private JTable restable;
    private JButton scanip,savelog;
    private JButton abortscan,brutemail,abortbrute;
    private tablemodel tabmod;
    private static boolean abortscanflag;
    private final static String LOOKANDFEEL = null;
	static void  creategui()
	{
	
       mainapp myapp=new mainapp();   
	}
	
	
	mainapp()
	{
		abortscanflag=false;
		gbc=new GridBagLayout();
		constraints = new GridBagConstraints(); 
	
		JFrame.setDefaultLookAndFeelDecorated(true);
		try
		{
			String str=UIManager.getSystemLookAndFeelClassName();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		mainframe =new JFrame("Mail send");
        mainframe.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        mainframe.getContentPane().setLayout(new GridLayout(0,1));
        
		mainpanel=new JPanel(gbc);
	    scanpanel=new JPanel(gbc);
	    
 		addwidgets();
 		addwidgets1();
 	    addlisten();
 	    
        mainframe.getContentPane().add(mainpanel);
		mainframe.getContentPane().add(scanpanel);
   		
        mainframe.pack();
        
        mainframe.setVisible(true);
      	mainframe.pack();
   	
	}
	
	private static void initLookAndFeel() {
        String lookAndFeel = null;

        if (LOOKANDFEEL != null) {
            if (LOOKANDFEEL.equals("Metal")) {
                lookAndFeel = UIManager.getCrossPlatformLookAndFeelClassName();
            } else if (LOOKANDFEEL.equals("System")) {
                lookAndFeel = UIManager.getSystemLookAndFeelClassName();
            } else if (LOOKANDFEEL.equals("Motif")) {
                lookAndFeel = "com.sun.java.swing.plaf.motif.MotifLookAndFeel";
            } else if (LOOKANDFEEL.equals("GTK+")) { //new in 1.4.2
                lookAndFeel = "com.sun.java.swing.plaf.gtk.GTKLookAndFeel";
            } else {
                System.err.println("Unexpected value of LOOKANDFEEL specified: "
                                   + LOOKANDFEEL);
                lookAndFeel = UIManager.getCrossPlatformLookAndFeelClassName();
            }

            try {
                UIManager.setLookAndFeel(lookAndFeel);
            } catch (ClassNotFoundException e) {
                System.err.println("Couldn't find class for specified look and feel:"
                                   + lookAndFeel);
                System.err.println("Did you include the L&F library in the class path?");
                System.err.println("Using the default look and feel.");
            } catch (UnsupportedLookAndFeelException e) {
                System.err.println("Can't use the specified look and feel ("
                                   + lookAndFeel
                                   + ") on this platform.");
                System.err.println("Using the default look and feel.");
            } catch (Exception e) {
                System.err.println("Couldn't get specified look and feel ("
                                   + lookAndFeel
                                   + "), for some reason.");
                System.err.println("Using the default look and feel.");
                e.printStackTrace();
            }
        }
    }

	private void addwidgets()
	{
		from=new JTextField(20);
		body=new JTextArea(5,30);
		to=new JTextField(20);
		server=new JTextField(20);
		send=new JButton("Send");
		result=new JTextArea(6,45);
		lfrom=new JLabel("From:");
		lbody=new JLabel("Body:");
		lto=new JLabel("To:");
		lserver=new JLabel("Server:");
		lresult=new JLabel("Result:");
		iphost=new JTextField(10);
		ipfrom=new JTextField(10);
		ipto=new JTextField(10);
		JScrollPane bodypane=new JScrollPane(body);
		resserv=new JButton("DNS Lookup/Reverse DNS Lookup");
		resdomfrom=new JButton("Resolve domain");
		resdomto=new JButton("Resolve domain");
				
		from.addActionListener(this);
		to.addActionListener(this);
		server.addActionListener(this);
	//	send.addActionListener(this);
		resserv.addActionListener(this);
		resdomfrom.addActionListener(this);
		resdomto.addActionListener(this);
		
		
		from.getDocument().addDocumentListener(new MyDocumentListener(from,to,server,send));
		server.getDocument().addDocumentListener(new MyDocumentListener(from,to,server,send));
		to.getDocument().addDocumentListener(new MyDocumentListener(from,to,server,send));
	
	////////////column 0 ///////////////////////
		constraints.fill=constraints.NONE;
		constraints.anchor = GridBagConstraints.EAST;
		buildConstraints(constraints,0,0,1,1,10,30);
		gbc.setConstraints(lfrom, constraints);
		mainpanel.add(lfrom);
		
		constraints.anchor = GridBagConstraints.EAST;
		constraints.fill=constraints.NONE;
		buildConstraints(constraints,0,1,1,1,0,30);
		gbc.setConstraints(lto, constraints);
		mainpanel.add(lto);
		
		constraints.anchor = GridBagConstraints.EAST;
		constraints.fill=constraints.NONE;
		buildConstraints(constraints,0,2,1,1,0,30);
		gbc.setConstraints(lserver, constraints);
		mainpanel.add(lserver);
	
		constraints.anchor = GridBagConstraints.NORTHEAST ;
		constraints.fill=constraints.NONE;
		buildConstraints(constraints,0,3,1,1,0,30);
		gbc.setConstraints(lbody, constraints);
		mainpanel.add(lbody);
		
		constraints.anchor = GridBagConstraints.NORTHEAST;
		constraints.fill=constraints.NONE;
		buildConstraints(constraints,0,5,1,1,0,30);
		gbc.setConstraints(lresult, constraints);
		mainpanel.add(lresult);
	
	//////////////////////////column 1 /////////////////
		constraints.fill = GridBagConstraints.NONE;
		constraints.anchor = GridBagConstraints.WEST;
		buildConstraints(constraints,1,0,1,1,40,0);
		gbc.setConstraints(from, constraints);
		mainpanel.add(from);
		
		constraints.fill = GridBagConstraints.NONE;
		constraints.anchor = GridBagConstraints.WEST;
		buildConstraints(constraints,1,1,1,1,0,0);
		gbc.setConstraints(to, constraints);
		mainpanel.add(to);
		
		constraints.fill = GridBagConstraints.NONE;
		constraints.anchor = GridBagConstraints.WEST;
		buildConstraints(constraints,1,3,1,1,0,0);
		gbc.setConstraints(bodypane, constraints);
		mainpanel.add(bodypane);
		
		constraints.fill = GridBagConstraints.NONE;
		constraints.anchor = GridBagConstraints.WEST;
		buildConstraints(constraints,1,2,1,1,0,0);
		gbc.setConstraints(server, constraints);
		mainpanel.add(server);

		constraints.fill = GridBagConstraints.NONE;
        constraints.anchor = GridBagConstraints.WEST;
		buildConstraints(constraints,1,4,1,1,0,0);
		gbc.setConstraints(send, constraints);
		mainpanel.add(send);
		
		constraints.anchor = GridBagConstraints.WEST;
		constraints.fill = GridBagConstraints.NONE;
		buildConstraints(constraints,1,5,1,1,0,0);
		gbc.setConstraints(result, constraints);
		mainpanel.add(result);
		
		//////////////////mid columns
		constraints.anchor = GridBagConstraints.CENTER;
		constraints.fill = GridBagConstraints.NONE;
		buildConstraints(constraints,1,0,2,1,0,0);
		gbc.setConstraints(resdomfrom, constraints);
		mainpanel.add(resdomfrom);
		
		constraints.anchor = GridBagConstraints.CENTER;
		constraints.fill = GridBagConstraints.NONE;
		buildConstraints(constraints,1,1,2,1,0,0);
		gbc.setConstraints(resdomto, constraints);
		mainpanel.add(resdomto);
		
		constraints.anchor = GridBagConstraints.CENTER;
		constraints.fill = GridBagConstraints.NONE;
		buildConstraints(constraints,1,2,2,1,0,0);
		gbc.setConstraints(resserv, constraints);
		mainpanel.add(resserv);
		
		////////////////column 2
		constraints.fill = GridBagConstraints.NONE;
		constraints.anchor = GridBagConstraints.WEST;
		buildConstraints(constraints,2,2,1,1,40,0);
		gbc.setConstraints(iphost, constraints);
		mainpanel.add(iphost);
		
		constraints.fill = GridBagConstraints.NONE;
		constraints.anchor = GridBagConstraints.WEST;
		buildConstraints(constraints,2,0,1,1,0,0);
		gbc.setConstraints(ipfrom, constraints);
		mainpanel.add(ipfrom);
		
		constraints.fill = GridBagConstraints.NONE;
		constraints.anchor = GridBagConstraints.WEST;
		buildConstraints(constraints,2,1,1,1,0,0);
		gbc.setConstraints(ipto, constraints);
		mainpanel.add(ipto);
		
		send.setEnabled(false);
		result.setEditable(false);
		result.setBackground(Color.BLACK);
		result.setForeground(Color.WHITE);
		iphost.setHorizontalAlignment(JTextField.CENTER);
		ipfrom.setEnabled(false);
		ipto.setEnabled(false);
		iphost.setEnabled(false);	
		
	}
	
	private void addlisten()
	{
		
		send.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				new mailit();
			}
			
		});
		
		
		savelog.addActionListener(new ActionListener()
		{
			
			public void actionPerformed(ActionEvent e)
			{
				
				FileDialog fd=new FileDialog(mainframe,"Save File");
				System.out.println("fdf");
				fd.setMode(FileDialog.SAVE);
				fd.setVisible(true);
				
				String fname=fd.getFile();
				if(fname==null)	
					return ;
				String path = fd.getDirectory()+fd.getFile();
				try
				{
					PrintWriter pw=new PrintWriter(new FileOutputStream(path));
					pw.println(scanresult.getText());
					pw.close();
				}
				catch(FileNotFoundException ee)
				{
						JOptionPane.showMessageDialog(null,"Cannot resolve hostname","Mail",JOptionPane.ERROR_MESSAGE);
				}
				
				
			}
		});
		
		scanip.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				
				fromip.setEnabled(false);
				toip.setEnabled(false);
				scanip.setEnabled(false);
				port.setEnabled(false);
				abortscan.setEnabled(true);
			
				scanit scan=new scanit();
				try
				{
				
					scan.join();
				}
				catch(InterruptedException ee)
				{
					ee.printStackTrace();
				}
				
				port.setEnabled(true);
				fromip.setEnabled(true);
				toip.setEnabled(true);
				scanip.setEnabled(true);
				abortscan.setEnabled(false);
				
			}
		});
		
		abortscan.addActionListener(new ActionListener()
		{
			
			public void actionPerformed(ActionEvent e)
			{
				mainapp.this.abortscanflag=true;
			}
		});
		
	}


	private void addwidgets1()	
	{
		lfromip=new JLabel("From:");
		ltoip=new JLabel("To:");
		lport =new JLabel("Port");
		scanresult=new JTextArea(5,30);
		scanpane=new JScrollPane(scanresult);
		fromip=new JTextField(9);
		toip=new JTextField(9);
		port=new JTextField(5);
		JLabel lscanlog=new JLabel("Scan Log");
		tabmod=new tablemodel();
		restable=new JTable(tabmod);
		JScrollPane resultpane=new JScrollPane(restable);
		scanip=new JButton("Start Scan");
		savelog=new JButton("Save Log");
		abortscan=new JButton("Abort Scan");
		brutemail=new JButton("Start Bruteforcing");
		abortbrute=new JButton("Abort");
		
		fromip.getDocument().addDocumentListener(new iptextlistener(fromip,toip,scanip));
		toip.getDocument().addDocumentListener(new iptextlistener(fromip,toip,scanip));
				
		constraints.fill=constraints.NONE;
		constraints.anchor = GridBagConstraints.EAST;
		buildConstraints(constraints,0,0,1,1,10,33);
		gbc.setConstraints(lfromip,constraints);
		scanpanel.add(lfromip);
		
		constraints.fill=constraints.NONE;
		constraints.anchor = GridBagConstraints.EAST;
		buildConstraints(constraints,0,1,1,1,0,33);
		gbc.setConstraints(ltoip,constraints);
		scanpanel.add(ltoip);
		
		constraints.fill=constraints.NONE;
		constraints.anchor = GridBagConstraints.EAST;
		buildConstraints(constraints,0,3,1,1,0,33);
		gbc.setConstraints(lscanlog,constraints);
		scanpanel.add(lscanlog);
	
		//////////////////////column 1///////////////
		constraints.fill = GridBagConstraints.NONE;
		constraints.anchor = GridBagConstraints.WEST;
		buildConstraints(constraints,1,0,1,1,50,0);
		gbc.setConstraints(fromip,constraints);
		scanpanel.add(fromip);
		
		constraints.fill = GridBagConstraints.NONE;
		constraints.anchor = GridBagConstraints.WEST;
		buildConstraints(constraints,1,1,1,1,0,0);
		gbc.setConstraints(toip,constraints);
		scanpanel.add(toip);
		
		constraints.fill = GridBagConstraints.NONE;
		constraints.anchor = GridBagConstraints.WEST;
		buildConstraints(constraints,1,2,1,1,0,0);
		gbc.setConstraints(scanip,constraints);
		scanpanel.add(scanip);
		
		constraints.fill = GridBagConstraints.NONE;
		constraints.anchor = GridBagConstraints.EAST;
		buildConstraints(constraints,1,2,1,1,0,0);
		gbc.setConstraints(abortscan,constraints);
		scanpanel.add(abortscan);
		
		
				
		constraints.fill=constraints.NONE;
		constraints.anchor = GridBagConstraints.WEST;
		buildConstraints(constraints,1,3,2,1,0,0);
		gbc.setConstraints(scanpane,constraints);
		scanpanel.add(scanpane);
		
		constraints.fill = GridBagConstraints.NONE;
		constraints.anchor = GridBagConstraints.WEST;
		buildConstraints(constraints,1,4,1,1,0,0);
		gbc.setConstraints(savelog,constraints);
		scanpanel.add(savelog);

		/////////////////////////column 2///////////////////
		constraints.fill = GridBagConstraints.NONE;
		constraints.anchor = GridBagConstraints.WEST;
		buildConstraints(constraints,2,0,1,1,60,0);
		gbc.setConstraints(lport,constraints);
		scanpanel.add(lport);
		
		constraints.fill = GridBagConstraints.NONE;
		constraints.anchor = GridBagConstraints.CENTER;
		buildConstraints(constraints,2,0,1,1,0,0);
		gbc.setConstraints(port,constraints);
		scanpanel.add(port);
		
		/////////////////////column 3 /////////////
		constraints.fill=constraints.NONE;
		constraints.anchor = GridBagConstraints.NORTHWEST;
		buildConstraints(constraints,3,0,1,4,50,0);
		gbc.setConstraints(resultpane,constraints);
		scanpanel.add(resultpane);
		
		constraints.fill=constraints.NONE;
		constraints.anchor = GridBagConstraints.WEST;
		buildConstraints(constraints,3,4,1,4,50,0);
		gbc.setConstraints(brutemail,constraints);
		scanpanel.add(brutemail);
		
		constraints.fill=constraints.NONE;
		constraints.anchor = GridBagConstraints.CENTER;
		buildConstraints(constraints,3,4,1,4,50,0);
		gbc.setConstraints(abortbrute,constraints);
		scanpanel.add(abortbrute);

		
		restable.setPreferredScrollableViewportSize(new Dimension(500, 250));
		port.setText("25");
		scanresult.setEditable(false);
		abortscan.setEnabled(false);
		brutemail.setEnabled(false);
		abortbrute.setEnabled(false);
		Box.createHorizontalBox();
		
	}
	
	
	public static void main(String args[])
	{
		
		javax.swing.SwingUtilities.invokeLater(new Runnable() {
   	 	public void run()
     	{
    		creategui();
        
    	}

	});


	}
	
	public void actionPerformed(ActionEvent e)
	{
		
			if(e.getSource()==resserv||e.getSource()==resdomfrom||e.getSource()==resdomto)
			{
				try
				{
					String host="";
					int index;
					if(e.getSource()==resserv)
					{	
						host=server.getText();
						if(host.equals(""))
						{
							JOptionPane.showMessageDialog(null,"Please supply hostname","Mail",JOptionPane.WARNING_MESSAGE);							
							server.setText("");
							return ;
						}
						InetAddress add=InetAddress.getByName(host);
						iphost.setText(add.getHostAddress()+" [ "+add.getHostName()+" ]");
						iphost.setColumns(add.getHostAddress().length()+add.getHostName().length());
				
						mainframe.validate();
					}
					else if(e.getSource()==resdomfrom)
					{
						host=from.getText();
						
						if(host.equals(""))
						{
							JOptionPane.showMessageDialog(null,"Please supply hostname","Mail",JOptionPane.WARNING_MESSAGE);							
							fromip.setText("");
							return ;
						}
						
						index=host.indexOf("@");
						host=host.substring(index+1);
						InetAddress add=InetAddress.getByName(host);
						ipfrom.setText(add.getHostAddress());
						System.out.println(host);
						
					}
					else if(e.getSource()==resdomto)
					{	
						host=to.getText();
						if(host.equals(""))
						{
							JOptionPane.showMessageDialog(null,"Please supply hostname","Mail",JOptionPane.WARNING_MESSAGE);							
							toip.setText("");
							return ;
						}
						
						index=host.indexOf("@");
						host=host.substring(index+1);
						InetAddress add=InetAddress.getByName(host);
						ipto.setText(add.getHostAddress());
						System.out.println(host);					
					}

				}
				catch(UnknownHostException ee)
				{
					JOptionPane.showMessageDialog(null,"Cannot resolve hostname","Mail",JOptionPane.ERROR_MESSAGE);
				}
			}
		
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

	class mailit extends Thread
	{
		private Socket smtpsocket;
		private String host;
		private InetAddress add;
		private PrintWriter pw;
		private BufferedReader br;
		public void run() 
		{
		
			try
			{
				smtpsocket=new Socket();
				System.out.println(add);
				smtpsocket.connect(new InetSocketAddress(add,Integer.valueOf(port.getText()).intValue()));
				br=new BufferedReader(new InputStreamReader(smtpsocket.getInputStream()));
				pw=new PrintWriter(new OutputStreamWriter(smtpsocket.getOutputStream()));
		
				pw.println("Helo mad");
				pw.println("mail from :"+from.getText());
				pw.println("rcpt to:"+to.getText());
				pw.println("data");
				pw.flush();
				pw.println(body.getText());
				pw.println(".");
				pw.flush();
				
				result.setText("");
				while(true)
				{
					
					String line=br.readLine();
					if(line==null) break;
					result.append(line+"\n");
					System.out.println(line);
					
				}
			
				smtpsocket.close();
			
			}
			
			catch(IOException e)
			{
				e.printStackTrace();
				result.setText(e.getMessage());
				JOptionPane.showMessageDialog(null,"Error during connection","Mail",JOptionPane.ERROR_MESSAGE);			
			}
		}
		
		mailit()
		{
			try
			{
				add=InetAddress.getByName(server.getText());
				iphost.setText(add.getHostAddress());
				
				start();	
			}
			catch(UnknownHostException e)
			{
				JOptionPane.showMessageDialog(null,"Cannot resolve hostname","Mail",JOptionPane.ERROR_MESSAGE);
			}
			
		}
	
	}

	class scanit extends Thread
	{
		private InetAddress start,stop;
		private byte [] rawipstart,rawipstop;
		private Socket smtpsocket;		
		
		private void cleartabledata()
		{
			int i;
			for( i=0;i<255;++i)
         	{
         		tabmod.data[i][0]="";
         				//return only scanned number of row
         	}
		}
		
		public void run()
		{
			
		
			smtpsocket=new Socket();
			rawipstart=start.getAddress();
			rawipstop=stop.getAddress();
			System.out.println(rawipstart[0]);
				//		System.out.println(rawipstart);
			String host=null;
			int i=0; 
			int rawipst,rawipsp;
			rawipst=(int)rawipstart[3]&0xff;
			rawipsp=(int)rawipstop[3]&0xff;
			System.out.println(rawipstart[3] + "df " +rawipstop[3]);
			System.out.println(rawipst + "fd " +rawipsp);
			
			while(rawipst<=rawipsp)
			{
				System.out.println(rawipst + "fd " +rawipsp);
				if( mainapp.abortscanflag==true)	return ;
				try
				{
					host=InetAddress.getByName(fromip.getText()).getHostName();
					smtpsocket.connect(new InetSocketAddress(start,25));
					smtpsocket.close();
					scanresult.append("Connecting to : " + start.getHostAddress()+"\n");
					scanresult.append("Performing reverse DNS : " + InetAddress.getByName(fromip.getText()).getHostName() + " \n");
					scanresult.append("Succussful connect : port open\n");
					tabmod.data[i][2]=new Boolean(true);
					//add table cod	
				}
									
				catch(IOException e)
				{
					
					System.out.println("port not open for " + start);
					scanresult.append("Connection to : "+ start.getHostAddress()+" failed\n");
					tabmod.data[i][2]=new Boolean(false);
					
				}
			
				finally
				{
					
					tabmod.data[i][0]=start.getHostAddress();
					tabmod.data[i][1]=host;
					tabmod.data[i][3]=new Boolean(true);
					i++;
					tabmod.fireTableDataChanged();
					rawipstart[3]++;
					rawipst++;
					try
					{
						start=InetAddress.getByAddress(rawipstart);
					}
					catch(IOException e)
					{
						e.printStackTrace()	;
					
					}
				
				}
			}
			
		}
		
		scanit()
		{
			
			try
			{
			
				start=InetAddress.getByName(fromip.getText());
				stop=InetAddress.getByName(toip.getText());
				scanresult.setText("");
				cleartabledata();
				this.start();
			}
			
			catch(UnknownHostException e)
			{
				JOptionPane.showMessageDialog(null,"Cannot resolve hostname : " + e.toString(),"Mail",JOptionPane.ERROR_MESSAGE);
				System.out.println(e.getMessage());
				
			}
			
		}
	
	}

}




