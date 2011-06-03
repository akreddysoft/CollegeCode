import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.util.*;
//see getheader.html for extension
public class GetHeader extends HttpServlet
{
	
	public void doGet(HttpServletRequest hrq,HttpServletResponse hrp) throws ServletException,IOException
	{
		InputStream is=hrq.getInputStream();
		PrintWriter pw=hrp.getWriter();
		hrp.setContentType("text/html");
	/*	BufferedReader br=new BufferedReader(new InputStreamReader(is));
		pw.println("<body>");
		//while(is.available()!=0)
		{
			pw.println(br.readLine());
			pw.println("<br>");
		}
		
		Enumeration pr=hrq.getParameterNames();
		while(pr.hasMoreElements())
		{
			pw.println(pr.nextElement());
			pw.println("<br>");
		}*/
		
		getit(hrq,hrp,pw);
	
		pw.close();
		is.close();
		
	
	}
	
	public void doPost(HttpServletRequest hrq,HttpServletResponse hrp) throws ServletException,IOException
	{
		doGet(hrq,hrp);
		
		
	}
	void getit(HttpServletRequest hrq,HttpServletResponse hrp,PrintWriter pw)
	{
		
		Enumeration headers=hrq.getHeaderNames();
		while(headers.hasMoreElements())
		{
			String head=(String)headers.nextElement();
			pw.println(head+hrq.getHeader(head));
			pw.println("<br>");
		}
		
		
	}
}