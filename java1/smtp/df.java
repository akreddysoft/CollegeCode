import javax.swing.*;
import java.util.*;
import java.text.*;

class MakeCircleEdit {

  public static void main(String[] args)  {

     String inputnumber = JOptionPane.showInputDialog(null,"Wa'z yo number bad boy?");

     boolean is_numb_ok=false;
 double input;
   do{
        try{

    input = Double.parseDouble(inputnumber); //file://if not number
//then we go to the catch statement
    is_numb_ok=true;
    }

   catch(NumberFormatException exp1){
     inputnumber = JOptionPane.showInputDialog(null,"Eh rude boy, I want a digit!");
     }

     }while(is_numb_ok!=true);
	input=input+1;
//     double degree = CircleEdit.radiansToDegrees(input); //file://ERROR
//MESSAGE HERE
     DecimalFormat f = new DecimalFormat("0.00");// file://To format the
//numbers.

    // CircleEdit c = new CircleEdit(input); //file://ERROR MESSAGE ALSO HERE
   //  double circum = c.circumference();
   //  double a = c.area();
   //  JOptionPane.showMessageDialog(null,"\nThe degree value of the radian is: " + f.format(degree) + " innit."+"\nThe cirumference is: " + f.format(circum) + " innit."+"\nThe area is: " + f.format(a) + " innit.");
  }
}

//---------------------------------------------

//To make things more readible, here is my ealier version without the
//error control, which works fine:

//---------------------------------------------
