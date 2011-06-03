import java.io.*;
import java.sql.*;

class data2
{
	Statement st;
	Connection con;
	String size,color;
	String dimension;
	int result;
	void initialize()throws ClassNotFoundException,SQLException
	{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:db3");
	}

	void createtable()
	{
		try
		{
		st=con.createStatement();
		st.executeUpdate("create table jai(size varchar(20),color varchar(20),dimension varchar(20))");
		}
		catch(Exception ce)
		{
			System.out.println(ce);
		}
	}


 public void insert()throws SQLException,IOException
  {
   try
	   {
	   BufferedReader br=new BufferedReader(new FileReader("c:\\data3.txt"));
	   PreparedStatement ps=con.prepareStatement("INSERT INTO jai(size,color,dimension)VALUES(?,?,?)");
  
   do
    {
	 //ps.clearParameters();
	 String str1=br.readLine();
     String str2=br.readLine();
	 String str3=br.readLine();
	 String str4=br.readLine();
   
     ps.setString(1,str1);
	 ps.setString(2,str2);
	 ps.setString(3,str3);
	 //ps.setString(4,str4);
	 ps.executeUpdate();
	}while(br.readLine()!=null);
	
   }
	catch(NullPointerException e){}
  }
 
	
	public void delete() throws SQLException,IOException
	 {
		BufferedReader br=new BufferedReader(new InputStreamReader(System.in));
		String buffer;
		System.out.println("Enter size to be deleted...");
		buffer=br.readLine();
		String sql="delete from JAi where size ='"+buffer+"'";	
		st=con.createStatement();
		st.executeUpdate(sql);
		st.close();		
	}
	/*try
		{
		  String str="delete size,dimension from jai where color=red";		 
		  Statement st=con.createStatement();
          st.executeUpdate(str);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}*/
	

   public void modify()throws IOException,SQLException
	{
	   	BufferedReader br=new BufferedReader(new InputStreamReader(System.in));
		String buffer;
		String dim="10";
		System.out.println("Enter size to be modified...");
		buffer=br.readLine();
		buffer="Update Jai SET color='blue' where dimension='"+dim+"'";
		st=con.createStatement();
		st.executeUpdate(buffer);
				
	}


	public void display()throws SQLException,NullPointerException,IOException
	{
   
	   st=con.createStatement();
	   String str="SELECT JAI.size,JAI.color,JAI.dimension FROM JAI";
	   ResultSet rs=st.executeQuery(str);
	   while(rs.next())
	   {
		System.out.println("RECORDS ARE AS FOLLOWS");
		System.out.println(rs.getString("size"));
		System.out.println(rs.getString("color"));
		System.out.println(rs.getString("dimension"));

	   }
   
 
	}

	
	
	void close()
	{
		try
		{
		con.close();
		}
		catch(Exception e)
		{
		}
	}

};

class data3
{
	public static void main(String[] args)
	{
		try
		{
		data2 d2=new data2();
		d2.initialize();
		//d2.createtable();
		d2.insert();
		d2.display();
		// d2.delete();
		d2.modify();
		
		d2.close();
		}
		catch(Exception ce)
		{
			System.out.println(ce);
		}
	}
};