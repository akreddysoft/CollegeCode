import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class snoop extends HttpServlet
{
	public void doGet(HttpServletRequest req,HttpServletResponse hrp) throws ServletException,IOException
	{
		hrp.setContentType("text/html");
		PrintWriter out=hrp.getWriter();
		
		HttpSession hs=req.getSession(true);
		
		Integer count=(Integer)hs.getValue("snoop.count");
		if(count==null)
			count=new Integer(1);
		else
			count=new Integer(count.intValue()+1);
		
		hs.putValue("snoop.count",count);
			
		out.println("<html><head><title>SessionSnoop</title></head>");
		out.println("<body><h1>Session snoop</h1>");
		
		out.println("you have visited this page " + count +
		((count.intValue()==1) ? "time.":" times."));
		
		out.println("<p>");
		
		out.println("<h3>Here is your saved session data</h3>");
		String [] names=hs.getValueNames();
		for(int i=0;i<names.length;++i)
		{
			out.println(names[i] + ": "+ hs.getValue(names[i])+" <br>");
		}
		
		out.println("<h3>Here are some vital stats on your session</h3>");
		out.println("Session id:"+hs.getId()+"<br>");
		
		out.println("new session : " + hs.isNew()+"<br>");
		out.println("Creation time : "+hs.getCreationTime());
		out.println("<i>("+new Date(hs.getCreationTime())+")</i><br>");
		out.println("Last access time : "+hs.getLastAccessedTime());
		out.println("<i>("+new Date(hs.getLastAccessedTime())+")</i><br>");
		
		out.println("requested session id from cookie: "+req.isRequestedSessionIdFromCookie()+"<br>");
		out.println("requested session id from url:"+req.isRequestedSessionIdFromUrl()+"<br>");
		out.println("requested session id valid:"+req.isRequestedSessionIdValid()+"<br>");
		
		out.println("<h3>Here are all the current session ids");
		out.println("and the times they ve hit this page</h3>");
		
		HttpSessionContext context=hs.getSessionContext();
		Enumeration ids=context.getIds();
		
		while(ids.hasMoreElements())
		{
			String id=(String)ids.nextElement();
			out.println(id+":");
			HttpSession fs=context.getSession(id);
			Integer fc=(Integer)fs.getValue("snoop.count");
			if(fc==null)
				out.println(0);
			else
				out.println(fc.toString());
			out.println("<br>");
		}
		
		out.println("<h3>Test url rewriting</h3>");
		out.println("click <a href=\""+hrp.encodeUrl(req.getRequestURI())+"\">here</a>");
		out.println("to test that session tracking works via URL");
		out.println("rewriting even when cookies arent supported");
		out.println("</body></html>");
	}
}
