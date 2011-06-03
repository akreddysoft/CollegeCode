import java.sql.*;

class jdbc
{
	
	public static void main(String args[]) throws ClassNotFoundException, SQLException
	{
		
        //try
         { 
            // The newInstance() call is a work around for some 
            // broken Java implementations

            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
        }
        
        // catch (Exception ex) 
         { 
       //     // handle the error 
        }

		
		String url="jdbc:Odbc:mad";
		
	//	try 
	
         // Connection conn = DriverManager.getConnection("jdbc:Odbc:mad");
          Connection conn = DriverManager.getConnection(url, "madhur", "goldi");

            // Do something with the Connection 
          
           
        
       /* catch (SQLException ex)
         {
            // handle any errors 
            System.out.println("SQLException: " + ex.getMessage()); 
            System.out.println("SQLState: " + ex.getSQLState()); 
            System.out.println("VendorError: " + ex.getErrorCode()); 
        }*/
	Statement stmt=conn.createStatement();
	ResultSet rs=stmt.executeQuery("select * from table1");

	System.out.println(rs.getString("marks1"));
//	rs.

	}
}