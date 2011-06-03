import java.io.*;
import java.util.*;
import javax.servlet.http.*;
import javax.servlet.*;

public class PostData extends HttpServlet
{
	
	public void doPost(HttpServletRequest hrq,HttpServletResponse hrp) throws ServletException,IOException
	{
		hrp.setContentType("text/html");
		PrintWriter out=hrp.getWriter();
		
		if("application/x-www-form-urlencoded".equals(hrq.getContentType()))
		{
			Enumeration enum1=hrq.getParameterNames();
			
			while(enum1.hasMoreElements())
			{
				String name=(String)enum1.nextElement();
				String values[]=hrq.getParameterValues(name);
				if(values!=null)
				{
					for(int i=0;i<values.length;++i)
					{
						out.println(name + " ("+i+"): "+values[i]);
					}
				}
			}
		}
		
	
	}
}
