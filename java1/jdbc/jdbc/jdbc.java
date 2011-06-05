import java.sql.*;
import com.mysql.jdbc.Driver;
import java.util.*;
import java.io.*;
class JdbcTest
{
	public static void main(String args[])
	{
		
		try
		{
		
		Class.forName("com.mysql.jdbc.Driver")	;

		String url="jdbc:mysql://localhost/test";
	
         Connection conn = DriverManager.getConnection(url, "madhur", "goldi");
         
         Statement stmt=conn.createStatement();
			ResultSet rs=stmt.executeQuery("select * from madhur");
		
			while(rs.next())
			{
			
				InputStream df=rs.getAsciiStream(2);
				//BufferedReader br=new BufferedReader(df);
				while(df.available()!=0)	
				{
					System.out.println(df.read());
				}
				
		
				
			}
		//	System.out.println(rs.getString(2));
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		

	}
	
	
}              