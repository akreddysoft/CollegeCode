import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class register extends HttpServlet
{
	Connection con;
	ResultSet rs;
	PreparedStatement ps,ps1;
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
		String name=req.getParameter("name");
		String roll_str=req.getParameter("roll");
		int roll=Integer.parseInt(roll_str);
		String cl=req.getParameter("class");
		PrintWriter pw=res.getWriter();
		try{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("jdbc:odbc:demo");
			ps=con.prepareStatement("insert into table1 values (?,?)");
			ps1=con.prepareStatement("select * from table1 where roll="+roll);
			rs=ps1.executeQuery();
			if (rs.next()==true)
			{
				RequestDispatcher rd;
				rd=req.getRequestDispatcher("/again.html");
				rd.forward(req,res);
			}
			ps.setString(1,name);
			ps.setInt(2,roll);
			//ps.setString(3,cl);
			ps.executeUpdate();
			
			
		}catch(Exception e)
		{
			e.printStackTrace(pw);
		}
	}
};