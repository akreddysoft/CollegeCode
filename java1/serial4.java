import java.io.*;

public class serial4
 {
 	 public static void main(String args[])
 	  {
 	  	 FileInputStream fis = null;
 	  	 ObjectInputStream ois = null;
 	  	 ObjectInputStream ois1 = null;
 	  	 MyClass1 obj2 =null; 
 	  	 Object obj1=null;
 	  	 BufferedInputStream br=null;
 	  	 try
 	  	  {  
 	  	     fis = new FileInputStream("serial133.txt");
 	  	  	 br=new BufferedInputStream(fis);
 	  	  	 ois = new ObjectInputStream(br);
 	  	  	 
 	  	  	 while(true)
 	  	  	 {
 	  	  	  	
 	  	  	  	obj1 = ois.readObject();
 	  	  	  	
 	  	  	  	if(obj1 instanceof marker)
 	  	  	  	{
					ois = new ObjectInputStream(br);
 	  	  	  		obj1=ois.readObject();
 	  	  	  		
 	  	  	  	}
 	  	  	  		System.out.println(obj1);
 	  	  	  	
 	  	  	  }
 	  	  	  
 	  	  } catch(ClassNotFoundException e) {
 	  	  	 e.printStackTrace(System.err);
 	  	  	 System.exit(1);
          
 	  	  } catch(EOFException e) {
 	  	  	
 	  	  	System.out.println("Eof reached");
 	  	  	//e.printStackTrace(System.err);
 	  	  	 System.exit(1);
 	  	  } catch(IOException e) {
 	  	  	e.printStackTrace(System.err);
 	  	  	 System.exit(1);
 	  	  }
 	  	  
 	  	  try
 	  	   {
 	  	   	 ois.close();
 	  	   	 fis.close();
 	  	   	 
 	  	   }catch(IOException e) {
 	  	   	e.printStackTrace(System.err);
 	  	  	 System.exit(1);
 	  	   }
 	  }
 } 