
import java.io.*;

import java.awt.Dimension;
import javax.swing.*;
class superclass
{
	String name;
	
	superclass(String name)
	{
		this.name=name;
		
	}
	
	
	
}

/*
class subclass extends superclass
{
	
	subclass(String name)
	{
		
	}
}

*/

/*
I assume you have a super-class in which you have written one or more
constructors which have parameters - and you have not written a constructor
which takes no parameters.

(If you did not write any constructors at all then your super-class will
actually have a no-parameter constructor: the default constructor).

When you write your subclass then the first statement in your subclasses
constructor(s) must be a call to a super constructor. If you don't write a
call to a super constructor then a call to super() is automatically made -
ie a call to a parameterless constructor in the super-class. If your
super-class has no parameterless constructor then you get a compilation
error.

So you either do need to have a no-parameter constructor in your
super-class, or make sure that the constructor(s) in your subclass make the
appropriate super(...) call.

*/

/*

class FileInfo {


  public static void main(String[] args) {

    for (int i = 0; i < args.length; i++) {
      File f = new File(args[i]);
      if (f.exists()) {
        System.out.println("getName: " + f.getName());
        System.out.println("getPath: " + f.getPath());
        System.out.println("getAbsolutePath: " + f.getAbsolutePath());
        try {
          System.out.println("getCanonicalPath: " + f.getCanonicalPath());
        }
        catch (IOException e) {
        }
        System.out.println("getParent: " + f.getParent());
        if (f.canWrite()) System.out.println(f.getName() + " is writable.");
        if (f.canRead()) System.out.println(f.getName() + " is readable.");
        if (f.isFile()) {
           System.out.println(f.getName() + " is a file.");
        }
        else if (f.isDirectory()) {
          System.out.println(f.getName() + " is a directory.");
        }
        else {
          System.out.println("What is this?");
        }
        if (f.isAbsolute()) {
          System.out.println(f.getName() + " is an absolute path.");
        }
        else {
          System.out.println(f.getName() + " is not an absolute path.");
        }
        try {
          System.out.println("Last Modified" + f.lastModified());
          System.out.println(f.getName() + " is " + f.length() + " bytes.");
          System.out.println(f.getName() + " is " + f.length() + " bytes.");
        }
        catch (IOException e) {
        }

      }
      else {
         System.out.println("I'm sorry. I can't find the file " + args[i]);
      }

    }

  }

} 
*/

/*
To be able to catch a checked exception
a method inside the try block must declare that it throws that exception
(or one derived from it).

File.lastModified() is not declared to throw any exceptions.

You can completely omit the try/catch block around those three lines
or you can replace that empty catch block with an empty finally block.

Note: Empty (and uncommented) catch blocks are commonly frowned upon.
*/



class ShowJOptionPane
{
   public static void main(String[] args)
   {
     JPanel pnl = new JPanel();

     JLabel lblText = new JLabel("Components:");
     pnl.add(lblText);

     DefaultListModel lstCompModel = new DefaultListModel();
     lstCompModel.addElement("foo  1");
     lstCompModel.addElement("bar  2");
     lstCompModel.addElement("baz  3");
     lstCompModel.addElement("foo  4");
     lstCompModel.addElement("bar  5");
     lstCompModel.addElement("baz  6");
     lstCompModel.addElement("foo  7");
     lstCompModel.addElement("bar  8");
     lstCompModel.addElement("baz  9");
     lstCompModel.addElement("foo 10");
     lstCompModel.addElement("bar 11");
     lstCompModel.addElement("baz 12");
     lstCompModel.addElement("foo 13");
     lstCompModel.addElement("bar 14");
     lstCompModel.addElement("baz 15");
     lstCompModel.addElement("foo 15");
     lstCompModel.addElement("bar 16");
     lstCompModel.addElement("baz 17");

     JList lstComp = new JList(lstCompModel);
     Dimension dim = lstComp.getPreferredSize();
     dim.width = 300;
     lstComp.setPreferredSize(dim);

     JScrollPane scrollListComp = new JScrollPane(lstComp);
     pnl.add(scrollListComp);

     int option =
       JOptionPane.showConfirmDialog(
         null,
         pnl,
         "Selecteer een component",
         JOptionPane.OK_CANCEL_OPTION);

     if (option == JOptionPane.OK_OPTION)
     {
       Object selectedItem = lstComp.getSelectedValue();
       // or:
//       file://Object[] selectedItems = lstComp.getSelectedValues();
     }
   }
}
