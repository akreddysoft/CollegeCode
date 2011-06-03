import java.sql.*;

class jdbc
{
	
	public static void main(String args[]) throws ClassNotFoundException, SQLException
	{
		
     

            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
   	
		String url="jdbc:Odbc:mad3";
		

          Connection conn = DriverManager.getConnection(url, "system", "manager");
	Statement stmt=conn.createStatement();
	ResultSet rs=stmt.executeQuery("select * from student");
	//rs.next();
	System.out.println(rs.getString("class"));
//	rs.

	}
}