import java.io.*;
import java.util.*;

public class files
{
	RandomAccessFile rf;
	StringTokenizer st;
   	int count;
   	files()
   	{
   		count=0;
   	}

	public static void main(String args[]) 
	{
	files f=new files();
	int c=0;
	
	BufferedReader b=new BufferedReader(new InputStreamReader(System.in));
     //c=Integer.parseInt(b.readLine())
    System.out.println("1. Enter...");
    System.out.println("2. Print...");
    System.out.println("3.Delete...");
	
		 do
		{
		   
    switch(c)
			{
		case 1:

	                    System.out.println("ENTERING STUDENT DETAILS");
	                    f.add();
						break;

       case 2:     System.out.println("DISPLAYING STUDENT INFORMATION");
	                   f.read();
                        break;
 
    /*  case 3:    System.out.println("MODIFYING STUDENT DATABASE");
                       d.modify();
					   break;
					   */
       case 3:    System.out.println("DELETING FROM  STUDENT DATABASE");
                       f.delete();
					   break;
    
			}
		System.out.println("Enter your choice...\n");
		try
			{
		c=Integer.parseInt(b.readLine());
			}
			catch(IOException e)
			{
				System.out.println("");
			}
			catch(NumberFormatException n)
			{
				System.out.println("");
			}
		}while(c!=0);

}

	public void add()
	{

		try
		{
			//unt
		 rf=new RandomAccessFile("c:\\ran.asm","rw");
		 long length=rf.length();
		 
		 rf.seek(length);
		 
		 char []mname=new char[40];
		 
		 for(int i=0;i<20;++i)
		 {
		 	mname[i]='a';
		 }
	
		 
		 
	
	// BufferedReader choice=new BufferedReader(new InputStreamReader(System.in));
		 	int ch;
    		do
			{
			 System.out.println("Enter the student details ");
			// rf.seek(count * rf.length());
			BufferedReader br=new BufferedReader(new InputStreamReader(System.in));
			 String str=br.readLine();
		
			 st=new StringTokenizer(str,":");
		    //  while(st.hasMoreTokens())
			//		{
		         // rf.seek(count * rf.length());
		        //
		          //stem.out.println(count*rf.length());
		          //System.exit(0);
		          String s=(String)st.nextToken();
		          
		          //s.getChars(0,s.length()-1,mname,0);
		        //  mname=s.toCharArray();
		        for(int i=0;i<s.length();++i)
		        {
		        	mname[i]=s.charAt(i);
		        }
		 
		 	for(int i=s.length();i<20;++i)
		 	{
		 		try{
		 		
		 		mname[i]=0;
		 		}
		 		catch(Exception e){
		 			System.out.println("madhur:" + i);
		 		}
		 		
		 	}
		 	
		for(int i=0;i<20;++i)
		 {
		// 	System.out.println(mname[i]);
		 }
		         // mname[s.length()-1]=0;
		          
				  //rf.writeChars(s);
				 
				 for(int i=0;i<20;++i)
		 {
		
					rf.writeChar(mname[i]);
		 }
		
		//		  rf.write(mname);
				  
				  int roll=Integer.parseInt(st.nextToken());
		          rf.writeInt(roll);
		          int age=Integer.parseInt(st.nextToken());
				  rf.writeInt(age);
				  count++;
				  System.out.println(rf.length());
		      //      }
					System.out.println(count+"record written");
					BufferedReader b=new BufferedReader(new InputStreamReader(System.in));
					 ch=Integer.parseInt(b.readLine());
					 
					 
				}while(ch!=0);
        }
	catch(Exception e)
		{
		e.printStackTrace();
	}

	}

	public void read()
	{
		
		byte mad[]=new byte[48];
		char name[]=new char[20];
		  try
		{
         RandomAccessFile rf1;
          rf1=new RandomAccessFile("c:\\ran.asm","r");
		  long length=rf1.length();
		  long records=length/48;
		  //rf1.seek(0);
          String str;
		  //FileDescriptor fd=rf1.getFD();
		  //rf1.
		  //rf1.read(mad,0,48);
		  int j=0;
		  while(j<records)
		  {
			  
			  for(int i=0;i<20;++i)
			  	name[i]=rf1.readChar();
			  	
			  System.out.println(name);
			  
			
				//System.out.println(mad);
				//String s=  
			  //StringTokenizer st=new  StringTokenizer(str,":");
			//  while(st.hasMoreTokens())
				
				//  String s= rf1.readUTF();
		//		  System.out.println("Student name:-"+s);
				   int roll=rf1.readInt();
	              System.out.println("Student roll no:-"+roll);
	              int age=rf1.readInt();
	              System.out.println("Student age:-"+age);
				  System.out.println("\n");
				  ++j;
	//	}
         //rf1.seek(rf.length());
		}
		
		}
		catch(Exception e)
		{
		}
	}
 
  public void delete()
	{
	   
	     String name=null;
		 int roll1=0;
		 int age1=0;
     	
	     try
		{
			 System.out.println("a");
          RandomAccessFile rf1;

		  int counts=0; 
         
		 	 rf1=new RandomAccessFile("c:\\ran.asm","r");
                    
          rf1.seek(0);
         System.out.println("Enter the record details to be deleted");
         BufferedReader bf=new BufferedReader(new InputStreamReader(System.in));
		 String str1=bf.readLine();
         st=new StringTokenizer(str1,":");
		
		  while(st.hasMoreTokens())
		{
			   name=(String)st.nextToken();
			   roll1=Integer.parseInt(st.nextToken());
			   age1=Integer.parseInt(st.nextToken());
		}
		      System.out.println("Entered record"+"                "+name+" " +roll1+" "+age1);
                
		        
		  String str;
		   while((str=rf1.readLine())!=null)
		  { 
			     
			    
		       String s=  rf1.readUTF();
			    int roll=rf1.readInt();
                int age=rf1.readInt();
        
			if((s.equals(name)) && (roll==roll1) && (age==age1))
			{
				System.out.println("record found at position "+count++);
				}
			else
			  {
					System.out.println("record not available");
			
			  }
			  
			rf1.seek(rf1.length());

		}
		}
		
	catch(Exception e)
		{
		System.out.println(e);
	    e.printStackTrace();
		}
		
		}
		}
	
				 
	    /*        void check(String n,int r,int a)
	{
				   System.out.println("a");
			  try
		{
				RandomAccessFile	 rf1=new RandomAccessFile("d:\\random.asm","r");
                    
                 rf1.seek(0);
                 
		  String str;
		   while((str=rf1.readLine())!=null)
		  { 
			     
			    
		       String s=  rf1.readUTF();
			    int roll=rf1.readInt();
                int age=rf1.readInt();
        
			if((s.equals(n)) && (roll==r) && (age==a))
			{
				System.out.println("record found at position "+count++);
				}
			else
			  {
			System.out.println("record not available");
			
			  }
			  
			rf1.seek(rf1.length());

		}
		}
	catch(Exception e)
		{
		}
	}*/

