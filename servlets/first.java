import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;



public class first extends HttpServlet
{
	public void doGet(HttpServletRequest hrq, HttpServletResponse hrp) throws IOException,ServletException
	{
		String param=hrq.getParameter("name");
		hrp.setContentType("text/html");
		ServletOutputStream out = hrp.getOutputStream();
		String data="<html>"+
					"<body>"+
					"<h1>This is a servlet madhur "+param+"</h1>"+
					"</body>"+
					"</html>";
					
		
	
		//PrintWriter out=hrp.getWriter();
		out.println(data);
		out.close();
		
		
		
	}
	
	public static void main(String args[])
	{
		System.out.println("df");
	}
	
}

