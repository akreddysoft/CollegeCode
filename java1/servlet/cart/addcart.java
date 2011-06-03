import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.sql.*;


public class addcart extends HttpServlet
{
	
	String user,pass;

	
	public void doPost(HttpServletRequest hrq,HttpServletResponse hrp) throws ServletException,IOException
	{
		PrintWriter pw=hrp.getWriter();
		user=(String)getServletContext().getAttribute("username");
		pass=(String)getServletContext().
		getAttribute("password");
	
		pw.println(hrq.getSession().getId());
		if(user==null || pass==null)
		{
			pw.println("<html>"+
			"<head>"+
			"<meta http-equiv=refresh content=\"3;URL=/login.html\">"+
			"<link rel=\"stylesheet\" type=\"text/css\" href=\"/programming.css\" />"+
			"</head>"+
			"<body>"+
			"<h1>You have not signed in</h1>"+
			"<h2>You will be redirected to login page in 3 seconds</h2>"+
			"<h2><a href=/login.html>click here</a> if your browser doesnt support automatic redirection</h2>"+
			"</body>"+
			"</html>");
			
		}
		else
		{		
			
				String qr=hrq.getQueryString();
				if(qr!=null && qr.startsWith("remove"))
				{
					String id=hrq.getParameter("remove");
					try
					{
						Connection con=DriverManager.getConnection(DataBase.url,"","");
						Statement st=con.createStatement();
						String query="delete from temp where ProductID='"+id+"'";
						st.execute(query);
						st.close();
						con.close();
						
					}
					catch(Exception e)
					{
						e.printStackTrace(pw);
					}
					
					RequestDispatcher rd=hrq.getRequestDispatcher("/servlet/Cart");
				rd.forward(hrq,hrp);
				}
				
			
			
		
			else
			{
				
				Enumeration en;
				String query=null;
			//	ArrayList al=new ArrayList();
				try
				{
				
					en=hrq.getParameterNames();
					Connection con=DriverManager.getConnection(DataBase.url,"","");
					
					while(en.hasMoreElements())
					{
						Statement st=con.createStatement();			
						query="insert into temp values('"+user+"','"+en.nextElement()+"')";
						st.execute(query);
						pw.println(query);
						st.close();
					
					}
					con.commit();
					con.close();
					
					RequestDispatcher rd=hrq.getRequestDispatcher("/servlet/Cart");
					rd.forward(hrq,hrp);
				}
				catch(Exception e)
				{
					e.printStackTrace(pw)			;
					//put non duplication code here
				}
			}
			
			
		}
}	}
