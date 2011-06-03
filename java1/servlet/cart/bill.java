import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.sql.*;

public class bill extends HttpServlet
{
	
	
	public void doPost(HttpServletRequest hrq,HttpServletResponse hrp) throws ServletException,IOException
	{
		PrintWriter pw=hrp.getWriter();
		String user=(String)getServletContext().getAttribute("username");
		String pass=(String)getServletContext().getAttribute("password");
		hrp.setHeader("expires","0");
		hrp.setHeader("Cache-Control", "no-cache");
		hrp.setHeader("Pragma", "no-cache");

	//	pw.println(hrq.getSession().getId());
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
				ArrayList items=(ArrayList)getServletContext().getAttribute("items");
				ArrayList cost=(ArrayList)getServletContext().getAttribute("cost");
				//ArrayList prods=(ArrayList)getServletContext().getAttribute("prods");
				if(items==null || cost==null)
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
					
					return ;
				}
				
						
				pw.println("<html>"+
				"<head>"+
				"<link rel=\"stylesheet\" type=\"text/css\" href=\"/programming.css\" />"+
				"</head>"+
				"<body>"+
				"<h1>Thank you for your order</h1>"+
				"<table width=80% border=0>"+
				"<tr>"+
				"<th align=left>ProductID</th>"+
			//	"<td>Quantity</td>"+
				"<th align=left>Price</th>"+
				"</tr>");
				int sum=0;
				for(int i=0;i<items.size();++i)
				{
					pw.println("<tr>"+
				
					"<td>"+items.get(i)+"</td>"+
					"<td>"+cost.get(i)+"</td>"+
					"</tr>");
					
					String aa=(String)cost.get(i);
					
					sum=sum+Integer.parseInt(aa);
					
				}
				pw.println("</table>");
				pw.println("Total cost is "+sum);
				pw.println("<p>click here to <a href=/servlet/Authenticate?signout>Sign out</a>");
				
				try
				{
					
					Connection con=DriverManager.getConnection(DataBase.url,"","");
					Statement st=con.createStatement();
					java.util.Date df=new java.util.Date();
					
					String query="insert into sales values('"+user+"','"+df.toString()+"',"+sum+")";
					st.execute(query);
					st.close();
					con.close();
			
				}	
				catch(Exception e)
				{
					e.printStackTrace(pw);
				}
				
				
				pw.println("</body>"+
				"</html>");
				
		}
				
		}
		
	}
