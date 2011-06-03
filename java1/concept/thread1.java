 class Point {      //redefines class Point from package java.awt
     private float x, y;   //OK since we're in a different package here
 
     public float x() {        // needs no synchronization
         return x;
     }
 
     public float y() {        // ditto
         return y;
     }
    // . . .    // methods to set and change x and y
 }
 
class UnsafePointPrinter {
     public void print(Point p) {
     	
     	int safex=p.x();
     	int safey=p.y();
     	
         System.out.println("The point's x is " + safex
                                 + " and y is " + safey + ".");
     }
     
     
     
    public void setXAndY(float  newX,  float  newY) {
        x = newX;
        y = newY;
    }

 }
