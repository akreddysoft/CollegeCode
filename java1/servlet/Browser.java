/*Problem definition : Write a program to display client's Browser info
 *
 *Name of Programmer : Madhur Ahuja
 *
 *version 			 : JDK 1.4.1_01
 *
 *Special Package    : javax.servlet.*
 *					   javax.servlet.http.*
 */
 
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.net.*;



public class Browser extends HttpServlet
{
	
	public void doGet(HttpServletRequest hrq,HttpServletResponse hrp) throws ServletException,IOException
	{
		PrintWriter pw=hrp.getWriter();
		
		String agent=hrq.getHeader("User-Agent"),browser;
		String ip=hrq.getRemoteAddr();
		InetAddress a = InetAddress.getByName(ip);
		String host=a.getHostName();
	
		if(agent.lastIndexOf("MSIE")!=-1)
			browser="Microsoft Internet Explorer";
		else if(agent.lastIndexOf("Opera")!=-1)
			browser="Opera";
		else if(agent.lastIndexOf("Mozilla")!=-1)
			browser="Netscape Mozilla";
		else
			browser="Unknown Browser";
			
		pw.println("<html>"+
				   "<head>"+
				   "</head>"+
				   "<body bgcolor=black text=white>"+
				   "<h1>Your Host name is : "+
				   "<table width=80% border=1 align=center>"+
				   "<tr>"+
				   "<td align=center bgcolor=purple><font size=4>"+host+"</font></td>"+
				   "</tr>"+
				   "</table>"+
				   "<h1>Your IP Address is :"+
				   "<table width=80% border=1 align=center>"+
				   "<tr>"+
				   "<td align=center bgcolor=purple><font size=4>"+hrq.getRemoteAddr()+"</font></td>"+
				   "</tr>"+
				   "</table>"+
				   "<h1>You are running:</h1>"+
				   "<table width=80% border=1 align=center>"+
				   "<tr>"+
				   "<td align=center bgcolor=purple><font size=4>"+browser+"</font></td>"+
				   "</tr>"+
				   "</table>"+
				   "</body>"+
				   "</html>");
				   
		pw.close();
				   
			
		
		
	}
}