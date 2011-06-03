import java.io.*;


class iofile
{
	public static void main(String args[])
	{
		try
		{
			DataOutputStream dd=new DataOutputStream(new FileOutputStream("c:\\test.txt"));
			dd.write(3);
			dd.write(4);
			dd.write(300);		//will not write full 2 bytes, only lower byte
			
			byte b[]=new byte[]{2,3,4
			};
			
			dd.write(b);
			
			dd.writeBoolean(true);
			
			dd.writeByte(4);
			dd.writeByte(400);		//same here, will write only one byte, although accept int
			
			dd.writeChar(7);			//will write 2 bytes here
			dd.writeChar('m');		//all char is converted to utf=16 in java
			dd.writeBytes("madhur");		//6 bytres here
			
			dd.close();
			
			PrintWriter pw=new PrintWriter(new FileWriter("c:\\test1.txt"));
			pw.print(5);	//will write 35 as hex
			
			pw.print(new iofile());		//writes toString representation
			
			pw.print("madhur");
			pw.write(55);	//will write 55 exactly. different from print
			
			pw.close();
				
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		
	}
}