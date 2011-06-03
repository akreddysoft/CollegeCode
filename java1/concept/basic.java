import java.io.*;

class PersonalHello {

  public static void main (String args[])
    {
  
      byte name[] = new byte[100];
      int nr_read = 0;

      System.out.println("What is your name?");
      try {
        nr_read = System.in.read(name);
        System.out.print("Hello ");
        System.out.write(name,0,nr_read);
      }
      catch (IOException e) {
        System.out.print("I'm Sorry.  I didn't catch your name.");
      }
      
    }
    
}
