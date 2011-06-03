import java.io.*;

public class serial3b
  {
  	
  	private int ttype;
  	 //static int ch;
 	 private  StreamTokenizer tokenizer = new StreamTokenizer(new BufferedReader(new InputStreamReader(System.in)));
  	 
  	 
  	 public static void main(String args[])
  	   {
  	   	serial3b sr = new serial3b();
  	   
  	   	  
  	   	 while(true)
  	   	  {
  	   	  int ch = sr.menu();
  	   	   switch(ch)
  	   	     {
  	   	  	
  	   	  	   case 1:
  	   	  	     sr.add();
  	   	  	     break;
  	   	  	     
  	   	  	   case 2:
  	   	  	       sr.display();
  	   	  	       break;
  	   	  	       
  	   	  	   case 3:
  	   	  	       break;
  	   	  	       
  	   	  	   case 4:
  	   	  	       System.exit(0);     
  	   	     }
  	   	     
  	   	
          }
  	   }
  	   
  	   
  	   public int readToken()
 	   {
         try 
           {
              
       	  ttype = tokenizer.nextToken();
 	   	  return ttype;
 	   	   } catch(IOException e) 
 	   	     {
 	   	     	  e.printStackTrace(System.err);
 	   	     	  System.exit(1);
 	   	     }
 	   	  return 0;   
 	   }
 	   
 	   public int readInt()
 	    {
 	   	  if(readToken() == tokenizer.TT_NUMBER)
 	   	     {
 	   	     	 return (int) tokenizer.nval;
 	   	     	 
 	   	     }
 	   	  return 0;
 	    }
 	   
 	  public String readString() throws InvalidUserInputException
 	    {
 	   	   if(readToken() == tokenizer.TT_WORD)
 	   	     {
 	   	     
 	   	     return tokenizer.sval;
 	   	     }
 	   	   
 	    else
 	         { 
 	            throw new InvalidUserInputException(" readString() failed");
 	            
 	         } 
 	    }  
 	    
 	       
 	   
 	   public int menu()
 	    {
 	    	
 	    	System.out.print("         MENU      ");
 	    	System.out.print("\n1. ADD ");
 	    	System.out.print("\n2. Display");
 	    	System.out.print("\n2. Delete ");
 	    	System.out.print("\n3. Edit ");
 	    	System.out.print("\n4. Exit ");
 	    	System.out.print("\n\n enter ur choice:    ");
 	    	
 	    	return readInt();
 	    	
 	    }
 	    
 	   public void add()
 	    {
 	    	 System.out.println("\nADDDD");
 	    	 FileOutputStream fos = null;
 	    	 ObjectOutputStream oos = null;
 	    	 try
 	    	  {
 	    	  
 	    	  System.out.println("\n Enter the name :  ");
 	    	 String name = readString();
 	    	  System.out.println("\n Enter the roll no : ");
 	    	  
 	    	  int roll = readInt();
 	    	   MyClass obj1 = new MyClass(name, roll);
  	   	        
  	   	         fos = new FileOutputStream("serial33.txt",true);
  	   	         oos = new ObjectOutputStream(new BufferedOutputStream(fos));
  	   	        oos.writeObject(obj1);
  	   	        //oos.flush();
  	   	        
  	   	        
  	   	        
  	   	   } catch( IOException e) {
  	   	   	e.printStackTrace(System.err);
  	   	   	System.out.println("exception" + e);
  	   	   	System.exit(1);
 	    	   }
 	       catch (InvalidUserInputException e)
   	         {
   	      	 System.out.print(" InvalidUser exception" +e.getMessage());
   	         }    
 	    	   
 	    	 try
 	    	  {
 	    	  	
 	    	  	oos.close();
  	   	        fos.close();
 	    	  }  catch(IOException e) {
 	    	  	
 	    	  	e.printStackTrace(System.err);
  	   	   //	System.out.println("exception" + e);
  	   	   	System.exit(1);

 	    	  }
 	   
 	    } 
 	    
 	public void display()
 	  {
 	  	FileInputStream fis = null;
 	  	ObjectInputStream ois = null;
 	  	 MyClass obj2 =null;
 	  	try 
  	   	     {
  	   	     	 
  	   	     	
  	   	        fis = new FileInputStream("serial33.txt");
  	   	     	  ois = new ObjectInputStream(new BufferedInputStream(fis));
  	   	     	 while(true)
  	   	     	  {
  	   	     	  
  	   	     	 obj2 = (MyClass)ois.readObject();
  	   	     	 System.out.println(" \nobject is" +obj2);
  	   	     	  }
  	   	     	 
  	   	     	
  	   	     	 
  	   	     } catch(ClassNotFoundException e)
  	   	       {
  	   	       	e.printStackTrace(System.err);
  	   	       	System.exit(1);
  	   	       }
  	   	       
  	   	       catch(EOFException e)
  	   	       {
  	   	       	
  	   	       	System.out.println("EOF reached");
  	   	       } 
  	   	     catch(IOException e)
  	   	       {
  	   	       	e.printStackTrace(System.err);
  	   	       	 System.out.println("Exception "+ e);
  	   	       	 System.exit(1);
  	   	       }
  	   	       
  	   	       
  	   	       try
  	   	        {
  	   	        
  	   	       	fis.close();
  	   	        ois.close();
 	  	        } catch(IOException e)
 	  	         {
 	  	         	e.printStackTrace(System.err);
 	  	         	System.exit(1);
 	  	         }
 	  
 	  	
 	  }    
  }
  
  
  class MyClass implements Serializable
    {
    	 String s;
    	 int i;
    	 
    	 public MyClass(String s,int i)
    	  {
    	  	 this.s = s;
    	  	 this.i = i;
    	  }
    	  
    	 public String toString()
    	  {
    	  	  return " s= " + s + "; i= " +i;
    	  }
    }
    
  class InvalidUserInputException extends Exception
   { 
      public InvalidUserInputException() {
      }
      
      public InvalidUserInputException(String message)
       {
       	 super(message);
       }
   }