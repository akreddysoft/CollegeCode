import java.io.*;

class MyFile
{

	private FileInputStream fis;
	private FileOutputStream fos;
	private ObjectInputStream ois;
	private ObjectOutputStream oos;
	private String filename;
	BufferedInputStream br;
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
		
			if(ois!=null)		ois.close();
			if(oos!=null)		oos.close();		
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

			br=new BufferedInputStream(fis);
			ois=new ObjectInputStream(br);
			return ois;
			
		}
		catch(EOFException e)
		{

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
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
			
		try
		{
			oos=new ObjectOutputStream(fos);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return oos;
	}
}


class NotOpenException extends Throwable
{
	
	
}

class Opened extends Throwable
{
	
	
}



class Null implements Serializable{}


class MyData extends Object implements Serializable
{
	private String name;
	private String add;
	private String tel;

	
	MyData(String name,String add,String tel)
	{
		this.name=name;this.add=add;this.tel=tel;
	
	}
	
	public String toString()
	{
		return name+":"+add+":"+tel;
	}
	
}