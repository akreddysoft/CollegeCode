import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.util.*;
//see getheader.html for extension
public class GetHeader1 extends HttpServlet
{
	
	public void doGet(HttpServletRequest hrq,HttpServletResponse hrp) throws ServletException,IOException
	{
		//InputStream is=hrq.getInputStream();
		PrintWriter pw=hrp.getWriter();
		hrp.setContentType("text/html");
		//BufferedReader br=new BufferedReader(new InputStreamReader(is));
		BufferedReader br=hrq.getReader();
		pw.println("<body>");
		while(true)
		{
			String line=br.readLine();
			if(line==null)	break;
			pw.println(line);
			pw.println("<br>");
		}
		
		Enumeration pr=hrq.getParameterNames();
		while(pr.hasMoreElements())
		{
			pw.println(pr.nextElement());
			pw.println("<br>");
		}
		
		
		pw.println("</body>");
		pw.close();
	
		
	
	}
	
	public void doPost(HttpServletRequest hrq,HttpServletResponse hrp) throws ServletException,IOException
	{
		doGet(hrq,hrp);
		
		
	}

}