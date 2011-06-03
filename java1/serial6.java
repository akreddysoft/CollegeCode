import java.io.*;

public class serial6
 {
 	  FileOutputStream fos = null;
 	  FileInputStream fis = null;
 	  ObjectOutputStream oos = null;
 		File ff;
 	public serial6()
 	 {
 	 	 try
 	 	  {
 	 	  MyClass1 obj1 = new MyClass1("sasas",12);
 	 	  MyClass1 obj2 = new MyClass1("d",12);
 	 	 try
 	 	 {
 	 	 	fis = new FileInputStream("serial133.txt");
 	 	 	fis.close();
 	 	 	
 	 	 	fos = new FileOutputStream("serial133.txt",true);	
 	 	 	oos = new ObjectOutputStream(fos);
 	 		System.out.println("app");
 	 	
 	 	 }
 	 	 catch(FileNotFoundException e)
 	 	 {
 	 	 	fos = new FileOutputStream("serial133.txt");	
 	 	 	
 	 	 }
 	 	 
 	 	  
 	 	 if(oos==null) oos = new ObjectOutputStream(fos);
 	 	 
			oos.writeObject(obj1);
			oos.writeObject(obj2);
			oos.writeObject(obj1);
			
			oos.writeObject(new marker());	 
		
 	 	  
 	 	 
 	 	  }
 	 	  
 	 	   catch( IOException e) 
 	 	   {
 	 	   }
 	 	   
 	 	   try
 	      {
 	      	 oos.close();
 	      } catch(IOException e) {
 	      	
 	      } 
 	 }
 	 
 	public serial6(int i)
 	 {
 	 	 try
 	 	  {
 	 	  
 	 	 FileOutputStream fos1 = new FileOutputStream("serial33.txt",true);
 	 	  } catch(IOException e) {
 	 	  }
 	 } 
 	public static void main(String args[])
 	 { 
 	   serial6 sr = new serial6(1); 
 	    int ch =1;
 	    
 	   // while(true)
 	     {
 	     	 switch(ch)
 	     	  {
 	     	  	 case 1:
 	     	  	  serial6 sr1 = new serial6(); 
 	     	  	    
 	     	  }
 	     }
 	    
 	    
 	    
 	     
 	    
 	 }
 	 

 	 
 }
 
//  import java.io.*;
 	 
 	 class marker implements Serializable 
 	 {
 	 	
 	 	int day;
 	 }
 	 
class MyClass1 extends Object implements Serializable 
{
	
	String name;
	int roll;
	MyClass1(String a,int b)
	{
		this.name=a;
		this.roll=b;
		
	}
	
	public String toString()
	{
		return "name="+this.name+"roll="+this.roll;
	}
	

}
	

