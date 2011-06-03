import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;


public class RqDisp extends HttpServlet
{
	
	public void doGet(HttpServletRequest hrq,HttpServletResponse hrp) throws ServletException,IOException
	{
		
		PrintWriter pw=hrp.getWriter();
		pw.println("hello ahuja");
		RequestDispatcher rd=getServletContext()	.getRequestDispatcher("/servlet/");
		//rd.forward(hrq,hrp);
	//	rd.include(hrq,hrp);
			rd.forward(hrq,hrp);
		pw.println("hello madhur");
	
	
				
	}
}