import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.util.*;

public class Browser extends HttpServlet
{
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
	
	 HttpSession session=req.getSession();
     String str=req.getHeader("User-Agent");
     StringTokenizer st=new StringTokenizer(str,"/");
	 
	 PrintWriter pw=res.getWriter();
     pw.println(str);
	 pw.println("<HTML></TITLE>Browser Display</TITLE>");

     pw.println("<HEAD><BODY><H3>The Browser is" +st.nextToken()+"</H3></BODY></HEAD>");
	 pw.println("</HTML>");
     System.out.println(str);
	}
}