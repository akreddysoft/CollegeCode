import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class Info extends HttpServlet
{
	
	public void doGet(HttpServletRequest hrq,HttpServletResponse hrp) throws ServletException,IOException
	{
		
		hrp.setContentType("text/plain");
		PrintWriter out=hrp.getWriter();
		
		out.println("Request Headers:");
		out.println();
		Enumeration enum2=hrq.getHeaderNames();
		
		while(enum2.hasMoreElements()){
			String name=(String)enum2.nextElement();
			String value=hrq.getHeader(name);
			if(value!=null){
				out.println(name + ":"+value);
			}
		}
		
		
	}
}