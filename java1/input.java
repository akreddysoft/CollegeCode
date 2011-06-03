//program to demonstrate various methods of reading

import java.io.*;
class input
{
	
	public static void main(String args[])
	{
		byte cr[]=new byte[10];
		char ch;
		int n;
		String str;
	
		BufferedInputStream br=new BufferedInputStream(System.in);
		//BufferedReader br1=new BufferedReader(System.in);		//this is wrong there is no such constructor
		BufferedReader br1=new BufferedReader(new InputStreamReader(System.in));		
		
		try
		{
			//read a single char
			n=br1.read();
			System.out.println(n);
			
			/*do
			{
				ch=(char)br.read();
				System.out.println(ch);	//this output shows that it is line buffered
			}
			while(ch!='q');*/
			
			
			//reading a string
			str=br1.readLine();
			System.out.println(str);
			
			
			
		}
		
		catch(IOException e)
		{
			System.out.println("exception "+e);
		}
		
	}
}

	
	