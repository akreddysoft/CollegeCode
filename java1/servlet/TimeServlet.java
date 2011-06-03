import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.rmi.*;


public class TimeServlet extends HttpServlet implements TimeServer
{
	
	public void doGet(HttpServletRequest hrq,HttpServletResponse hrp) throws IOException,ServletException
	{
		PrintWriter out=hrp.getWriter();
		hrp.setContentType("text/html")		;
	
		if(hrq.getQueryString()!=null && hrq.getQueryString().equals("http"))
		{
		
			out.println( new java.util.Date().toString());
			
		}
		else if( hrq.getQueryString()!=null && hrq.getQueryString().equals("rmi"))
		{
			String date=getdate()	;
			out.println(date);
			
		}
		else
		{
			out.println("error")		;
		
		}
		
		out.close();
		
		
	}
	
	public String getdate()
	{
		  return new java.util.Date().toString();
	}
}

interface TimeServer
{
	public String getdate() throws RemoteException;
}