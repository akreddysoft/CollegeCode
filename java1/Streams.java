import java.io.*;


class Streams
{
	
	public static void main(String args[])
	{
		doio d=new doio();
		d.dotest1();

	}
}


class doio
{
	
	public void  dotest() 
	{
		byte[]  buffer = new byte[1024];
		FileInputStream s=null;		
		//InputStream s =new ByteArrayInputStream(buffer);
		BufferedInputStream br=null;
		try
		{
		
			 s=new FileInputStream("madhur.txt");
			 br=new BufferedInputStream(s);
		}
		catch(FileNotFoundException e)
		{
			System.out.println("file not found");
		}
		
		try
		{
		
			System.out.println(br.available());
			//System.out.println(s.read(s));

			if(br.markSupported())
			{
				System.out.println(br.read());System.out.println(br.read());System.out.println(br.read());
				br.mark(100);
				System.out.println(br.read());System.out.println(br.read());System.out.println(br.read());
				br.reset();
				System.out.println(br.read());System.out.println(br.read());System.out.println(br.read());
				br.reset();
				System.out.println(br.read());System.out.println(br.read());System.out.println(br.read());
				
			}

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}
	
	
	public void dotest1()
	{
		try
		{
		
			FileOutputStream fo=new FileOutputStream("madhur1.txt") ;
		
			
			fo.write(new byte[]{44,44,44});
			
			DataOutputStream doo=new DataOutputStream(fo);
			

			doo.writeChars("madhur");
			doo.writeInt(4);
			
			fo.close();
			doo.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
}