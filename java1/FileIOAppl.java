import java.awt.Color;
import java.awt.BorderLayout;
import java.awt.event.*;
import javax.swing.*;
import java.applet.Applet;
import java.io.*;

public class FileIOAppl extends JApplet  implements ActionListener {
   JLabel text;
   JButton button;
   JPanel panel;
   JTextField textField;
   private boolean _clickMeMode = true;

   public void init(){
     getContentPane().setLayout(new BorderLayout(1, 2));
     getContentPane().setBackground(Color.white);
     text = new JLabel("Text to save to file:");
     button = new JButton("Click Me");
     button.addActionListener(this);
     textField = new JTextField(30);
     getContentPane().add(BorderLayout.NORTH, text);
     getContentPane().add(BorderLayout.CENTER, textField);
     getContentPane().add(BorderLayout.SOUTH, button);
   }
  public void start() {
     System.out.println("Applet starting.");
}

  public void stop() {
    System.out.println("Applet stopping.");
  }

  public void destroy() {
    System.out.println("Destroy method called.");
  }

  public void actionPerformed(ActionEvent event){
    Object source = event.getSource();
    if (source == button) {
      String s = null;
//Variable to display text read from file
      if (_clickMeMode) {
        try {
    //Code to write to file
          String text = textField.getText();
          String outputFileName = System.getProperty("user.home",
                                  File.separatorChar + "home" +
                                  File.separatorChar + "zelda") +
                                  File.separatorChar + "text.txt";
            FileWriter out = new FileWriter(outputFileName);
            out.write(text);
            out.close();
  
     //Code to read from file
            String inputFileName = System.getProperty("user.home",
                                 File.separatorChar + "home" +
                                 File.separatorChar + "zelda") +
                                 File.separatorChar + "text.txt";
	     File inputFile = new File(inputFileName);
             FileReader in = new FileReader(inputFile);
             char c[] = new char[(int)inputFile.length()];
             in.read(c);
             s = new String(c);
             in.close();
            } catch(java.io.IOException e) {
              System.out.println("Cannot access text.txt");
            }
//Clear text field
	  textField.setText(""); 
//Display text read from file
          text.setText("Text retrieved from file:");
          textField.setText(s);
          button.setText("Click Again");
          _clickMeMode = false;
        } else {
//Save text to file
          text.setText("Text to save to file:");
          button.setText("Click Me");
          textField.setText("");
          _clickMeMode = true;
        }
      }
    }//end action performed method
}
