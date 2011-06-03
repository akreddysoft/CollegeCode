import java.sql.*;

class jdbc
{
	
	public static void main(String args[]) throws ClassNotFoundException, SQLException
	{
		
     

            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
   	
		String url="jdbc:Odbc:madhur";
		

   Connection    conn = DriverManager.getConnection(
             "jdbc:oracle:mad2@127.0.0.1:1521:orcl",
             "SYS", "ADMIN");


	Statement stmt=conn.createStatement();
	ResultSet rs=stmt.executeQuery("select * from student");
	//rs.next();
	System.out.println(rs.getString("class"));
//	rs.

	}
}