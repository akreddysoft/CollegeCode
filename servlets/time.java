import javax.servlet.http.*;
import java.io.*;
import javax.servlet.*;
import java.util.*;

public class time extends HttpServlet
{
	
	String header="<html>\n"+
				  "<body>";
	String footer="</body>"+
				  "</html>";
				  
								
	public void doGet(HttpServletRequest hrq, HttpServletResponse hrp) throws IOException,ServletException
	{
		PrintWriter out=hrp.getWriter();
		
		
	
		
		Date date=new Date();
		
		
		out.println("<h1>"+"dsf"+"</h1>");
	
	
		out.close();
		
		
	}
	
	void showinfo(HttpServletRequest hrq,PrintWriter out)
	{
		out.println("<br>Query string: "+hrq.getQueryString())	;
		out.println("<br>path info: "+hrq.getPathInfo());
		out.println("<br>request uri "+hrq.getRequestURI());
		out.println("<br>class "+hrq.getClass()+"<br>server name "+hrq.getServerName()+"<br>port: "+hrq.getServerPort());
		out.println("<br>proto: "+ hrq.getProtocol());
		out.println("<br>remote addr: "+hrq.getRemoteAddr());
		out.println("<br>sess id "+hrq.getRequestedSessionId()+"<br>Attribute"+hrq.getAttribute("df"));
		out.println("<br>cookies "+hrq.getCookies());
		out.println("<br>scheme: "+hrq.getScheme());
		
		
	}
}