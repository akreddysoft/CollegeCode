/*Problem definition : Write a program to store student database using servlets
 *
 *Name of Programmer : Madhur Ahuja
 *
 *version 			 : JDK 1.4.1_01
 *
 *Special Package    : javax.servlet.*
 *					   javax.servlet.http.*
 */


import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class GuestBook extends HttpServlet 
{
			
	public void doGet(HttpServletRequest hrq,HttpServletResponse hrp) throws ServletException,IOException
	{
		//String path=hrq.getPathTranslated();
		String guestfile="guest2.txt";
		
		
		PrintWriter pw=hrp.getWriter();
		hrp.setContentType("text/html");
		String query=hrq.getQueryString(),row[]=null;
		BufferedReader br=null;
	
		if(query==null)
		{
			
				try
		{
		
			 br=new BufferedReader(new FileReader(guestfile));
		}
		catch(FileNotFoundException e)
		{
			PrintWriter pw1=new PrintWriter(new FileOutputStream(guestfile));
			pw1.close();
			br=new BufferedReader(new FileReader(guestfile));
			
		}
		Hashtable ht=new Hashtable();
		
					pw.println(" "+
"			<html>"+
"<head>"+
"</head>"+
"<body  text=white bgcolor=black>"+

"<h1 align=left>Welcome to GuestBook</h1>"+
"<p>"+
"<p>"+

"<a href=/servlet/GuestBook?add>Sign the GuestBook</a>"+
"<p>"+

"<table width=70% border=0 align=center cellspacing=1 cellpadding=1>" );

		while(true)
		{
			String line=br.readLine();
			if(line==null)	break;
			//pw.println(line);
			row=line.split("\\|");
			for(int i=0;i<row.length;++i);
			//	pw.println("<br>"+row[i]);
			for(int i=0;i<row.length;i=i+2)
				ht.put(row[i],row[i+1]);

				
				



if(row!=null)
{


hrp.setHeader("Pragma","no-cache");
pw.println(" "+
	"<tr cellspacing=1 cellpadding=1 bgcolor=green >"+
		"<td cellspacing=1 cellpadding=1>"+
			"<table width=30% border=0>"+
			"	<tr>"+
					"<td width=20%>" +ht.get("name")+  "</td>"+
				"</tr>"+
				"<tr>"+
					"<td><a href=mailto:"+ht.get("email")+">"+ht.get("email")+"</td>"+
				"</tr>"+
				"<tr>"+
					"<td><a href="+ht.get("web")+">"+ht.get("web")+"</td>"+
				"</tr>"+
			"</table>"+
		"</td>"+

		"<td valign=top width=80%>"+
			ht.get("com")+
		"</td>"+
	"</tr>");



}



		}
				//Collection cl=ht.values();
pw.println( " "+
"</table>"+
		
		
		
"</body>"+
"</html>");

			
		}
		else if(query.equals("add"))
		{
			
			pw.println(" "+

"			<html>    " +
"<head>"+
"<script language=javascript>"+
"function test()"+
"{"+
	"var a1=new String;"+
	"a1=document.forms('guest').item('name').value;"+
	
	"if(a1==\"\")"+
	"{"+
		"alert('You must enter the name');"+
		"return false;	//return 0 will not work"+
	"}"+
	"a1=document.forms('guest').item('com').value;"+
	"if(a1==\"\")"+
	"{"+
		"alert('You must enter the comment');"+
		"return false;	//return 0 will not work"+
	"}"+

	"delete a1;"+
	"return true;"+

"}"+


"</script>"+

"</head>"+
"<body  text=white bgcolor=black>"+

"<h1 align=left>Welcome to GuestBook</h1>"+
"<p>"+
"<p>"+

"<form action=/servlet/GuestBook method=get name=guest Onsubmit='return test();'>"+
"<table width=70% border=0 cellspacing=1>"+
	"<tr  bgcolor=green text=black>"+
		"<td width=35%>Name:</td>"+
		"<td width=70%><input type=text size=40 name=name></td>"+
	"</tr>"+

"	<tr bgcolor=green>"+
		"<td>Email:</td>"+
		"<td><input type=text size=40 name=email></td>"+
	"</tr>"+

	"<tr bgcolor=green>"+
		"<td>Website:</td>"+
		"<td><input type=text size=40 name=web value=http://></td>"+
	"</tr>"+

	"<tr bgcolor=green>"+
		"<td>Comments:</td>"+
		"<td><textarea rows=10 cols=40 name=com></textarea></td>"+
	"</tr>"+
	
	"<tr bgcolor=green>"+
		"<td><input type=submit  value=submit></input></td>"+
		"<td><input type=reset value=reset></input></td>"+
	"</tr>"+
	

"</table>"+
"</form>"+

"<p>"+
"<a href=/servlet/GuestBook>Back the GuestBook</a>"+
"<p>		"+
		
		
"</body>"+
"</html>");
			
		}
		
		else
		{
			
			PrintWriter pw1=new PrintWriter(new FileOutputStream(guestfile,true));
			pw1.println("name|"+hrq.getParameter("name")+"|email|"+hrq.getParameter("email")+"|web|"+hrq.getParameter("web")+"|com|"+hrq.getParameter("com"));
			pw1.close();
			
			pw.println(" "+
			"<html>"+
"<head>"+
"<meta http-equiv=refresh content=3;URL=/servlet/GuestBook>"+
"</head>"+

"<body>"+
"<p>Thank you <b><i> "+hrq.getParameter("name")+" </i></b> for signing the guestbook.	"+
"<p>Your entry was added successfully"+
"<br>You should be transferred to the guestbook in 3 seconds."+
"<br>Click <a href=/servlet/GuestBook>here</a> if you browswer doesn't support automatic reloading."+
"</body>"+
"</html>");
			
		}
		
		pw.close();
	}
}

class GuestData
{
	private String name,comments,email,website;
	
}