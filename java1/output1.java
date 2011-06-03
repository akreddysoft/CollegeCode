import java.io.*;

class output
{
	public static void main(String args[]) throws IOException 
	{
		int b,i;
		b='a';
		//outputting
		PrintWriter pr=new PrintWriter(System.out,true);
		FileInputStream fin;
		pr.write(b);
		pr.write('\n');	//why this doesnt work
		pr.println("this is a string");
		
		//reading file
		byte byt[]=new byte[10];
		try
		{
			fin=new FileInputStream("c:\\config.sys");
		}
		catch(FileNotFoundException e)
		{
			System.out.println("file not found " + e);		return ;
		}
		
		/*do
		{
			 i=fin.read();
			if(i!=-1) System.out.print((char)i);
		}	while(i!=-1);	*/

		fin.close();
		
		
		
	}
}
		
	