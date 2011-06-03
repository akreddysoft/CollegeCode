import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;


public class context1 extends HttpServlet
{
	
	public void doGet(HttpServletRequest hrq,HttpServletResponse hrp) throws ServletException,IOException
	{
		
		PrintWriter pw=hrp.getWriter();
		pw.println(getServletContext().getAttribute("madhur"));
		pw.println(hrq.getSession(true).getId());
		
		
				
	}
}