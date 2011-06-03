import java.sql.*;

class test
{
	public static void main(String args[])
	{
		new jdbc();
	}
}


class jdbc
{
	
	jdbc(){
		test();
	}
	
	void test()
	{
		try
		{
			
			//Class.forName("com.mysql.jdbc.Driver");
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			
			//String url="jdbc:mysql://localhost/test";
			String url="jdbc:Odbc:stud";
			Connection con=DriverManager.getConnection(url,"madhur","goldi");
			
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from student");
		/*	while(rs.next())
			{
				System.out.println(rs.getObject(2));
			}
			while(rs.previous())
			{
					System.out.println(rs.getObject(2));
				
			}*/
			rs.next();
			System.out.println(rs.getString(1));
			System.out.println(rs.getString(1));
			ResultSetMetaData rsmd=rs.getMetaData();
			System.out.println(rsmd.getColumnClassName(1));
			System.out.println(rsmd.getColumnCount());
			System.out.println(rsmd.getColumnLabel(1));
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}
}