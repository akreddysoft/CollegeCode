import javax.swing.*;
import javax.swing.event.*;

import java.awt.*;

import java.awt.event.*;
import java.sql.*;
import java.io.*;
import java.util.*;
import java.net.*;
import sun.net.smtp.SmtpClient;


public class ComMan extends JFrame implements ActionListener,ListSelectionListener,MouseListener
{
	TransferNames ht;
	Container c;
	JTabbedPane tp;
	JPanel jpInbox,jpEmail,jpMobile,jpIms,jpIms1,jpCon,jpLog,jpReg;
	JScrollPane jscpInboxLst,jscpInbox2,jscpEmp,jscpEmail1,jscpIms,jscpIms1,jscpEmpLst,jscpConLstEmp,jscpConLstInv;
	JButton jbEmailSend,jbEmailForward,jbEmailAttachment,jbMobileSend,jbImsSendF,jbImsSendF1,jbExit;
	JButton jbImsSend,jbImsSend1,jbImsB,jbImsB1,jbImsI,jbImsI1,jbImsU,jbImsU1,jbConAdd,jbConRem,jbConInv,jbConCancel;
	JLabel jlEmp,jlEmailTo,jlEmailCc,jlEmailBcc,jlEmailSubject,jlMobileTo,jlThanks;
	JLabel jlMobileSms,jlMobileIm,jlConHost,jlConMess,jlLstEmp,jlLstInv;
	JTextField jtEmailTo,jtEmailCc,jtEmailBcc,jtEmailSubject,jtMobileTo;
	JTextField jtMobileSms,jtIms,jtIms1,jtConHost,jtConMess;
	JTextArea jtaInbox1,jtaInbox2,jtaEmp,jtaEmailMessage,jtaIms,jtaIms1;
	JTable jtbInbox1;
	JList jlstConEmp,jlstConInv,jlstInboxLst,jlstEmpLst,jlstConLstEmp,jlstConLstInv;
	JList jlOnlineUser,jlOnlineUser1;
	JScrollPane jspOnlineUser,jspOnlineUser1;
	DefaultComboBoxModel dcmInboxLst,dcmEmpLst,dcmConLstEmp,dcmConLstInv;
	ImageIcon imMobile;
	String s, LName;
	Socket clientSoc;		
	String msg[];
	String message[];
	Hashtable hChatWindow=new Hashtable();
	JLabel jlRegLogin,jlRegPass,jlRegCPass,jlRegName,jlRegSName,jlRegGrade;
	JLabel jlRegDept,jlRegRepto,jlRegAdd,jlRegTel,jlRegMob,jlRegEmail,jlRegDOB;
	JTextField jtRegLogin,jtRegName,jtRegSName,jtRegGrade;
	JTextField jtRegDept,jtRegRepto,jtRegAdd,jtRegTel,jtRegMob,jtRegEmail,jtRegDOB;
	JPasswordField jtRegPass,jtRegCPass;
	JButton jbRegSave,jbRegCancel,jbRegReset;
///////////////////    Class Constructor  //////////////////////////////
    public ComMan(String name)
    {
		super(name);
		try
		{
			clientSoc=new Socket("localhost",5555);
			LName=name;
			PrintWriter pw=new PrintWriter(clientSoc.getOutputStream(),true);
			pw.println(LName);
			ObjectInputStream os=new ObjectInputStream(clientSoc.getInputStream());
			ht=(TransferNames)os.readObject();
			new ReceiveMessage(this);
			setComMan();
			this.addWindowListener(new WindowAdapter()
									{
										public void windowClosing(WindowEvent we)
										{
											System.exit(0);
										}
									});
			
		}
		catch(Exception e)
		{
			System.out.println(e+"HERE");
		}
	}
/////////////////Login Name to access messages from Message table ///////
             
			public void setLoginName(String LNametemp)
	        {
			    LName=LNametemp;
			    System.out.println("+++++"+LName);
         	}

