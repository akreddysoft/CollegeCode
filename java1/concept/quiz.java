    class Cruncher {
         void crunch(int i)          {System.out.println("int    version");}
         void crunch(String s) {System.out.println("String _version");}
       
         public static void main(String args[ ]) {
         Cruncher crun = new Cruncher( );
         char ch = 'p';
         crun.crunch(ch);
         }
  }
    
      class HasStatic
      {
             private static int x = 100;
       
             public static void main(String args[ ])
            {
                    HasStatic hs1 = new HasStatic( );
                    hs1.x++;
                    HasStatic hs2 = new HasStatic( );
                hs2.x++;
              hs1 = new HasStatic( );
                hs1.x++;
                HasStatic.x++;
                System.out.println("x =" + x);
         }
 }
 
 
class quiz
{

//public static void main(String args[])
{

     int x = 1;
      String [ ] names = { "Fred"," Jim" , "Sheila" };
      names [--x] +=  "." ;
      for (int I = 0; I < names.length; I++) {
         System.out.println(names[I]);
      }

}
}


  