import javax.servlet.http.*;
import java.io.*;
import javax.servlet.*;
import java.util.*;

/** program to check the persistence of a servlet */

public class Counter extends HttpServlet
{
	
	String header="<html>\n"+
				  "<body>";
	String footer="</body>\n"+
				  "</html>";
				  
	int cnt=0;
	static int classcount=0;
	static Hashtable instance=new Hashtable();

	public void doGet(HttpServletRequest hrq, HttpServletResponse hrp) throws IOException,ServletException
	{
		int counter=0;
			PrintWriter out=hrp.getWriter();		
		out.println(header);
		
		out.println("<h2> since loading, this servlet instance has been acessed The global counter :"+cnt+"</h2>");
		//out.println("<h2> since loading, this servlet instance has been acessed The local counter :"+counter+"</h2>");
		instance.put(this,this);
		out.println("<h3>there are currently "+instance.size()+ " instances</h3>");
		
		out.println("<h1>across all instances, this servlet class has been(static) "+classcount +" times</h1>");
		out.println(footer);
		
		cnt++;
		counter++;
		classcount++;
	
		out.close();
		
		
	}
	
}