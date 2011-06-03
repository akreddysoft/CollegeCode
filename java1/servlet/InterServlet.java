import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.io.*;

public class InterServlet extends HttpServlet 
{
	
	public void doGet(HttpServletRequest hrq,HttpServletResponse hrp) throws IOException,ServletException
	{
		PrintWriter out=hrp.getWriter();
		hrp.setContentType("text/html")		;
		
		Enumeration en=this.getServletContext().getServlets();
		while(en.hasMoreElements())
		{
			out.println(en.nextElement());
		}
		

		out.close();
		
		
	}
	
}