            public String getLoginName()
	        {
			    return LName;
	        }
    	
////////////////////////////////////////////////////////////////////////////////////////////////
	public  void setComMan()
	{
      try
      {
		  	   	
///////////////////   Container & TabbedPane ///////////////////////
            c=getContentPane();   
	        tp=new JTabbedPane();
	 	    tp.setBounds(40,40,520,450);
//////////////////        Inbox           ///////////////////////////////// 
			jpInbox=new JPanel();
			jpInbox.setLayout(null);
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection con=DriverManager.getConnection("Jdbc:Odbc:ComManDsn");
			PreparedStatement st=con.prepareStatement("select * from mail where to=?",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			st.setString(1,LName);
			ResultSet rs=st.executeQuery();
			int x=0;
			while(rs.next())
			{
				x++;
			}
			rs.beforeFirst();
			msg=new String[x];
			message=new String[x];
			x=0;
			while(rs.next())
			{
				msg[x]=rs.getString(5);
				message[x]=rs.getString(6);
				x++;
			}
			dcmInboxLst=new DefaultComboBoxModel(msg);
			jlstInboxLst=new JList (dcmInboxLst);
	   	    jlstInboxLst.setBounds(20,50,320,200);
	        jscpInboxLst=new JScrollPane(jlstInboxLst,jscpInboxLst.VERTICAL_SCROLLBAR_ALWAYS,jscpInboxLst.HORIZONTAL_SCROLLBAR_ALWAYS);
		    jscpInboxLst.setBounds(20,50,320,200);
			jlstInboxLst.addListSelectionListener(this);
			jpInbox.add(jscpInboxLst);

			jtaInbox2=new JTextArea();
	   	    jtaInbox2.setBounds(20,255,320,150);
	        jscpInbox2=new JScrollPane(jtaInbox2,jscpInbox2.VERTICAL_SCROLLBAR_ALWAYS,jscpInbox2.HORIZONTAL_SCROLLBAR_ALWAYS);
		    jscpInbox2.setBounds(20,255,320,150);
			jtaInbox2.setEditable(false);
			jpInbox.add(jscpInbox2);
			
			jlEmp=new JLabel("  List  of  Employees");
			jlEmp.setBounds(370,40,120,30);
			jpInbox.add(jlEmp);
/////////////////////////////////////////////////

            dcmEmpLst=new DefaultComboBoxModel();
   		    dcmEmpLst.addElement(s);
			Object oa1[]=new Object[ht.str.length];
			int countnamesa1=0;
			while(countnamesa1<ht.str.length)
			{
				oa1[countnamesa1]=ht.str[countnamesa1];
				countnamesa1++;
			}

			jlstEmpLst=new JList (oa1);
	   	    jlstEmpLst.setBounds(370,80,120,320);
	        jscpEmpLst=new JScrollPane(jlstEmpLst,jscpEmpLst.VERTICAL_SCROLLBAR_ALWAYS,jscpEmpLst.HORIZONTAL_SCROLLBAR_ALWAYS);
		    jscpEmpLst.setBounds(370,80,120,320);
			jpInbox.add(jscpEmpLst);

      	
/////////////////////////////////
			tp.addTab("  Inbox  ",jpInbox);
			
///////////////////////////////////////////////////////////////////////////	   
////////////////////        E-Mail        //////////////////////////////////		
			jpEmail=new JPanel();
			jpEmail.setLayout(null);
			
			jlEmailTo=new JLabel("To");
			jlEmailTo.setBounds(35,50,50,25);
			jpEmail.add(jlEmailTo);
			jlEmailCc=new JLabel("Cc");
			jlEmailCc.setBounds(35,85,50,25);
			jpEmail.add(jlEmailCc);
			jlEmailBcc=new JLabel("Bcc");
			jlEmailBcc.setBounds(35,120,50,25);
			jpEmail.add(jlEmailBcc);
			jlEmailSubject=new JLabel("Subject");
			jlEmailSubject.setBounds(35,155,50,25);
			jpEmail.add(jlEmailSubject);

			jtEmailTo=new JTextField();
			jtEmailTo.setBounds(95,50,240,25);
			jpEmail.add(jtEmailTo);
			jtEmailCc=new JTextField();
			jtEmailCc.setBounds(95,85,240,25);
			jpEmail.add(jtEmailCc);
			jtEmailBcc=new JTextField();
			jtEmailBcc.setBounds(95,120,240,25);
			jpEmail.add(jtEmailBcc);
			jtEmailSubject=new JTextField();
			jtEmailSubject.setBounds(95,155,240,25);
			jpEmail.add(jtEmailSubject);

			jtaEmailMessage=new JTextArea();
	   	    jtaEmailMessage.setBounds(20,200,320,150);
	        jscpEmail1=new JScrollPane(jtaEmailMessage,jscpEmail1.VERTICAL_SCROLLBAR_ALWAYS,jscpEmail1.HORIZONTAL_SCROLLBAR_ALWAYS);
		    jscpEmail1.setBounds(20,200,320,150);
			jpEmail.add(jscpEmail1);

			jbEmailSend=new JButton("Send");
			jbEmailSend.setBounds(20,365,80,30);
			jpEmail.add(jbEmailSend);
			jbEmailForward=new JButton("Forward");
			jbEmailForward.setBounds(110,365,100,30);
			//jpEmail.add(jbEmailForward);
			jbEmailAttachment=new JButton("Attachment");
			jbEmailAttachment.setBounds(220,365,120,30);
			//jpEmail.add(jbEmailAttachment);
			
			jlEmp=new JLabel("  List  of  Employees");
			jlEmp.setBounds(370,40,120,30);
			jpEmail.add(jlEmp);

			 dcmEmpLst=new DefaultComboBoxModel();
   		    dcmEmpLst.addElement(s);
   			Object o2[]=new Object[ht.str.length];
			int countnames2=0;
			while(countnames2<ht.str.length)
			{
				o2[countnames2]=ht.str[countnames2];
				countnames2++;
			}

			jlstEmpLst=new JList (o2);
	   	    jlstEmpLst.setBounds(370,80,120,320);
	        jscpEmpLst=new JScrollPane(jlstEmpLst,jscpEmpLst.VERTICAL_SCROLLBAR_ALWAYS,jscpEmpLst.HORIZONTAL_SCROLLBAR_ALWAYS);
		    jscpEmpLst.setBounds(370,80,120,320);
			jpEmail.add(jscpEmpLst);

			tp.addTab("   E-Mail  ",jpEmail);

			jbEmailSend.addActionListener(this);
	        
////////////////////////////////////////////////////////////////////////////
/////////////////////       Mobile        ///////////////////////////////////
			jpMobile=new JPanel();
			jpMobile.setLayout(null);

			imMobile=new ImageIcon("C:\\jdk1.4\\Material\\CFGANI.GIF");
			jlMobileIm=new JLabel();
			jlMobileIm.setBounds(50,50,240,100);
			jlMobileIm.setIcon(imMobile);
			jpMobile.add(jlMobileIm);

			jlMobileTo=new JLabel("To");
			jlMobileTo.setBounds(70,160,50,25);
			jpMobile.add(jlMobileTo);
			jlMobileSms=new JLabel("Maximum 160 Characters");
			jlMobileSms.setBounds(110,215,200,25);
			jpMobile.add(jlMobileSms);

			jtMobileTo=new JTextField();
			jtMobileTo.setBounds(120,160,180,30);
			jpMobile.add(jtMobileTo);
			jtMobileSms=new JTextField();
			jtMobileSms.setBounds(50,250,270,100);
			jpMobile.add(jtMobileSms);

			jbMobileSend=new JButton("Send");
			jbMobileSend.setBounds(150,360,70,30);
			jbMobileSend.addActionListener(this);
			
			jpMobile.add(jbMobileSend);


            jlEmp=new JLabel("  List  of  Employees");
			jlEmp.setBounds(370,40,120,30);
			jpMobile.add(jlEmp);

		    dcmEmpLst=new DefaultComboBoxModel();
   		    dcmEmpLst.addElement(s);
			Object o3[]=new Object[ht.str.length];
			int countnames3=0;
			while(countnames3<ht.str.length)
			{
				o3[countnames3]=ht.str[countnames3];
				countnames3++;
			}
			jlstEmpLst=new JList (o3);
	   	    jlstEmpLst.setBounds(370,80,120,320);
	        jscpEmpLst=new JScrollPane(jlstEmpLst,jscpEmpLst.VERTICAL_SCROLLBAR_ALWAYS,jscpEmpLst.HORIZONTAL_SCROLLBAR_ALWAYS);
		    jscpEmpLst.setBounds(370,80,120,320);
			jpMobile.add(jscpEmpLst);

			tp.addTab("  Mobile  ",jpMobile);

			
////////////////////////////////////////////////////////////////////////////
/////////////////////         IMS           ///////////////////////////////////
			jpIms=new JPanel();
			jpIms.setLayout(null);

			jtaIms=new JTextArea();
			jtaIms.setBounds(30,100,430,150);
			jtaIms.setEditable(false);
			jscpIms=new JScrollPane(jtaIms,jscpIms.VERTICAL_SCROLLBAR_ALWAYS,jscpIms.HORIZONTAL_SCROLLBAR_ALWAYS);
			jscpIms.setBounds(30,100,300,274);
			jpIms.add(jscpIms);

			jbImsSendF=new JButton("Send File");
			jbImsSendF.setBounds(30,50,100,40);
			jpIms.add(jbImsSendF);
			jbImsB=new JButton("B");
			jbImsB.setBounds(30,270,45,40);
			//jpIms.add(jbImsB);
			jbImsI=new JButton("I");
			jbImsI.setBounds(95,270,45,40);
			//jpIms.add(jbImsI);
			jbImsU=new JButton("U");
			jbImsU.setBounds(160,270,45,40);
			//jpIms.add(jbImsU);
			jtIms=new JTextField();
			jtIms.setBounds(30,327,300,37);
			//jpIms.add(jtIms);

			jbImsSend=new JButton("Send");
			jbImsSend.setBounds(150,380,70,40);
			//jpIms.add(jbImsSend);

			Object o[]=new Object[ht.str.length];
			int countnames=0;
			while(countnames<ht.str.length)
			{
				o[countnames]=ht.str[countnames];
				countnames++;
			}
			jlOnlineUser=new JList(o);
			jspOnlineUser=new JScrollPane(jlOnlineUser);
			jspOnlineUser.setBounds(350,100,100,274);
			jpIms.add(jspOnlineUser);
			jbImsSend.addActionListener(this);
			jlOnlineUser.addMouseListener(this);
			tp.addTab(" IMS ",jpIms);
			
//////////////////////////////////////////////////////////////////////
////////////////////        Conference     /////////////////////////
			jpCon=new JPanel();
			jpCon.setLayout(null);

			jlConHost=new JLabel("Host");
			jlConHost.setBounds(120,50,50,20);
			jpCon.add(jlConHost);
			jtConHost=new JTextField();
			jtConHost.setBounds(170,50,170,25);
			jpCon.add(jtConHost);
				
			jlLstEmp=new JLabel("List of Employees");
			jlLstEmp.setBounds(70,100,150,20);
			jpCon.add(jlLstEmp);
			jlLstInv=new JLabel("Invitation List");
			jlLstInv.setBounds(345,100,150,20);
			jpCon.add(jlLstInv);

		
			jlConMess=new JLabel("Message");
			jlConMess.setBounds(100,310,80,20);
			jpCon.add(jlConMess);
			jtConMess=new JTextField();
			jtConMess.setBounds(170,310,170,25);
			jpCon.add(jtConMess);

			jbConAdd=new JButton(">>");
			jbConAdd.setBounds(210,130,90,30);
			jpCon.add(jbConAdd);
			jbConRem=new JButton("<<");
			jbConRem.setBounds(210,250,90,30);
			jpCon.add(jbConRem);

			jbConInv=new JButton("Invite");
			jbConInv.setBounds(50,350,80,40);
			jpCon.add(jbConInv);
			jbConCancel=new JButton("Cancel");
			jbConCancel.setBounds(380,350,80,40);
			jpCon.add(jbConCancel);


            dcmConLstEmp=new DefaultComboBoxModel();
   		    dcmConLstEmp.addElement(s);
			jlstConLstEmp=new JList (dcmConLstEmp);
	   	    jlstConLstEmp.setBounds(50,130,120,150);
	        jscpConLstEmp=new JScrollPane(jlstConLstEmp,jscpConLstEmp.VERTICAL_SCROLLBAR_ALWAYS,jscpConLstEmp.HORIZONTAL_SCROLLBAR_ALWAYS);
		    jscpConLstEmp.setBounds(50,130,120,150);
			jpCon.add(jscpConLstEmp);


			dcmConLstInv=new DefaultComboBoxModel();
   		    dcmConLstInv.addElement(s);
			jlstConLstInv=new JList (dcmConLstInv);
	   	    jlstConLstInv.setBounds(340,130,120,150);
	        jscpConLstInv=new JScrollPane(jlstConLstInv,jscpConLstInv.VERTICAL_SCROLLBAR_ALWAYS,jscpConLstInv.HORIZONTAL_SCROLLBAR_ALWAYS);
		    jscpConLstInv.setBounds(340,130,120,150);
			jpCon.add(jscpConLstInv);
			
	//		jlstConEmp=new JList();
//			jlstConEmp.setBounds(50,130,120,150);
		//	jpCon.add(jlstConEmp);
	//		jlstConInv=new JList();
	//		jlstConInv.setBounds(340,130,120,150);
	//		jpCon.add(jlstConInv);

			
//			tp.addTab("Conference",jpCon);
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////new Confrence///////////////////////////////////////////////////////////////////////////////////
			jpIms1=new JPanel();
			jpIms1.setLayout(null);

			jtaIms1=new JTextArea();
			jtaIms1.setEditable(false);
			jtaIms1.setAutoscrolls(true);
			jtaIms1.setBounds(30,100,430,150);
			jscpIms1=new JScrollPane(jtaIms1,jscpIms1.VERTICAL_SCROLLBAR_ALWAYS,jscpIms1.HORIZONTAL_SCROLLBAR_ALWAYS);
			jscpIms1.setAutoscrolls(true);
			jscpIms1.setBounds(30,100,300,150);
			jpIms1.add(jscpIms1);

			jbImsSendF1=new JButton("Send File");
			jbImsSendF1.setBounds(30,50,100,40);
			jpIms1.add(jbImsSendF1);
			jbImsB1=new JButton("B");
			jbImsB1.setBounds(30,270,45,40);
			jpIms1.add(jbImsB1);
			jbImsI1=new JButton("I");
			jbImsI1.setBounds(95,270,45,40);
			jpIms1.add(jbImsI1);
			jbImsU1=new JButton("U");
			jbImsU1.setBounds(160,270,45,40);
			jpIms1.add(jbImsU1);
			jtIms1=new JTextField();
			jtIms1.setBounds(30,327,300,37);
			jpIms1.add(jtIms1);

			jbImsSend1=new JButton("Send");
			jbImsSend1.setBounds(150,380,70,40);
			jpIms1.add(jbImsSend1);

			Object o1[]=new Object[ht.str.length];
			int countnames1=0;
			while(countnames1<ht.str.length)
			{
				o1[countnames1]=ht.str[countnames1];
				countnames1++;
			}
			jlOnlineUser1=new JList(o);
			jspOnlineUser1=new JScrollPane(jlOnlineUser1);
			jspOnlineUser1.setBounds(350,100,100,264);
			jpIms1.add(jspOnlineUser1);
			jbImsSend1.addActionListener(this);
			
			tp.addTab("Conference",jpIms1);

//////////////////////////////////////////////////////////////////////////////////
/////////////////////////////Registration//////////////////////////////
			jpReg=new JPanel();
			jpReg.setLayout(null);
			jlRegLogin=new JLabel("Login ID:");
			jlRegLogin.setBounds(20,30,100,20);
			jpReg.add(jlRegLogin);
			jlRegPass=new JLabel("Password:");
			jlRegPass.setBounds(20,60,100,20);
			jpReg.add(jlRegPass);
			jlRegCPass=new JLabel("Re-Type Password");
			jlRegCPass.setBounds(20,90,100,20);
			jpReg.add(jlRegCPass);
			jlRegName=new JLabel("Name:");
			jlRegName.setBounds(20,120,100,20);
			jpReg.add(jlRegName);
			jlRegSName=new JLabel("Surname:");
			jlRegSName.setBounds(290,120,100,20);
			jpReg.add(jlRegSName);
			jlRegGrade=new JLabel("Grade:");
			jlRegGrade.setBounds(20,150,100,20);
			jpReg.add(jlRegGrade);
			jlRegDept=new JLabel("Department:");
			jlRegDept.setBounds(20,180,100,20);
			jpReg.add(jlRegDept);
			jlRegRepto=new JLabel("Reporting to:");
			jlRegRepto.setBounds(290,180,100,20);
			jpReg.add(jlRegRepto);
			jlRegAdd=new JLabel("Address:");
			jlRegAdd.setBounds(20,210,100,20);
			jpReg.add(jlRegAdd);
			jlRegTel=new JLabel("Telephone No:");
			jlRegTel.setBounds(20,240,100,20);
			jpReg.add(jlRegTel);
			jlRegMob=new JLabel("Mobile No:");
			jlRegMob.setBounds(290,240,100,20);
			jpReg.add(jlRegMob);
			jlRegEmail=new JLabel("E-Mail:");
			jlRegEmail.setBounds(20,270,100,20);
			jpReg.add(jlRegEmail);
			jlRegDOB=new JLabel("Date of Birth:");
			jlRegDOB.setBounds(20,300,100,20);
			jpReg.add(jlRegDOB);

			jtRegLogin=new JTextField();
			jtRegLogin.setBounds(130,30,100,20);
			jpReg.add(jtRegLogin);
			jtRegPass=new JPasswordField();
			jtRegPass.setBounds(130,60,100,20);
			jpReg.add(jtRegPass);
			jtRegCPass=new JPasswordField();
			jtRegCPass.setBounds(130,90,100,20);
			jpReg.add(jtRegCPass);
			jtRegName=new JTextField();
			jtRegName.setBounds(130,120,100,20);
			jpReg.add(jtRegName);
			jtRegSName=new JTextField();
			jtRegSName.setBounds(400,120,100,20);
			jpReg.add(jtRegSName);
			jtRegGrade=new JTextField();
			jtRegGrade.setBounds(130,150,100,20);
			jpReg.add(jtRegGrade);
			jtRegDept=new JTextField();
			jtRegDept.setBounds(130,180,100,20);
			jpReg.add(jtRegDept);
			jtRegRepto=new JTextField();
			jtRegRepto.setBounds(400,180,100,20);
			jpReg.add(jtRegRepto);
			jtRegAdd=new JTextField();
			jtRegAdd.setBounds(130,210,100,20);
			jpReg.add(jtRegAdd);
			jtRegTel=new JTextField();
			jtRegTel.setBounds(130,240,100,20);
			jpReg.add(jtRegTel);
			jtRegMob=new JTextField();
			jtRegMob.setBounds(400,240,100,20);
			jpReg.add(jtRegMob);
			jtRegEmail=new JTextField();
			jtRegEmail.setBounds(130,270,100,20);
			jpReg.add(jtRegEmail);
			jtRegDOB=new JTextField();
			jtRegDOB.setBounds(130,300,100,20);
			jpReg.add(jtRegDOB);


			jbRegSave=new JButton("Save");
			jbRegSave.setBounds(20,350,70,50);
			jpReg.add(jbRegSave);
			jbRegCancel=new JButton("Cancel");
			jbRegCancel.setBounds(110,350,70,50);
			//jpReg.add(jbRegCancel);
			jbRegReset=new JButton("Reset");
			jbRegReset.setBounds(200,350,70,50);
			jpReg.add(jbRegReset);
			jbRegSave.addActionListener(this);
			jbRegCancel.addActionListener(this);
			jbRegReset.addActionListener(this);
			
			tp.addTab("Register",jpReg);
//////////////////////////////////////////////////////////////////////
///////////////////           Logout        ////////////////////////
			jpLog=new JPanel();
			jpLog.setLayout(null);
			JLabel jlTejas =  new JLabel("=> Tejas Patel");
			JLabel jlBhumik =  new JLabel("=> Bhumik Patel");
			JLabel jlMayank =  new JLabel("=> Mayank Dev Mishra");
			JLabel jlBhavdeep =  new JLabel("=> Bhavdeep Jani");
			jlThanks=new JLabel("Project By :-");
			jbExit=new JButton("Exit");

			jlThanks.setBounds(25,50,550,35);
			jlTejas.setBounds(100,70,500,35);
			jlBhumik.setBounds(100,90,500,35);
			jlMayank.setBounds(100,110,500,35);
			jlBhavdeep.setBounds(100,130,500,35);

			jbExit.setBounds(250,350,150,25);

			jpLog.add(jlTejas);
			jpLog.add(jlBhumik);
			jpLog.add(jlMayank);
			jpLog.add(jlBhavdeep);
			jpLog.add(jbExit);
			jpLog.add(jlThanks);
			jbExit.setMnemonic(KeyEvent.VK_E);
			jbExit.addActionListener(this);
			tp.addTab("Logout",jpLog);
///////////////////////////////////////////////////////////////////////////

///////////////////      Size  //////////////////////////////////////////
			c.add(tp);
			c.setLayout(null);
	        setSize(600,550);
	        setVisible(true);
////////////////////////////////////////////////////////////////////////
		
      }
      catch(Exception e2)
      {
      	System.out.println(e2);
      }
		
    }
	public void valueChanged(ListSelectionEvent e) 
	{
		if(e.getSource()==jlstInboxLst)
		{
			int i=jlstInboxLst.getSelectedIndex();
			jtaInbox2.setText(message[i]);
		}
	}
	public void actionPerformed(ActionEvent e1)
    {
    	try
    	{

		    	if(e1.getSource()==jbExit)
		    	{
					System.exit(0);
				}

		    	if(e1.getSource()==jbImsSend)
		    	{
					String recpient=((String)jlOnlineUser.getSelectedValue()).trim();
					if(hChatWindow.get(recpient.trim())==null)
					{
						PersonalChatWindow pn=new PersonalChatWindow(this,recpient,clientSoc.getOutputStream());
						hChatWindow.put(recpient,pn);
					}
				/*	ObjectOutputStream ois=new ObjectOutputStream(clientSoc.getOutputStream());
					if(recpient!=null && !recpient.trim().equals(""))
					{
						InstantMessage im=new InstantMessage(LName,recpient,jtIms.getText().trim()+".");
						jtaIms.append(LName+" : "+jtIms.getText().trim()+"\n");
						ois.writeObject(im);
					}*/
				}
				if(e1.getSource()==jbImsSend1)
		    	{
					try
					{
						ObjectOutputStream ois=new ObjectOutputStream(clientSoc.getOutputStream());
						InstantMessage im=new InstantMessage(LName,"all",jtIms1.getText().trim()+".");
						//jtaIms1.append(LName+" : "+jtIms1.getText().trim()+"\n");
						ois.writeObject(im);
						jtIms1.setText("");
						jtaIms1.setCaretPosition(jtaIms1.getText().length());
					}
					catch(Exception e)
					{
						System.out.println(e);
					}
				}
				if(e1.getSource()==jbEmailSend)
		    	{
					try
					{
						try
						{
							SmtpClient client = new SmtpClient("localhost.com");
							client.from(LName);
							client.to(jtEmailTo.getText()+","+jtEmailCc.getText()+","+jtEmailBcc.getText());
							PrintStream message = client.startMessage();
							message.println("To: "+jtEmailTo.getText()+","+jtEmailCc.getText()+","+jtEmailBcc.getText());
							message.println("From: "+LName);
							message.println("Content-Type: text/html");
							message.println("To: "+jtEmailTo.getText()+","+jtEmailCc.getText()+","+jtEmailBcc.getText());
							message.println("From: "+LName);
							message.println("Subject: "+jtEmailSubject.getText());
							message.println("");
							message.println(jtaEmailMessage.getText());
							client.closeServer();
						}
						catch(Exception e)
						{
							System.out.println(e);
						}
						Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
						Connection con=DriverManager.getConnection("Jdbc:Odbc:ComManDsn");
						PreparedStatement st=con.prepareStatement("insert into mail values(?,?,?,?,?,?)",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
						st.setString(1,jtEmailTo.getText());
						st.setString(2,jtEmailBcc.getText());
						st.setString(3,jtEmailCc.getText());
						st.setString(4,LName);
						st.setString(5,jtEmailSubject.getText());
						st.setString(6,jtaEmailMessage.getText());			
						st.executeUpdate();
						st.close();
						con.close();
					}
					catch(Exception e)
					{
						System.out.println("ERROR SENDING EMAIL:"+e);
					}
				}
				if(e1.getSource()==jbMobileSend)
				{
					String str=jtMobileTo.getText().trim();
					str=str.substring(0,4);
					String email=jtMobileTo.getText().trim()+ReturnMobileEmail(str);	
					if(ReturnMobileEmail(str).equals(""))
					{
						JOptionPane.showMessageDialog(null,"The Mobile Service provider \n des not have this facility");
					}
					else
					{
						try
						{
							SmtpClient client = new SmtpClient("localhost");
							client.from(LName);
							client.to(email);
							PrintStream message = client.startMessage();
							message.println("To: "+email);
							message.println("From: "+LName);
							message.println("Content-Type: text/html");
							message.println("To: "+email);
							message.println("From: "+LName);
							message.println("Subject: "+jtMobileSms.getText());
							message.println("");
							message.println(jtaEmailMessage.getText());
							client.closeServer();
							JOptionPane.showMessageDialog(null,"Your SMS Has been Send");
						}
						catch(Exception e)
						{
							System.out.println(e);
						}
					}
				}
				if(e1.getSource()==jbRegReset)
				{
					jtRegLogin.setText("");
					jtRegPass.setText("");
					jtRegCPass.setText("");
					jtRegName.setText("");
					jtRegSName.setText("");
					jtRegGrade.setText("");
					jtRegDept.setText("");
					jtRegRepto.setText("");
					jtRegAdd.setText("");
					jtRegTel.setText("");
					jtRegMob.setText("");
					jtRegEmail.setText("");
					jtRegDOB.setText("");
				}
				if(e1.getSource()==jbRegSave)
				{
					try
					{
						Socket clientSoc=new Socket("localhost",4444);
						PrintWriter pw=new PrintWriter(clientSoc.getOutputStream(),true);
						String loginString=jtRegLogin.getText().trim()+":"+jtRegPass.getText().trim();
						pw.println(loginString);
						BufferedReader buf=new BufferedReader(new InputStreamReader(clientSoc.getInputStream()));
						String ss=buf.readLine();
						if((ss+"").trim().equalsIgnoreCase("LoggedIn") || (ss+"").trim().equalsIgnoreCase("Invalid Password"))
						{
							JOptionPane.showMessageDialog(null,"User already exists");
							return;
						}
						if(jtRegLogin.getText().trim().equals(""))
						{
							JOptionPane.showMessageDialog(null,"Please eneter the user name");
							return;
						}
						if(jtRegPass.getText().trim().equals(""))
						{
							JOptionPane.showMessageDialog(null,"Please eneter the password");
							return;
						}
						if(!jtRegPass.getText().trim().equals(jtRegCPass.getText().trim()))
						{
							JOptionPane.showMessageDialog(null,"Password and Confirm Password must be same ");
							return;
						}
						if(jtRegName.getText().trim().equals(""))
						{
							JOptionPane.showMessageDialog(null,"Please enter the name");
							return;
						}
						if(jtRegEmail.getText().trim().equals(""))
						{
							JOptionPane.showMessageDialog(null,"Please enter the email address");
							return;
						}
						String userdata=jtRegLogin.getText()+" : "+jtRegPass.getText()+" : "+jtRegName.getText()+" : "+jtRegSName.getText()+" : "+jtRegGrade.getText()+" : ";
						userdata=userdata+jtRegDept.getText()+" : "+jtRegRepto.getText()+" : "+jtRegAdd.getText()+" : "+jtRegTel.getText()+" : "+jtRegMob.getText()+" : "+jtRegEmail.getText()+" : "+jtRegDOB.getText();
						Socket datasoc=new Socket("localhost",3333);
						PrintWriter pwdata=new PrintWriter(datasoc.getOutputStream(),true);
						pwdata.println(userdata);
						JOptionPane.showMessageDialog(null,"User registered Successfully");
						jtRegLogin.setText("");
						jtRegPass.setText("");
						jtRegCPass.setText("");
						jtRegName.setText("");
						jtRegSName.setText("");
						jtRegGrade.setText("");
						jtRegDept.setText("");
						jtRegRepto.setText("");
						jtRegAdd.setText("");
						jtRegTel.setText("");
						jtRegMob.setText("");
						jtRegEmail.setText("");
						jtRegDOB.setText("");
						
					}
					catch(Exception e)
					{
						System.out.println(e);
					}
					
				}
				
		}

        catch(Exception e)
        {
              	System.out.println(e);
        }
	}
	String ReturnMobileEmail(String str)
	{
		if(str.equalsIgnoreCase("9849"))
		{
			return "@airtelap.com";
		}
		else if(str.equalsIgnoreCase("9848"))
		{
			return "@ideacellular.net";
		}
		else if(str.equalsIgnoreCase("9840"))
		{
			return "@airtelchennai.com";
		}
		else if(str.equalsIgnoreCase("9841"))
		{
			return "@rpgmail.net";
		}
		else if(str.equalsIgnoreCase("9810"))
		{
			return "@airtelmail.com";
		}
		else if(str.equalsIgnoreCase("9811"))
		{
			return "@delhi.hutch.co.in";
		}
		else if(str.equalsIgnoreCase("9824"))
		{
			return "@ideacellular.net";
		}
		else if(str.equalsIgnoreCase("9898"))
		{
			return "@airtelmail.com";
		}
		else if(str.equalsIgnoreCase("9825"))
		{
			return "@celforce.com";
		}
		else if(str.equalsIgnoreCase("9890"))
		{
			return "@airtelmail.com";
		}
		else if(str.equalsIgnoreCase("9823"))
		{
			return "@bplmobile.com";
		}
		else if(str.equalsIgnoreCase("9822"))
		{
			return "@ideacellular.net";
		}
		else if(str.equalsIgnoreCase("9896"))
		{
			return "@airtelmail.com";
		}
		else if(str.equalsIgnoreCase("9812"))
		{
			return "@escotelmobile.com";
		}
		else if(str.equalsIgnoreCase("9816"))
		{
			return "@airtelmail.com";
		}
		else if(str.equalsIgnoreCase("9845"))
		{
			return "@airtelmail.com";
		}
		else if(str.equalsIgnoreCase("9895"))
		{
			return "@airtelmail.com";
		}
		else if(str.equalsIgnoreCase("9847"))
		{
			return "@escotelmobile.com";
		}
		else if(str.equalsIgnoreCase("9846"))
		{
			return "@bplmobile.com";
		}
		else if(str.equalsIgnoreCase("9831"))
		{
			return "@airtelkol.com";
		}
		else if(str.equalsIgnoreCase("9893"))
		{
			return "@airtelmail.com";
		}
		else if(str.equalsIgnoreCase("9890"))
		{
			return "@airtelmail.com";
		}
		else if(str.equalsIgnoreCase("9823"))
		{
			return "@bplmobile.com";
		}
		else if(str.equalsIgnoreCase("9822"))
		{
			return "@ideacellular.net";
		}
		else if(str.equalsIgnoreCase("9892"))
		{
			return "@airtelmail.com";
		}
		else if(str.equalsIgnoreCase("9821"))
		{
			return "@bplmobile.com";
		}
		else if(str.equalsIgnoreCase("9815"))
		{
			return "@airtelmail.com";
		}
		else if(str.equalsIgnoreCase("9843"))
		{
			return "@bplmobile.com";
		}
		else if(str.equalsIgnoreCase("9894"))
		{
			return "@airteltn.com";
		}
		else if(str.equalsIgnoreCase("9843"))
		{
			return "@bplmobile.com";
		}
		else if(str.equalsIgnoreCase("9842"))
		{
			return "@airsms.com";
		}
		else if(str.equalsIgnoreCase("9837"))
		{
			return "@escotelmobile.com";
		}
		return "";
	}
	class ReceiveMessage extends Thread
	{
		
		public ReceiveMessage(JFrame jf)
		{
			start();
		}
		public void run()
		{
			try
			{
				
				while(true)
				{
					ObjectInputStream ois=new ObjectInputStream(clientSoc.getInputStream());
					Object o=null;
					if((o=ois.readObject())!=null)
					{
						if(o instanceof TransferNames)
						{
							TransferNames tn=(TransferNames)o;
							Object oo[]=new Object[tn.str.length];
							int countnames=0;
							while(countnames<tn.str.length)
							{
								oo[countnames]=tn.str[countnames];
								countnames++;
							}
							jlOnlineUser.setListData(oo);
							jlOnlineUser1.setListData(oo);
							System.out.println("Received Names");
						}
						else
						{
							
							InstantMessage im=(InstantMessage)o;
							String fromt=im.from.trim();
							String tot=im.to.trim();
							if(tot.equalsIgnoreCase("all"))
							{
								jtaIms1.append(im.from+" : "+im.msg+"\n");
								jtaIms1.setCaretPosition(jtaIms1.getText().length());
							}
							else
							{
								PersonalChatWindow pcnr=(PersonalChatWindow)hChatWindow.get(fromt);
								if(pcnr!=null)
								{
									pcnr.jta.append(im.from+" : "+im.msg+"\n");
								}
								else
									jtaIms.append(im.from+" : "+im.msg+"\n");
							}
									System.out.println("Received Msg");
						}
					}
				}
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
	};
///////////////////////////////////////////////chat window class///////////////////////////////////
class PersonalChatWindow extends JDialog implements ActionListener
{
	OutputStream os;
	String name;
	JTextArea jta=new JTextArea();
	JScrollPane jsp=new JScrollPane(jta);
	JTextField jtf=new JTextField();
	JButton jb=new JButton("Send");
	public PersonalChatWindow(JFrame jf,String n,OutputStream o)
	{
		super(jf,n);
		os=o;
		name=n;
		Container cp=getContentPane();
		cp.setLayout(null);
		jta.setEditable(false);
	//	jsp.setBounds(10,10,200,80);
		jsp.setBounds(10,10,465,200);

		//jtf.setBounds(10,100,200,20);
		jtf.setBounds(10,220,465,20);

		//jb.setBounds(75,130,70,25);
		jb.setBounds(10,250,465,20);

		jtf.setNextFocusableComponent(jb);
		cp.add(jsp);
		cp.add(jtf);
		cp.add(jb);
		jb.addActionListener(this);
		//setSize(230,190);
		setSize(500,310);
		setVisible(true);
		setResizable(false);
		addWindowListener(new WindowAdapter()
						{
							public void windowClosing(WindowEvent we)
							{
								hChatWindow.remove(name.trim());
							}
						});
		}
	public void actionPerformed(ActionEvent ae)
	{
		if(ae.getSource()==jb)
		{
			try
			{
				ObjectOutputStream ois=new ObjectOutputStream(os);
				if(name!=null && !name.trim().equals(""))
				{
					InstantMessage im=new InstantMessage(LName,name,jtf.getText().trim()+".");
					jta.append(LName+" : "+jtf.getText().trim()+"\n");
					ois.writeObject(im);
					jtf.setText("");
				}
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
	}
};

public void mouseClicked(MouseEvent e) 
{
	if(e.getSource()==jlOnlineUser && e.getClickCount()==2)
	{
		try
		{
			int index = jlOnlineUser.locationToIndex(e.getPoint());
	        System.out.println("Double clicked on Item " + index);	
	        String recpient=((String)jlOnlineUser.getSelectedValue()).trim();
			if(hChatWindow.get(recpient.trim())==null)
			{
				PersonalChatWindow pn=new PersonalChatWindow(this,recpient,clientSoc.getOutputStream());
				hChatWindow.put(recpient,pn);
			}
		}
		catch(Exception exp)
		{
		}	
	}
}

public void mouseEntered(MouseEvent e) 
{
}

public void mouseExited(MouseEvent e) {}

public void mousePressed(MouseEvent e) {}

public void mouseReleased(MouseEvent e) {}
public static void main(String s[])
{
	new ComMan("aa");
}           

}     
