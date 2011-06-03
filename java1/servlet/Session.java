import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;


public class Session extends HttpServlet
{
	HttpSession session=null;
	static int a=4;
	public void doGet(HttpServletRequest hrq,HttpServletResponse hrp) throws ServletException,IOException
	{
		
		
		PrintWriter pw=hrp.getWriter();
		 session=hrq.getSession(true);
		pw.println(session.getId());
		pw.println("<br>"+a);
		pw.close();
		//session.invalidate();
		a++;
		
	}
	
	
	
}