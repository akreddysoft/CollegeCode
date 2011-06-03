//test class for testing streams
import java.io.*;

class MyFile
{
//	private BufferedInputStream br=null;
	private FileInputStream fis;
	private FileOutputStream fos;
	private ObjectInputStream ois;
	private ObjectOutputStream oos;
	private String filename;
	public BufferedInputStream br;
	MyFile(String filename)
	{
		this.filename=filename;
		File ff =new File(filename);
		if(ff.exists())
		;
		else
		{
			try
			{
			
				FileOutputStream fis=new FileOutputStream(filename);
				fis.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		
		
	}
	
	public void close() 
	{
		try
		{
		
			oos.close();
			oos.close();
			//ois.close();		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
			
	}
	
	public ObjectInputStream getReader()
	{
		try
		{
		
			fis=new FileInputStream(filename);
			//br=new BufferedInputStream(new FileInputStream());
			br=new BufferedInputStream(fis);
		//	System.out.println(ois);
			ois=new ObjectInputStream(br);
			//ois.close();
			//System.out.println(ois);
			return ois;
			
		}
		catch(EOFException e)
		{
			//e.printStackTrace();
			System.out.println("eof");
			return null;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
		
	
		
	}
	
	public ObjectOutputStream getWriter() 
	{
		File ff =new File(filename);
		try
		{
			
			if(ff.exists())
			{
				fos=new FileOutputStream(filename,true);	
			}
			else
			{
				fos=new FileOutputStream(filename);
				//fis.close();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
			
		//br=new BufferedInputStream(new FileInputStream());
		try
		{
			oos=new ObjectOutputStream(fos);
			oos.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	
		return oos;
	}
}


class Stream
{
	public static void main(String args[])
	{
		MyFile mf=new MyFile("test");
		mf.getWriter();
		mf.close();
	}
}