import javax.servlet.http.*;
import java.io.*;
import javax.servlet.*;
import java.util.*;

public class formservlet extends HttpServlet
{
	
	String header="<html>\n"+
				  "<body>";
	String footer="</body>"+
				  "</html>";
				  
								
	public void doGet(HttpServletRequest hrq, HttpServletResponse hrp) throws IOException,ServletException
	{
		PrintWriter out=hrp.getWriter();
		hrp.setContentType("text/html");
		
		out.println(header);
		out.println("<h1>"+hrq.getParameter("name")+"</h1>");
		showinfo(hrq,out);
		out.println(footer);
		out.close();
		
		
	}
	
	public void doPost(HttpServletRequest hrq,HttpServletResponse hrp) throws IOException,ServletException
	{
		
		byte arr[]=new byte[20];
		PrintWriter out=hrp.getWriter();
		hrp.setContentType("text/html");
		out.println(header);
		
		out.println("<h1>"+hrq.getParameter("marks")+"</h1>");
	//	BufferedReader br=hrq.getReader();
		ServletInputStream ss=hrq.getInputStream();
		ss.read(arr,0,hrq.getContentLength());
		
		out.println("data:");
		
		for(int i=0;i<hrq.getContentLength();++i)
		System.out.println(Integer.toString(arr[i] & 0xff, 16).toUpperCase());
		
		
		showinfo(hrq,out);
		out.println(footer);
		
	
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
		out.println("<br>scheme: "+hrq.getScheme()+"<br> getcontentlength"+hrq.getContentLength());;
		out.println("<br>contenettype "+hrq.getContentType()+"<br>");
		
		Enumeration en=hrq.getParameterNames();
		while(en.hasMoreElements())
		{
			String name=(String)en.nextElement();
			String values[]=hrq.getParameterValues(name);
			if(values!=null){
				for(int i=0;i<values.length;++i){
					out.println(name +" ("+i+"): "+values[i]);
					
				}
			}
		}
		
		
	}
}