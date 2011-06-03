import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.sql.*;



public class Authenticate extends HttpServlet
{
	
	HttpSession hs;
	public void init()
	{
		DataBase.initialize();

	}
	
	
	public void doGet(HttpServletRequest hrq, HttpServletResponse hrp) throws ServletException,IOException
	{
		PrintWriter pw=hrp.getWriter();
		String qr=hrq.getQueryString();
		if(qr.equals("signout"))
		{
			
			getServletContext().removeAttribute("username");
			getServletContext().removeAttribute("password");
			hs.invalidate();
			pw.println("<html>"+
				
			"<head>"+
			"<link rel=\"stylesheet\" type=\"text/css\" href=\"/programming.css\" />"+
			"</head>"+
			"<body>"+
			"<h2>You have successfully signed out</h2>"+
			"<br><a href=/login.html>click here</a>if you want to sign in as different user"+
			"</body>"+
			"</html>");	
		}
	}
	
	public void doPost(HttpServletRequest hrq,HttpServletResponse hrp) throws ServletException,IOException
	{
		String qr=hrq.getQueryString();
		PrintWriter pw=hrp.getWriter();
		try
		{
		
			DataBase.init();
		}
		catch(Exception e)
		{
			e.printStackTrace(pw);
		}
		
		if(qr.equals("register"))
		{
			
			String name=hrq.getParameter("name");
			String email=hrq.getParameter("email");
			String pass=hrq.getParameter("pass");
			String userid=hrq.getParameter("userid");
			Statement st=null;
			Statement st1=null;
			try
			{
			
				Connection con=DriverManager.getConnection(DataBase.url,"","");
				st1=con.createStatement();
				st1.execute("select userid from reg");
				ResultSet rs=st1.getResultSet();
				while(rs.next())
				{
					String username=rs.getString(1);
					if(username.equals(userid))	throw new existexception();
				}
				st1.close();
				
			
				st=con.createStatement();
				String ex="insert into reg values('"+name+"','"+email+"','"+userid+"','"+pass+"')";
				System.out.println(ex);
				st.execute(ex);
				st.close();
				con.close();
				//pw.println(hrq.getServletPath());
				//pw.println(hrq.getRealPath("madhur"));
				
			}
			catch(existexception e)
			{
				pw.println(" "+
				
				"<html>"+
"<head>"+
"<link rel=\"stylesheet\" type=\"text/css\" href=\"/programming.css\" />"+
"</head>"+
"<body>"+

"<h2>The name "+userid+" has already been taken by someone.</h2>"+

"<br><h3><a href=/sign.html>clike here</a> to go back and choose a different name</h3>"+

"</body>"+
"</html>");

		return ;

			
			}
			catch(Exception e)
			{
				e.printStackTrace(pw);
				return ;
			}
			
			try
			{
				
			/*	BufferedReader br=new BufferedReader(new FileReader(hrq.getRealPath("success.html")));
				while(true)
				{
					String line=br.readLine();
					if(line==null)	break;
					pw.println(line);
				}
				br.close();*/
				
				RequestDispatcher rd=getServletContext().getRequestDispatcher("/success.html");
				rd.include(hrq,hrp);
				
			}
			catch(Exception e)			
			{
				
				e.printStackTrace(pw);
			}
			
		}
		
		else if(qr.equals("signin"))
		{
			String username=hrq.getParameter("name");
			String pass=hrq.getParameter("pass");
			Hashtable ht=new Hashtable();
			try
			{
			
//				Statement st=DataBase.getstatement();
				Connection con=DriverManager.getConnection(DataBase.url,"","");
				Statement st=con.createStatement();
				st.execute("select  userid,password from reg");	
				ResultSet rs=st.getResultSet();
				while(rs.next())
				{
					ht.put(rs.getString(1),rs.getString(2));
				}
				con.close();
			}
			
			
			catch(SQLException e)
			{
				e.printStackTrace(pw);
			}
			
			String actpass=(String)ht.get(username);
			
			if(actpass==null)
			{
				pw.println("<html>"+
				
				"<head>"+
				"<link rel=\"stylesheet\" type=\"text/css\" href=\"programming.css\" />"+
				"</head>"+
				"<body>"+
				"<h2>Account doesnt exist</h2>"+
				"<br><a href=/sign.html>click here</a> to sign up"+
				"</body>"+
				"</html>");
				
				return ;
			}
			
			if(actpass.equals(pass))
			{
				hs=hrq.getSession(true);
				pw.println(hrq.getSession().getId());
				getServletContext().setAttribute("username",username);
				getServletContext().setAttribute("password",pass);
				
				//delete temp table user entries here
				try
				{
					Connection con=DriverManager.getConnection(DataBase.url,"","");
					Statement st=con.createStatement();
					st.execute("delete from temp where UserID='"+username+"'");
					st.close();
					con.close();
					
				}
				catch(Exception e)
				{
					e.printStackTrace(pw);
				}
				
				RequestDispatcher rd=getServletContext().getRequestDispatcher("/servlet/Cart");
				rd.forward(hrq,hrp);
				
			}
			else
			{
				pw.println("<html>"+
				
				"<head>"+
				"<link rel=\"stylesheet\" type=\"text/css\" href=\"programming.css\" />"+
				"</head>"+
				"<body>"+
				"<h2>Incorrect username and password</h2>"+
				"<br><a href=/login.html>click here</a> to go back"+
				"</body>"+
				"</html>");
				
				return ;
				
			}
			
		}	
	}
}

class existexception extends Throwable
{
	
}

 
 class DataBase
{
 	private 	static String DriverString;
	static String url;
	private static String login;
	private static String password;
	private static String database;
	static String type;
	private static String filename;
	static void initialize()
	{
		
		DriverString="sun.jdbc.odbc.JdbcOdbcDriver";
		login="madhur";
		password="gold";
		url="jdbc:Odbc:cart1";
	
		database="cart";
		
	}
		
	static String init() throws SQLException,ClassNotFoundException
	{
		String retval="";		
		Class.forName(DriverString);
		return retval;
	}
	
	static String[] getDriverString()
	{
		return new String[]{DriverString,url,database,login,password};
	}
	
}