import java.sql.*;


class Test
{
	
	public static void main(String args[])
	{
		MyTest a=new MyTest();
		
	}
}



class MyTest
{
	
	
	MyTest()
	{
		try
		{
		
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			String url="jdbc:Odbc:test";
			
			Connection con=DriverManager.getConnection(url,"","");
			Statement st=con.createStatement();
			Statement st1=con.createStatement();
			st.execute("select * from table1");
			ResultSet rs=st.getResultSet();
			rs.next();
			
			System.out.println(rs.getString(1));
			
			st1.execute("select  a from table1");
			
			ResultSet rs1=st.getResultSet();
			rs1.next();
			
			System.out.println(rs.getString(2));
			rs.next();
			System.out.println(rs.getString(1));
			System.out.println(rs.getString(2));
			
			st.close();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	
	
	
	
}