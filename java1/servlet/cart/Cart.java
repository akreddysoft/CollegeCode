import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.sql.*;


public class Cart extends HttpServlet
{
	String user,pass;

	
	public void doPost(HttpServletRequest hrq, HttpServletResponse hrp) throws ServletException,IOException
	{
		PrintWriter pw=hrp.getWriter();
		user=(String)getServletContext().getAttribute("username");
		pass=(String)getServletContext().getAttribute("password");
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
		
				ArrayList images=new ArrayList();
				ArrayList id=new ArrayList();
				ArrayList price=new ArrayList();
				try
				{
					
					//Statement st=DataBase.getstatement();
					Connection con=DriverManager.getConnection(DataBase.url,"","");
					Statement st=con.createStatement();
					st.execute("select * from products");
					ResultSet rs=st.getResultSet();
					while(rs.next())
					{
						
						images.add(rs.getString("file"));
						id.add(rs.getString("ProductID"));
						price.add(rs.getString("Price"));
				
					}
					
				}
				catch(Exception e)
				{
					e.printStackTrace(pw);
				}
				
				pw.println("<html>"+
				"<head>"+
				"<script language=javascript>"+
				"</script>"+
				"<link rel=\"stylesheet\" type=\"text/css\" href=\"/programming.css\" />"+
				"</head>"+
				"<h1><center>Shopping site</center></h1>"+
				"Welcome "+user+
				"<p align=right><a href=/servlet/Authenticate?signout>Sign out</a>"+
				
				"<hr>"+
				"<form method=post action=/servlet/addcart>"+
				"<table width=100% border=0 cellspacing=2 cellpadding=2>");
				
				for(int i=0;i<images.size()/3;i++)
				{
					
					pw.println("<tr>");
					for(int j=0;j<3;++j)
					{
						try
						{
						
						pw.println("<td><img src=/images/"+images.get(i*3+j)+"></img></td>");
					//	pw.println("<td><input type=checkbox name=check>"+id.get(3*i+j)+"</input></td>");
						}
						catch(Exception e)
						{
					//		pw.println(i + " "+j);
						}
					}
					pw.println("</tr>");
					pw.println("<tr>");
					for(int j=0;j<3;++j)
					{
						try
						{
						
					//	pw.println("<td><img src=/images/"+images.get(i*3+j)+"></img></td>");
						pw.println("<td bgcolor=green><input type=checkbox name="+id.get(3*i+j)+"></input> Price: "+price.get(3*i+j)+"</td>");
//						pw.println("<td>"+price.get(3*i+j)+"</td>");
						}
						catch(Exception e)
						{
					//		pw.println(i + " "+j);
						}
					}
					pw.println("</tr>");
				}	
				
				pw.println("<tr>"+
				"<td colspan=3><hr></td>"+
				"</tr>"+
				"<tr>"+
				"<td align=center colspan=3><input type=submit value=\"Add selected items to cart\"></input></td>"+
				"</tr>");
				
				pw.println("</table>");
				pw.println("</form>");
				
				ArrayList items=null;
				ArrayList cost=null;
				ArrayList quan=null;
				try
				{
					items=new ArrayList();
					cost=new ArrayList();
				//	prods=new ArrayList();
					
					Connection con=DriverManager.getConnection(DataBase.url,"","");
					Statement st=con.createStatement();
						
					st.execute("select * from temp");
					ResultSet rs=st.getResultSet();
					while(rs.next())
					{
						if(rs.getString(1).equals(user))
						{
							items.add(rs.getString(2));
							//prods.add(rs.getString(3));
						}
						
					}
					
					st=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
					st.execute("select productid,price from products");
					rs=st.getResultSet();
					//rs.next();
					for(int i=0;i< items.size();++i)
					{
						String prodid=(String)items.get(i);
						
						while(rs.next())
						{
						
							if(prodid.equals(rs.getString("ProductID")))
								cost.add(rs.getString("Price"));
						}
						rs.beforeFirst();
						
					}
					
					
									
					con.close();
				}
				catch(Exception e)
				{
					e.printStackTrace(pw);
				}
				
				pw.println("<h3>Items Added to Cart</h3>");
				pw.println("<hr>");
				pw.println("<table width=50% border =0 cellspacing=2 cellpadding=2 >  ");
				pw.println("<tr>"+
				"<td>Product ID</td>"+
				"<td>Quantity</td>"+
				"<td>Price</td>"+
				"</tr>");
				

				for(int i=0;i<items.size();++i)
				{
					pw.println("<tr>"+
					"<td> "+items.get(i)+"</td>"+
					"<form action=/servlet/addcart?remove="+items.get(i)+" method=post>"+
					"<td><input type=text size=2 name=q"+items.get(i)+" onchange=this.form.p"+items.get(i)+".value="+cost.get(i)*this.form.q"+"></input></td>"+
					"<td><input type=text size=2 name=p"+items.get(i)+"></input></td>"+
				
					"<td><input type=submit value=\"Remove from cart\"></input></td>"+
					"</form>"+
					"</tr>");
				}
				
				pw.println("</table>");
				
				getServletContext().setAttribute("items",items);
				getServletContext().setAttribute("cost",cost);			
				pw.println("<hr>");
				pw.println("<form action=/servlet/bill method=post onsubmit=\"return checkform();\">"+
				"<input type=submit value=\"Proceed to checkout\"></input>");
				
				pw.println("</form>");
				pw.println("</body>")			;
				pw.println("</html>")			;
			
			}
		}		
}

