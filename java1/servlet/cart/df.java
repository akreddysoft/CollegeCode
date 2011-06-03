import java.sql.*;

class test
{
	public static void main(String args[])
	{
		test1 a=new test1();
	}
}

class test1
{
	
	
	test1()
	{
	
	try{
	
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		
		String url="jdbc:Odbc:cart1";
		Connection con=DriverManager.getConnection(url,"","");
		Statement st=con.createStatement();
		st.execute("select * from reg");
		ResultSet rs=st.getResultSet();
		while(rs.next())
		{
			System.out.println(rs.getString(1));
		}
		con.close();
	}
	catch(Exception e)	
	{
		e.printStackTrace();
	}
	}
}