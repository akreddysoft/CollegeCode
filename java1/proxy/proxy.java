import java.net.*;
import java.util.*;
import java.io.*;
import java.util.regex.*;

class Proxy
{
	public static void main(String args[])
	{
		new Start();
	}
}


class Start
{
	private ServerSocket mainsocket;
	
	Start()
	{
		
		try
		{

			mainsocket=new ServerSocket(4000,10,InetAddress.getByName("0.0.0.0"));
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
		
		try
		{
		
			Enumeration interfaces=NetworkInterface.getNetworkInterfaces();
			System.out.println("Enumerating interfaces...");
			
			while(interfaces.hasMoreElements())
			{
				System.out.println(interfaces.nextElement());
				NetworkInterface iff=(NetworkInterface)interfaces.nextElement();
				Enumeration i=iff.getInetAddresses();
//				while(iff.hasMoreElements())
				{
					System.out.println(iff.toString());
					
				}
			}
			System.out.println("Listening on ...0.0.0.0");
			while(true)
			{
			
				Socket clientsocket=mainsocket.accept();
				new handleclient(clientsocket);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
}


class handleclient extends Thread
{
	
	private Socket clientsocket;
	
	handleclient(Socket clientsock)
	{
		this.clientsocket=clientsock;
		this.start();				
	}
	
	
	public void run()
	{
		
		System.out.println("Incoming connection from : " +clientsocket.getInetAddress().toString());
		System.out.println("Port : " +clientsocket.getPort());
		try
		{
				
			BufferedReader br=new BufferedReader(new InputStreamReader(clientsocket.getInputStream()));
			PrintWriter pw=new PrintWriter(clientsocket.getOutputStream());
			int i=0;
			String line[]=new String[100];
			while(true)
			{
				
				line[i++]=br.readLine();
				System.out.println(line[i-1]);
				if(line[i-1].equals(""))
					break;	
			}
		


			String gethost=null,host=null,url=null;
			try
			{
			 	boolean flag=false;
			 	for(int ii=0;ii<line.length;++ii)
			 	{
			 		if(line[ii].startsWith("Host: "))
			 		{
			 				gethost=line[ii];
			 				flag=true;
			 				break;
			 		}
			 		
			 	}
				
				if(flag==false)
					throw new HeaderError();
					
				host=gethost.substring("Host: ".length());
				System.out.println(host);
				if(line[0].substring(0,3).equals("GET"))
					url=line[0].substring(0,3)+" "+line[0].substring("GET http://".length()+host.length());
				else
					url=line[0].substring(0,4)+" "+line[0].substring("GET http://".length()+host.length());
				System.out.println(url);
			
			}
			
			
			catch(HeaderError e)
			{
				System.out.println("header error");
				return;
			
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			
		
			WebConnection web=new madhursconnection(host,url);
			ArrayList mylist=web.getData();
			for(int ii=0;ii <mylist.size();++ii)
			{
				
				String line1=(String)mylist.get(ii);
				pw.println(line1);
				
			}
		
			
			br.close();
			pw.close();
			
		}		
		
		catch(Exception e)
		{
			e.printStackTrace();
		}

	}
}


interface WebConnection
{
	ArrayList getData();	
}


class madhursconnection implements WebConnection
{
	
	private String host,url;
	private Socket sock;
	private ArrayList al=new ArrayList();
	
	madhursconnection(String host,String url)
	{
		
		this.host=host;
		this.url=url;
		
		handle();
	}
	
	public void run() 
	{


	}
	
	public ArrayList getData()
	{
		return al;
	}
	
	private ArrayList handle() 
	{
	
		InetAddress ipad=null;
		
		System.out.println(host);
		try
		{
		 	ipad=InetAddress.getByName(host);
		}
		catch(UnknownHostException e)
		{
			
			System.out.println("dns error");
			al.add("HTTP/1.1 200 OK");
			al.add("Connection: close");
			al.add("Content-type: text/html");
			al.add("");
			
			al.add("<html>");
			al.add("<body>");
			al.add("<h1> Unable to resolve " + host +"</h1>");
			al.add("</body>");
			al.add("</html>");
			
			return al;
			
		}
		try
		{
			
			sock=new Socket(ipad,80);
			InputStream is=sock.getInputStream();
			BufferedReader br=new BufferedReader(new InputStreamReader(sock.getInputStream()));
			PrintWriter pw=new PrintWriter(sock.getOutputStream());
			
			pw.println(url);
			pw.println("User-Agent: Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)");
			pw.println("");
			pw.flush();
				
			String line;
		
			while(true)
			{
				line=br.readLine();	//this data can be either binary or text
				System.out.println(line);
				if(line==null)
					break;
				al.add(line);
			}
		}
		
		catch(ConnectException e)
		{
			//e.printStackTrace();
			System.out.println("connect timeout");
			al.add("HTTP/1.1 200 OK");
			al.add("Connection: close");
			al.add("Content-type: text/html");
			al.add("");
			
			al.add("<html>");
			al.add("<body>");
			al.add("<h1> Unable to connect " + host +"</h1>");
			al.add("</body>");
			al.add("</html>");
			
			return al;			
		}
		
		catch(Exception e)			
		{
			e.printStackTrace();
		}
		
		return al;
	}
	
}


class HeaderError extends Throwable
{
	
	
	
}