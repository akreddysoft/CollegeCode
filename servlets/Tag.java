import javax.servlet.http.*;
import java.io.*;
import javax.servlet.*;


public class Tag extends HttpServlet
{
	
	public void doGet(HttpServletRequest hrq, HttpServletResponse hrp) throws IOException,ServletException
	{
		PrintWriter out=hrp.getWriter();
		FileWriter fw=new FileWriter("c:\\debug.txt");
		BufferedWriter bw=new BufferedWriter(fw);
		
		String line;
		BufferedReader in=hrq.getReader();
		
		hrp.setContentType("text/html");
		while((line=in.readLine())!=null)
		{
			fw.write(line);
			line=replace(line,"madhur","ahuj");
			out.println(line);
			fw.write(line);
				out.println("madhur1");
		
		}
	
		fw.close();
		out.close();
	}


	private String replace(String line,String old,String newl)
	{
		int index=0;
		while((index=line.indexOf(old,index))>=0)
		{
			line=line.substring(0,index)+newl+line.substring(index+old.length());
			index+=newl.length();
		}
		return line;
	}

}


