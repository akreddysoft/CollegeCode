import java.net.*;
import java.io.*;
import java.util.*;
import java.sql.*;
class ClientInfo implements Serializable
{
	String name;
	OutputStream os;
	InputStream is;
	public ClientInfo(String name,OutputStream os,InputStream is)
	{
		this.name=name;
		this.os=os;
		this.is=is;
	}
};
class TransferNames implements Serializable
{
	String str[];
	public TransferNames(int i)
	{
		str=new String[i]; 
	}
};
class InstantMessage implements Serializable
{
	String from;
	String to;
	String msg;
	public InstantMessage(String f,String t,String m)
	{
		from=f;
		to=t;
		msg=m;
	}
};
public class IMServer implements Runnable
{
	ServerSocket cs;
	Thread t;
	Hashtable ht=new Hashtable(10); 
	public IMServer()
	{
		try
		{
			cs=new ServerSocket(5555);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		t=new Thread(this);
		t.start();
		new ServerLogin();
		new RegisterUser();
	}
	public void run()
	{
		try
		{
			while(true)
			{
				System.out.println("Waiting to accept the connection");
				Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
				Connection con=DriverManager.getConnection("Jdbc:Odbc:ComManDsn");
				Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
				ResultSet rs=st.executeQuery("select userid from user");
				int num=0;
				Collection userids=new ArrayList();
				while(rs.next())
				{
					num++;
					userids.add(rs.getString(1));	
				}
				rs.close();
				st.close();
				con.close();
				
				Socket s=cs.accept();
				BufferedReader buf=new BufferedReader(new InputStreamReader(s.getInputStream()));
				String ss=buf.readLine();
				ObjectOutputStream os=new ObjectOutputStream(s.getOutputStream());
				Enumeration en=ht.keys();
				int count=0;
				while(en.hasMoreElements())
				{
					count++;
					en.nextElement();
				}
				ht.put(ss.trim(),new ClientInfo(ss.trim(),s.getOutputStream(),s.getInputStream()));
				ReadMessages r=new ReadMessages(s.getInputStream());
				TransferNames tn=new TransferNames(num+1);
				count=0;
				en=ht.keys();
				Iterator useridsItr=userids.iterator();
				while(useridsItr.hasNext())
				{
					tn.str[count]=(String)useridsItr.next();
					count++;
				}
				
				os.writeObject(tn);
				en=ht.keys();
				try
				{
					Thread.sleep(10000);
				}
				catch(Exception e)
				{
					System.out.println(e);
				}
				while(en.hasMoreElements())
				{
					System.out.println("writing name");
					String strn=((String)en.nextElement()).trim();
					if(!strn.equalsIgnoreCase(ss.trim()))
					{
						ClientInfo ci=(ClientInfo)ht.get(strn);
						ObjectOutputStream oos=new ObjectOutputStream(ci.os);
						oos.writeObject(tn);
					}
				}
				
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	class ReadMessages extends Thread
	{
		InputStream is;
		public ReadMessages(InputStream ois)
		{
			this.is=ois;
			start();
		}
		public void run()
		{
			try
			{
				while(true)
				{
					ObjectInputStream ois=new ObjectInputStream(is);
					Object o=null;
					if((o=ois.readObject())!=null)
					{
						InstantMessage im=(InstantMessage)o;
						ClientInfo ci=(ClientInfo)ht.get(im.to.trim());
						if(ci!=null)
						{
							ObjectOutputStream oos=new ObjectOutputStream(ci.os);
							oos.writeObject(im);
						}
						else
						{
							Enumeration en=ht.keys();
							while(en.hasMoreElements())
							{
								ClientInfo cii=(ClientInfo)ht.get(((String)en.nextElement()).trim());
								ObjectOutputStream oos=new ObjectOutputStream(cii.os);
								oos.writeObject(im);
							}
						}
							Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
							Connection con=DriverManager.getConnection("Jdbc:Odbc:ComManDsn");
							Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
							ResultSet rs=st.executeQuery("select messageid from ChatMessage");
							int num=0;
							if(rs.next())
							{
								num=rs.getInt(1);
								num=num+1;
							}
							else
							{
								num=1;
							}
							rs.close();
							st.close();
							PreparedStatement pstmt=con.prepareStatement("Insert into ChatMessage values(?,?,?,?)",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
							pstmt.setInt(1,num);
							pstmt.setString(2,im.to);
							pstmt.setString(3,im.from);
							pstmt.setString(4,im.msg);
							pstmt.executeUpdate();
							pstmt.close();
							con.close();
						
					}
				}
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
	};

	public static void main(String s[])
	{
		new IMServer();
	}
}

class ServerLogin extends Thread
{
	ServerSocket cs=null;
	public ServerLogin()
	{
		try
		{
			cs= new ServerSocket(4444);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		start();
	}
	public void run()
	{
		while(true)
		{
			try
			{
				System.out.println("Login.......");
				Socket s=cs.accept();
				BufferedReader buf=new BufferedReader(new InputStreamReader(s.getInputStream()));
				String ss=buf.readLine();
				String userpass[]=ss.split(":");
				Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
				Connection con=DriverManager.getConnection("Jdbc:Odbc:ComManDsn");
				PreparedStatement st=con.prepareStatement("select password from user where userid=?",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
				st.setString(1,(userpass[0]+"").trim());
				//st.setString(2,(userpass[1]+"").trim());
				ResultSet rs=st.executeQuery();
				PrintWriter pw=new PrintWriter(s.getOutputStream(),true);
				if(rs.next())
				{
					if(rs.getString(1).trim().equals((userpass[1]+"").trim()))
					{
						pw.println("LoggedIn");	
					}
					else
					{
						pw.println("Invalid Password");	
					}
				}
				else
				{
					pw.println("Invalid Username");
				}
				rs.close();
				st.close();
				con.close();	
			}
			catch(SQLException sqlExp)
			{
				System.out.println(sqlExp);
			}
			catch(ClassNotFoundException classNotFoundExp)
			{
				System.out.println(classNotFoundExp);
			}
			catch(IOException IOExp)
			{
				System.out.println(IOExp);
			}

		}
	}
}

class RegisterUser extends Thread
{
	ServerSocket cs=null;
	public RegisterUser()
	{
		try
		{
			cs= new ServerSocket(3333);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		start();
	}
	public void run()
	{
		while(true)
		{
			try
			{
				System.out.println("Login.......");
				Socket s=cs.accept();
				BufferedReader buf=new BufferedReader(new InputStreamReader(s.getInputStream()));
				String ss=buf.readLine();
				String userpass[]=ss.split(":");
				Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
				Connection con=DriverManager.getConnection("Jdbc:Odbc:ComManDsn");
				PreparedStatement st=con.prepareStatement("insert into user values(?,?,?,?,?,?,?,?,?,?,?,?)",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
				st.setString(1,(userpass[0]+"").trim());
				st.setString(2,(userpass[1]+"").trim());
				st.setString(3,(userpass[2]+"").trim());
				st.setString(4,(userpass[3]+"").trim());
				st.setString(5,(userpass[4]+"").trim());
				st.setString(6,(userpass[5]+"").trim());
				st.setString(7,(userpass[6]+"").trim());
				st.setString(8,(userpass[7]+"").trim());
				st.setString(9,(userpass[8]+"").trim());
				st.setString(10,(userpass[9]+"").trim());
				st.setString(11,(userpass[10]+"").trim());
				st.setString(12,(userpass[11]+"").trim());
				st.executeUpdate();
				st.close();
				con.close();	
			}
			catch(SQLException sqlExp)
			{
				System.out.println(sqlExp);
			}
			catch(ClassNotFoundException classNotFoundExp)
			{
				System.out.println(classNotFoundExp);
			}
			catch(IOException IOExp)
			{
				System.out.println(IOExp);
			}

		}
	}
}
