import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;


public class context extends HttpServlet
{
	
	public void doGet(HttpServletRequest hrq,HttpServletResponse hrp) throws ServletException,IOException
	{
		
		PrintWriter pw=hrp.getWriter();
		HttpSession hs=hrq.getSession(true);
		pw.println(hs.getId());
		getServletContext().setAttribute("madhur","ahuja1");
	
	
				
	}
}