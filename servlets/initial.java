import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class initial extends HttpServlet
{
	Connection con;
	ResultSet rs;
	Statement stmt;
	protected void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		String name=req.getParameter("name");
		String roll=req.getParameter("roll");
		String clas=req.getParameter("class");
		//res.setContentType("text/html");
		PrintWriter  pw=res.getWriter();		
		try
		{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:demo");
		stmt=con.createStatement();
		String str="select * from table1 where name like '%"+name+"' and roll="+roll;
		rs=stmt.executeQuery(str);
		RequestDispatcher rd;
		if (rs.next()==true)
		{
			rd=req.getRequestDispatcher("/welcome.html");
			rd.forward(req,res);
		}
		else
		{
			rd=req.getRequestDispatcher("/noreg.html");
			rd.forward(req,res);
		}
		}catch(Exception e)
		{
			//throw new ServletException("Error manjit singh");}
			e.printStackTrace(pw);
		}
		}
}